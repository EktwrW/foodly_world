import 'dart:async';

import 'package:flutter/material.dart';

/// A custom carousel widget built on top of [PageView] that avoids the
/// distortion issues caused by [CarouselSlider]'s internal transforms.
///
/// Supports auto-play, pagination dots, viewport fraction, infinite scroll,
/// and an [onPageChanged] callback for load-more / tracking.
class FoodlyCarousel extends StatefulWidget {
  /// The carousel items.
  final List<Widget> items;

  /// Fixed height for the carousel. Required.
  final double height;

  /// Fraction of the viewport that each item occupies.
  /// Defaults to `1.0` (full width). Values < 1.0 show peek of adjacent items.
  final double viewportFraction;

  /// Whether to auto-advance pages.
  final bool autoPlay;

  /// Duration between auto-play page transitions.
  final Duration autoPlayInterval;

  /// Duration of each auto-play transition animation.
  final Duration autoPlayAnimationDuration;

  /// Whether the carousel can loop infinitely.
  final bool enableInfiniteScroll;

  /// Called when the logical page index changes.
  final void Function(int index)? onPageChanged;

  /// Optional external controller for programmatic page changes.
  final FoodlyCarouselController? controller;

  /// Whether to show pagination indicator dots beneath the carousel.
  final bool showIndicators;

  /// Color of the active dot indicator.
  final Color activeDotColor;

  /// Color of the inactive dot indicators.
  final Color inactiveDotColor;

  /// Horizontal padding applied to each item.
  final double itemSpacing;

  const FoodlyCarousel({
    super.key,
    required this.items,
    required this.height,
    this.viewportFraction = 1.0,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 600),
    this.enableInfiniteScroll = true,
    this.onPageChanged,
    this.controller,
    this.showIndicators = false,
    this.activeDotColor = const Color(0xFF6B3FA0),
    this.inactiveDotColor = const Color(0x4D6B3FA0),
    this.itemSpacing = 4.0,
  });

  @override
  State<FoodlyCarousel> createState() => _FoodlyCarouselState();
}

class _FoodlyCarouselState extends State<FoodlyCarousel> {
  late PageController _pageController;
  Timer? _autoPlayTimer;
  int _currentPage = 0;

  /// Infinite scroll is only effective when requested AND there are enough
  /// items to make looping meaningful (≥ 3). With 1–2 items the modulo
  /// trick makes them appear duplicated.
  bool get _effectiveInfiniteScroll =>
      widget.enableInfiniteScroll && widget.items.length >= 3;

  /// Auto-play only makes sense when there are at least 2 items.
  bool get _effectiveAutoPlay => widget.autoPlay && widget.items.length > 1;

