import 'dart:async';

import 'package:animate_do/animate_do.dart' show FadeIn, FadeInUp;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/service_events_tracker.dart';
import 'package:foodly_world/data_models/reservations/reservation_message_dm.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;
import 'package:intl/intl.dart';

/// Shows a bottom sheet with the message thread for a reservation.
///
/// Blocker #5 — the sheet now polls the server for new messages while it's
/// open (see [_ReservationMessagesSheetState] for the adaptive cadence).
void showReservationMessagesSheet(
  BuildContext context, {
  required String reservationUuid,
  required String title,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ReservationMessagesSheet(
      reservationUuid: reservationUuid,
      title: title,
    ),
  );
}

class _ReservationMessagesSheet extends StatefulWidget {
  final String reservationUuid;
  final String title;

  const _ReservationMessagesSheet({
    required this.reservationUuid,
    required this.title,
  });

  @override
  State<_ReservationMessagesSheet> createState() => _ReservationMessagesSheetState();
}

/// Adaptive polling state.
///
/// We poll fast (3 s) during active conversation — the user opened the sheet
/// recently, just sent a message, just received a message, or just came back
/// from background. After [_activeWindow] without any of those, we drop to
/// slow polling (8 s) to save battery + server requests.
///
/// This mirrors the cadence of common chat apps (WhatsApp Web, Intercom,
/// Slack) and gives near-real-time perception when the user is actively
/// chatting without hammering Cloud Run when the thread is idle.
class _ReservationMessagesSheetState extends State<_ReservationMessagesSheet> with WidgetsBindingObserver {
  static const Duration _activePollInterval = Duration(seconds: 3);
  static const Duration _idlePollInterval = Duration(seconds: 8);
  // How long to stay "active" after the last activity before downshifting.
  static const Duration _activeWindow = Duration(seconds: 60);
  // Number of consecutive poll failures before surfacing a "reconnecting…" hint.
  static const int _maxSilentFailures = 3;
  // Pixels from the bottom we still consider "near the bottom" for auto-scroll.
  static const double _nearBottomThreshold = 80;

  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final _repo = di<ReservationRepo>();

  List<ReservationMessageDM> _messages = [];
  bool _isLoading = true;
  bool _isSending = false;

