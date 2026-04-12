import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A simple horizontal scrolling carousel built on [ListView.builder].
///
/// **Height** is optional. When [height] is `null` the widget fills whatever
/// vertical space its parent provides (just like any Flutter widget).  When
/// [height] is given the widget wraps itself in a `SizedBox`.
///
/// **Item width** is derived automatically from [LayoutBuilder] constraints:
/// `availableWidth − 2 × sidePeekWidth`.  Pass [itemWidth] explicitly for
/// multi-item layouts (e.g. category chips) where each card is small & fixed.
///
/// Features: snap-to-center, auto-play, infinite scroll, pagination callback,
/// indicator dots, and programmatic navigation via [FoodlyCarouselBasicController].
class FoodlyCarouselBasic extends StatefulWidget {
  final List<Widget> items;

  /// Explicit height. When `null`, the carousel fills the height given by its
  /// parent constraints (e.g. [Expanded] in a [Column]).
  final double? height;

  /// Explicit item width in logical pixels.  When `null`, derived as
  /// `availableWidth − 2 × sidePeekWidth`.
  final double? itemWidth;

  /// How many logical pixels of the adjacent cards peek on each side.
  /// Only used when [itemWidth] is `null`.  Defaults to `32`.
  final double sidePeekWidth;

  final bool autoPlay;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final bool enableInfiniteScroll;

  /// Fires on every logical page change — useful for pagination fetches.
  final void Function(int index)? onPageChanged;

  final FoodlyCarouselBasicController? controller;
  final bool showIndicators;
  final Color activeDotColor;
  final Color inactiveDotColor;

  /// Horizontal padding on each side of every item.
  final double itemSpacing;

  const FoodlyCarouselBasic({
    super.key,
    required this.items,
    this.height,
    this.itemWidth,
    this.sidePeekWidth = 32.0,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 600),
    this.enableInfiniteScroll = true,
    this.onPageChanged,
    this.controller,
    this.showIndicators = false,
    this.activeDotColor = const Color(0xFF6B3FA0),
    this.inactiveDotColor = const Color(0x4D6B3FA0),
    this.itemSpacing = 3.0,
  });

  @override
  State<FoodlyCarouselBasic> createState() => _FoodlyCarouselBasicState();
}

class _FoodlyCarouselBasicState extends State<FoodlyCarouselBasic> {
  final ScrollController _sc = ScrollController();
  Timer? _autoPlayTimer;
  int _currentPage = 0;