  /// For infinite scroll we add a large initial offset so the user can scroll
  /// backwards from item 0.
  int get _initialPage =>
      _effectiveInfiniteScroll ? widget.items.length * 100 : 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: _initialPage,
    );
    widget.controller?._attach(this);
    _startAutoPlay();
  }

  @override
  void didUpdateWidget(covariant FoodlyCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.viewportFraction != widget.viewportFraction ||
        oldWidget.items.length != widget.items.length) {
      final oldPage = _currentPage.clamp(0, widget.items.length - 1);
      _pageController.dispose();
      _pageController = PageController(
        viewportFraction: widget.viewportFraction,
        initialPage: _effectiveInfiniteScroll
            ? widget.items.length * 100 + oldPage
            : oldPage,
      );
      _currentPage = oldPage;
      setState(() {});
    }

    // Re-evaluate auto-play when items change or autoPlay flag changes.
    _stopAutoPlay();
    _startAutoPlay();

    widget.controller?._attach(this);
  }

  @override
  void dispose() {
    _stopAutoPlay();
    _pageController.dispose();
    widget.controller?._detach();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Auto-play
  // ---------------------------------------------------------------------------

  void _startAutoPlay() {
    if (!_effectiveAutoPlay) return;
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (_) {
      if (!_pageController.hasClients) return;

      // When not infinite and on the last page, jump back to first.
      if (!_effectiveInfiniteScroll &&
          _currentPage >= widget.items.length - 1) {
        _pageController.animateToPage(
          0,
          duration: widget.autoPlayAnimationDuration,
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.nextPage(
          duration: widget.autoPlayAnimationDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
  }

  // ---------------------------------------------------------------------------
  // Programmatic navigation (used by FoodlyCarouselController)
  // ---------------------------------------------------------------------------

  /// Compute the destination virtual page for a logical [index], picking
  /// the SHORTEST path around the loop when infinite scroll is active.
  ///
  /// Previous bug: `diff = index - currentLogical` is a straight-line delta.
  /// Going from logical 21 (last) to logical 0 (first) produced `diff = -21`,
  /// animating 21 pages in reverse through the entire carousel — even though
  /// the two tiles are visually adjacent in the infinite-scroll wrap-around.
  ///
  /// Correct path: compare forward vs backward distance along the ring of
  /// N items and pick the smaller one. Ties default to forward.
  int _targetVirtualPage(int index) {
    if (_effectiveInfiniteScroll) {
      final n = widget.items.length;
      final currentVirtual = _pageController.hasClients
          ? (_pageController.page?.round() ?? _initialPage)
          : _initialPage;
      final currentLogical = ((currentVirtual % n) + n) % n;
      final forward = (index - currentLogical + n) % n;
      final backward = (currentLogical - index + n) % n;
      final delta = forward <= backward ? forward : -backward;
      return currentVirtual + delta;
    }
    return index.clamp(0, widget.items.length - 1);
  }

  void _animateToPage(int index, {Duration? duration, Curve? curve}) {
    if (!_pageController.hasClients || widget.items.isEmpty) return;
    _pageController.animateToPage(
      _targetVirtualPage(index),
      duration: duration ?? const Duration(milliseconds: 400),
      curve: curve ?? Curves.decelerate,
    );
  }

  /// Jump instantly (no animation) to a logical [index]. Used for the
  /// initial centering when entering a page with a pre-selected item —
  /// animating from the default `initialPage` would leave the target tile
  /// half-rendered on the edge for the duration of the animation, which
  /// reads as a bug even though the math is right.
  void _jumpToPage(int index) {
    if (!_pageController.hasClients || widget.items.isEmpty) return;
    _pageController.jumpToPage(_targetVirtualPage(index));
  }

  void _nextPage({Duration? duration, Curve? curve}) {
    if (!_pageController.hasClients) return;
    _pageController.nextPage(
      duration: duration ?? const Duration(milliseconds: 400),
      curve: curve ?? Curves.linear,
    );
  }

  void _previousPage({Duration? duration, Curve? curve}) {
    if (!_pageController.hasClients) return;
    _pageController.previousPage(
      duration: duration ?? const Duration(milliseconds: 400),
      curve: curve ?? Curves.linear,
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return SizedBox(height: widget.height);

    // Single item — render directly, no PageView needed.
    if (widget.items.length == 1) {
      return SizedBox(
        height: widget.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.itemSpacing),
          child: widget.items.first,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount:
                _effectiveInfiniteScroll ? null : widget.items.length,
            onPageChanged: (virtualIndex) {
              final logical = _effectiveInfiniteScroll
                  ? virtualIndex % widget.items.length
                  : virtualIndex;
              if (_currentPage != logical) {
                setState(() => _currentPage = logical);
                widget.onPageChanged?.call(logical);
              }
            },
            itemBuilder: (context, virtualIndex) {
              final logical = _effectiveInfiniteScroll
                  ? virtualIndex % widget.items.length
                  : virtualIndex;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.itemSpacing),
                child: widget.items[logical],
              );
            },
          ),
        ),
        if (widget.showIndicators && widget.items.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.items.length, (i) {
                final isActive = i == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 16 : 7.5,
                  height: 7.5,
                  margin: const EdgeInsets.symmetric(horizontal: 3.5),
                  decoration: BoxDecoration(
                    color: isActive
                        ? widget.activeDotColor
                        : widget.inactiveDotColor,
                    borderRadius: BorderRadius.circular(isActive ? 4 : 10),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

/// Controller for [FoodlyCarousel] allowing programmatic page changes.
///
/// Drop-in replacement for [CarouselSliderController]:
///   - [animateToPage] navigates to a specific logical index
///   - [nextPage] / [previousPage] move forward / backward
class FoodlyCarouselController {
  _FoodlyCarouselState? _state;

  void _attach(_FoodlyCarouselState state) => _state = state;
  void _detach() => _state = null;

  /// Animate to the given logical [page] index.
  void animateToPage(
    int page, {
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.decelerate,
  }) {
    _state?._animateToPage(page, duration: duration, curve: curve);
  }

  /// Jump to the given logical [page] index without animating. Use for
  /// initial centering so the target tile is in the viewport the moment
  /// the carousel first paints — no mid-animation half-render.
  void jumpToPage(int page) => _state?._jumpToPage(page);

  /// Move to the next page.
  void nextPage({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.linear,
  }) {
    _state?._nextPage(duration: duration, curve: curve);
  }

  /// Move to the previous page.
  void previousPage({
    Duration duration = const Duration(milliseconds: 400),
    Curve curve = Curves.linear,
  }) {
    _state?._previousPage(duration: duration, curve: curve);
  }
}