  Timer? _pollTimer;
  DateTime? _lastServerNow;
  DateTime _lastActivityAt = DateTime.now();
  int _consecutiveFailures = 0;
  bool _isReconnecting = false;
  // Number of new messages received while user scrolled up. Shown as a badge.
  int _unseenBelow = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_onScrollChanged);
    _loadInitial();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.removeListener(_onScrollChanged);
    _stopPolling();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Pause polling in background to save battery + avoid pointless requests.
    // Resume with an immediate poll so the user sees any missed messages the
    // instant they come back.
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _stopPolling();
    } else if (state == AppLifecycleState.resumed && mounted && !_isLoading) {
      _markActivity();
      _pollOnce();
      _startPolling();
    }
  }

  // ── Load / poll ──────────────────────────────────────────────────

  Future<void> _loadInitial() async {
    final result = await _repo.getMessages(widget.reservationUuid);

    if (!mounted) return;

    result.when(
      success: (response) {
        setState(() {
          _messages = response.messages;
          _lastServerNow = response.serverNow;
          _isLoading = false;
        });
        _scrollToBottom(animated: false);
        _startPolling();
      },
      failure: (error) {
        setState(() => _isLoading = false);
        FoodlySnackbars.errorGeneric(context, error.toString());
      },
    );
  }

  void _startPolling() {
    _stopPolling();
    final interval = _isInActiveWindow() ? _activePollInterval : _idlePollInterval;
    _pollTimer = Timer.periodic(interval, (_) => _pollOnce());
  }

  void _stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  bool _isInActiveWindow() {
    return DateTime.now().difference(_lastActivityAt) <= _activeWindow;
  }

  /// Restart the timer with the appropriate cadence. Called whenever we
  /// transition between active and idle windows, or right after activity.
  void _retuneTimer() {
    if (_pollTimer == null) return; // polling is paused (background / loading)
    _startPolling();
  }

  /// Mark "something happened" — extends the active window.
  void _markActivity() {
    _lastActivityAt = DateTime.now();
  }

  Future<void> _pollOnce() async {
    if (!mounted) return;

    final result = await _repo.getMessages(widget.reservationUuid, since: _lastServerNow);

    if (!mounted) return;

    result.when(
      success: (response) {
        _consecutiveFailures = 0;
        final wasReconnecting = _isReconnecting;

        final incoming = response.messages;
        if (incoming.isEmpty) {
          // Even with no new messages we advance serverNow so the next poll
          // window narrows as tight as possible.
          setState(() {
            _lastServerNow = response.serverNow ?? _lastServerNow;
            if (wasReconnecting) _isReconnecting = false;
          });
          // Downshift from active → idle if we've been quiet long enough.
          if (!_isInActiveWindow()) _retuneTimer();
          return;
        }

        // Dedupe: strip anything we already have. Guards against the race
        // where a message sent by this client arrives back from the server
        // between _sendMessage's optimistic insert and the next poll.
        final existingUuids = _messages.map((m) => m.messageUuid).whereType<String>().toSet();
        final fresh = incoming.where((m) {
          final uuid = m.messageUuid;
          return uuid == null || !existingUuids.contains(uuid);
        }).toList();

        if (fresh.isEmpty) {
          setState(() {
            _lastServerNow = response.serverNow ?? _lastServerNow;
            if (wasReconnecting) _isReconnecting = false;
          });
          return;
        }

        final wasNearBottom = _isNearBottom();

        setState(() {
          _messages = [..._messages, ...fresh];
          _lastServerNow = response.serverNow ?? _lastServerNow;
          if (wasReconnecting) _isReconnecting = false;
          if (!wasNearBottom) _unseenBelow += fresh.length;
        });

        // New activity bumps us back into the fast-poll window.
        _markActivity();
        _retuneTimer();

        if (wasNearBottom) {
          _scrollToBottom();
        }
      },
      failure: (_) {
        // Silent failure by design. Poll errors are usually transient
        // (flaky Wi-Fi, Cloudflare hiccup). A snackbar per poll would be
        // unbearable. After a few in a row, we show a subtle banner so the
        // user knows why nothing is updating.
        _consecutiveFailures++;
        if (_consecutiveFailures >= _maxSilentFailures && !_isReconnecting) {
          setState(() => _isReconnecting = true);
        }
      },
    );
  }

  // ── Send ─────────────────────────────────────────────────────────

  Future<void> _sendMessage() async {
    final body = _messageController.text.trim();
    if (body.isEmpty) return;

    setState(() => _isSending = true);
    _messageController.clear();

    final result = await _repo.sendMessage(widget.reservationUuid, body: body);

    if (!mounted) return;

    result.when(
      success: (response) {
        if (response.data != null) {
          setState(() {
            _messages = [..._messages, response.data!];
            _isSending = false;
          });
          // service.message_sent — both call sites (my_reservations_page +
          // manage_reservations_page) gate this sheet behind
          // `reservation.isServiceBooking`, so by construction every
          // message sent from here belongs to a service booking. No
          // booking_type plumbing needed.
          di<ServiceEventsTracker>().messageSent(
            reservationUuid: widget.reservationUuid,
            sourceModule: 'ReservationMessagesSheet',
          );
          // Sending counts as activity → fast-poll window.
          _markActivity();
          _retuneTimer();
          _scrollToBottom();
        } else {
          setState(() => _isSending = false);
        }
      },
      failure: (error) {
        setState(() => _isSending = false);
        FoodlySnackbars.errorGeneric(context, error.toString());
      },
    );
  }

  // ── Scroll helpers ───────────────────────────────────────────────

  void _onScrollChanged() {
    if (_unseenBelow > 0 && _isNearBottom()) {
      setState(() => _unseenBelow = 0);
    }
  }

  bool _isNearBottom() {
    if (!_scrollController.hasClients) return true;
    final position = _scrollController.position;
    return (position.maxScrollExtent - position.pixels) <= _nearBottomThreshold;
  }

  void _scrollToBottom({bool animated = true}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      final target = _scrollController.position.maxScrollExtent;
      if (animated) {
        _scrollController.animateTo(
          target,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        _scrollController.jumpTo(target);
      }
      if (_unseenBelow > 0) setState(() => _unseenBelow = 0);
    });
  }

  // ── Build ────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
        decoration: const BoxDecoration(
          color: ui.NeumorphicColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHandle(),
            _buildHeader(),
            if (_isReconnecting) _buildReconnectingBanner(),
            const Divider(height: 1),
            Flexible(
              child: Stack(
                children: [
                  _buildMessageList(),
                  if (_unseenBelow > 0)
                    Positioned(
                      right: 16,
                      bottom: 12,
                      child: _buildUnseenBadge(),
                    ),
                ],
              ),
            ),
            const Divider(height: 1),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 4),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
      child: Row(
        children: [
          const Icon(Bootstrap.chat_left_text, size: 20, color: FoodlyThemes.primaryFoodly),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.current.messageThread, style: FoodlyTextStyles.menuTitle),
                Text(
                  widget.title,
                  style: FoodlyTextStyles.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Bootstrap.x_lg, size: 18),
            style: IconButton.styleFrom(
              minimumSize: const Size(36, 36),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

  /// Subtle banner shown after [_maxSilentFailures] consecutive failed polls.
  /// We don't want an aggressive red snackbar for transient network blips,
  /// but the user deserves to know why nothing is updating after a while.
  Widget _buildReconnectingBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: Colors.amber.withValues(alpha: 0.15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(strokeWidth: 1.5, color: Colors.amber),
          ),
          const SizedBox(width: 8),
          Text(
            S.current.reconnecting,
            style: FoodlyTextStyles.caption.copyWith(fontSize: 11, color: Colors.amber.shade900),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_messages.isEmpty) {
      return FadeIn(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Bootstrap.chat_left, size: 40, color: Colors.grey.shade300),
                const SizedBox(height: 12),
                Text(
                  S.current.noMessagesYet,
                  style: FoodlyTextStyles.caption.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _messages.length,
      shrinkWrap: true,
      itemBuilder: (_, index) => _MessageBubble(message: _messages[index]),
    );
  }

  /// "N new ↓" pill that appears when messages arrive while the user is
  /// scrolled up reading older ones. Tapping jumps to the bottom. Goes away
  /// automatically when the user scrolls near the bottom themselves.
  Widget _buildUnseenBadge() {
    return FadeInUp(
      duration: const Duration(milliseconds: 180),
      from: 12,
      child: Material(
        color: FoodlyThemes.primaryFoodly,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: _scrollToBottom,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _unseenBelow == 1
                      ? S.current.oneNewMessage
                      : S.current.nNewMessages(_unseenBelow),
                  style: FoodlyTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Bootstrap.arrow_down, size: 11, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                enabled: !_isSending,
                decoration: InputDecoration(
                  hintText: S.current.typeMessage,
                  hintStyle: FoodlyTextStyles.hintText,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: FoodlyThemes.primaryFoodly),
                  ),
                ),
                maxLines: 3,
                minLines: 1,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            const SizedBox(width: 8),
            _isSending
                ? const SizedBox(
                    width: 40,
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Bootstrap.send_fill, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: FoodlyThemes.primaryFoodly,
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      minimumSize: const Size(40, 40),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final ReservationMessageDM message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isManager = message.isFromManager;
    final alignment = isManager ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final bubbleColor =
        isManager ? FoodlyThemes.primaryFoodly.withValues(alpha: 0.08) : Colors.deepPurple.withValues(alpha: 0.08);
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(14),
      topRight: const Radius.circular(14),
      bottomLeft: Radius.circular(isManager ? 4 : 14),
      bottomRight: Radius.circular(isManager ? 14 : 4),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          // Author name
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              message.authorName ?? (isManager ? S.current.business : S.current.customer),
              style: FoodlyTextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: isManager ? FoodlyThemes.primaryFoodly : Colors.deepPurple,
              ),
            ),
          ),
          // Bubble
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.72,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: borderRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.body,
                  style: FoodlyTextStyles.caption.copyWith(fontSize: 13, height: 1.35),
                ),
                const SizedBox(height: 4),
                if (message.createdAt != null)
                  Text(
                    DateFormat.Hm().format(message.createdAt!),
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