  double _itemExtent = 0;
  double _startPadding = 0;
  double _availableWidth = 0;
  bool _didInitialScroll = false;
  bool _needsSnap = false;

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  bool get _infinite => widget.enableInfiniteScroll && widget.items.length >= 3;
  bool get _canAutoPlay => widget.autoPlay && widget.items.length > 1;
  int get _initialVirtual => _infinite ? widget.items.length * 500 : 0;

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _sc.addListener(_onScroll);
    widget.controller?._attach(this);
  }

  @override
  void didUpdateWidget(covariant FoodlyCarouselBasic old) {
    super.didUpdateWidget(old);
    if (widget.items.isNotEmpty && !_infinite) {
      _currentPage = _currentPage.clamp(0, widget.items.length - 1);
    }
    _stopAutoPlay();
    _startAutoPlay();
    widget.controller?._attach(this);
  }

  @override
  void dispose() {
    _stopAutoPlay();
    _sc.removeListener(_onScroll);
    _sc.dispose();
    widget.controller?._detach();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Layout
  // ---------------------------------------------------------------------------

  void _computeDimensions(double availableWidth) {
    if (availableWidth == _availableWidth && _itemExtent > 0) return;

    final oldExtent = _itemExtent;
    _availableWidth = availableWidth;

    final itemW = widget.itemWidth ?? math.max(50.0, availableWidth - 2 * widget.sidePeekWidth);
    _itemExtent = itemW + 2 * widget.itemSpacing;
    _startPadding = math.max(0.0, (availableWidth - itemW) / 2 - widget.itemSpacing);

    // On resize keep the same logical page centered.
    if (oldExtent > 0 && _itemExtent != oldExtent && _sc.hasClients) {
      final cur = (_sc.offset / oldExtent).round();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _sc.hasClients) _sc.jumpTo(cur * _itemExtent);
      });
    }
  }

  // ---------------------------------------------------------------------------
  // Scroll tracking
  // ---------------------------------------------------------------------------

  void _onScroll() {
    if (!_sc.hasClients || _itemExtent <= 0) return;

    final virt = (_sc.offset / _itemExtent).round();
    final logical = _infinite ? virt % widget.items.length : virt.clamp(0, widget.items.length - 1);

    if (_currentPage != logical) {
      setState(() => _currentPage = logical);
      widget.onPageChanged?.call(logical);
    }
  }

  bool _handleScrollNotification(ScrollNotification n) {
    if (n is ScrollStartNotification && n.dragDetails != null) {
      _needsSnap = true;
      _stopAutoPlay();
    } else if (n is ScrollEndNotification && _needsSnap) {
      _needsSnap = false;
      _snapToNearest();
      _startAutoPlay();
    }
    return false;
  }

  void _snapToNearest() {
    if (!_sc.hasClients || _itemExtent <= 0) return;
    final target = (_sc.offset / _itemExtent).round() * _itemExtent;
    if ((target - _sc.offset).abs() < 0.5) return;
    _sc.animateTo(target, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  // ---------------------------------------------------------------------------
  // Auto-play
  // ---------------------------------------------------------------------------

  void _startAutoPlay() {
    if (!_canAutoPlay) return;
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!_sc.hasClients || _itemExtent <= 0) return;

      final virt = (_sc.offset / _itemExtent).round();

      if (!_infinite && _currentPage >= widget.items.length - 1) {
        _sc.animateTo(0, duration: widget.autoPlayAnimationDuration, curve: Curves.easeInOut);
      } else {
        _sc.animateTo((virt + 1) * _itemExtent, duration: widget.autoPlayAnimationDuration, curve: Curves.easeInOut);
      }
    });
  }

  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
  }

  // ---------------------------------------------------------------------------
  // Programmatic navigation
  // ---------------------------------------------------------------------------

  void _animateToPage(int index, {Duration? duration, Curve? curve}) {
    if (!_sc.hasClients || _itemExtent <= 0 || widget.items.isEmpty) return;

    final dur = duration ?? const Duration(milliseconds: 400);
    final crv = curve ?? Curves.decelerate;

    if (_infinite) {
      final virt = (_sc.offset / _itemExtent).round();
      final logicalNow = virt % widget.items.length;
      _sc.animateTo((virt + (index - logicalNow)) * _itemExtent, duration: dur, curve: crv);
    } else {
      _sc.animateTo(index.clamp(0, widget.items.length - 1) * _itemExtent, duration: dur, curve: crv);
    }
  }

  void _nextPage({Duration? duration, Curve? curve}) =>
      _animateToPage(_currentPage + 1, duration: duration, curve: curve);

  void _previousPage({Duration? duration, Curve? curve}) =>
      _animateToPage(_currentPage - 1, duration: duration, curve: curve);

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    if (items.isEmpty) return SizedBox(height: widget.height ?? 0);

    // Single item — no scrolling needed.
    if (items.length == 1) {
      final child = Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.itemSpacing),
        child: items.first,
      );
      return widget.height != null ? SizedBox(height: widget.height, child: child) : child;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        _computeDimensions(constraints.maxWidth);

        // First build — jump to midpoint for infinite scroll.
        if (!_didInitialScroll && _itemExtent > 0) {
          _didInitialScroll = true;
          final offset = _initialVirtual * _itemExtent;
          if (offset > 0) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _sc.hasClients) _sc.jumpTo(offset);
            });
          }
          WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoPlay());
        }

        // The horizontal list — all items rendered at their natural size.
        Widget listView = NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: ListView.builder(
            controller: _sc,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: _startPadding, right: 60),
            itemExtent: _itemExtent,
            itemCount: _infinite ? items.length * 1000 : items.length,
            itemBuilder: (_, virtualIndex) {
              final logical = _infinite ? virtualIndex % items.length : virtualIndex;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.itemSpacing),
                child: items[logical],
              );
            },
          ),
        );

        // Apply explicit height when given.
        if (widget.height != null) {
          listView = SizedBox(height: widget.height, child: listView);
        }

        // No indicators → return list directly.
        if (!widget.showIndicators || items.length <= 1) return listView;

        // With indicators → wrap in a Column.
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.height != null ? listView : Expanded(child: listView),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(items.length, (i) {
                  final active = i == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: active ? 16 : 7.5,
                    height: 7.5,
                    margin: const EdgeInsets.symmetric(horizontal: 3.5),
                    decoration: BoxDecoration(
                      color: active ? widget.activeDotColor : widget.inactiveDotColor,
                      borderRadius: BorderRadius.circular(active ? 4 : 10),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Controller for [FoodlyCarouselBasic] — programmatic page navigation.
class FoodlyCarouselBasicController {
  _FoodlyCarouselBasicState? _state;

  void _attach(_FoodlyCarouselBasicState s) => _state = s;
  void _detach() => _state = null;

  void animateToPage(
    int page, {
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.decelerate,
  }) =>
      _state?._animateToPage(page, duration: duration, curve: curve);

  void nextPage({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.linear,
  }) =>
      _state?._nextPage(duration: duration, curve: curve);

  void previousPage({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.linear,
  }) =>
      _state?._previousPage(duration: duration, curve: curve);
}
