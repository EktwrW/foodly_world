import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_message_dm.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:intl/intl.dart';

/// Shows a bottom sheet with the message thread for a reservation.
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

class _ReservationMessagesSheetState extends State<_ReservationMessagesSheet> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final _repo = di<ReservationRepo>();

  List<ReservationMessageDM> _messages = [];
  bool _isLoading = true;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMessages() async {
    final result = await _repo.getMessages(widget.reservationUuid);

    if (!mounted) return;

    result.when(
      success: (response) {
        setState(() {
          _messages = response.messages;
          _isLoading = false;
        });
        _scrollToBottom();
      },
      failure: (error) {
        setState(() => _isLoading = false);
        FoodlySnackbars.errorGeneric(context, error.toString());
      },
    );
  }

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

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

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
            const Divider(height: 1),
            Flexible(child: _buildMessageList()),
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
