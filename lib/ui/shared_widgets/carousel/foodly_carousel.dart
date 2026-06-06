import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';

/// Logical breakpoint buckets used by [FoodlyCarousel] to resolve its
/// responsive dimensions.
///
/// Mirrors the `DeviceSize` breakpoints wired into `responsive_framework`
/// (see `screen_size_extension.dart`): mobile ≤599, smallTablet 600–767,
/// tablet 768–1023, desktop ≥1024. Kept as a tiny standalone enum so the
/// resolution math below can be unit-tested as pure functions, without a
/// `BuildContext` or the Flutter test harness.
enum FoodlyCarouselBreakpoint { mobile, smallTablet, tablet, desktop }

/// Default phone width (logical px) used as the reference when no per-breakpoint
/// [FoodlyCarousel.viewportFraction] override is supplied. The auto-resolved
/// fraction keeps each item at ~`viewportFraction * referenceWidth` physical
/// pixels, so a wider screen reveals MORE items instead of ballooning one.
///
/// 400 sits in the middle of common phone logical widths (iPhone SE 375,
/// iPhone 14 390, Pixel ~412), so on a typical phone the auto fraction equals
/// the base and nothing changes.
const double kCarouselAdaptiveReferenceWidth = 400.0;

/// Floor for the auto-resolved viewport fraction so items never collapse to a
/// hairline sliver on very wide screens.
const double kCarouselMinViewportFraction = 0.12;

/// Resolves the effective viewport fraction for a carousel.
///
/// Resolution order:
///   1. An explicit per-breakpoint override, if provided. Missing larger
///      breakpoints fall back DOWN to the nearest supplied smaller one
///      (desktop → tablet → smallTablet) so a single `tablet:` override also
///      covers desktop.
///   2. On [FoodlyCarouselBreakpoint.mobile] we ALWAYS return [base] untouched
///      — phone layouts were tuned by hand and must not shift.
///   3. Otherwise the "constant item width" default: pick the fraction that
///      keeps each item ≈ `base * referenceWidth` px wide, clamped to
///      `[minFraction, base]`. Because the item's physical width stays roughly
///      constant, the carousel [height] does NOT need to change with it.
///
/// Pure & side-effect free so it can be unit-tested directly.
double resolveCarouselViewportFraction({
  required double base,
  required FoodlyCarouselBreakpoint breakpoint,
  required double screenWidth,
  double? smallTablet,
  double? tablet,
  double? desktop,
  double referenceWidth = kCarouselAdaptiveReferenceWidth,
  double minFraction = kCarouselMinViewportFraction,
}) {
  final override = switch (breakpoint) {
    FoodlyCarouselBreakpoint.desktop => desktop ?? tablet ?? smallTablet,
    FoodlyCarouselBreakpoint.tablet => tablet ?? smallTablet,
    FoodlyCarouselBreakpoint.smallTablet => smallTablet,
    FoodlyCarouselBreakpoint.mobile => null,
  };
  if (override != null) return override;

  // Phones stay exactly as they are today.
  if (breakpoint == FoodlyCarouselBreakpoint.mobile || screenWidth <= 0) {
    return base;
  }

  final targetItemWidth = base * referenceWidth;
  final auto = targetItemWidth / screenWidth;
  // Upper bound `base` guarantees we only ever shrink the fraction (= show more
  // items), never enlarge it beyond the hand-tuned base.
  // `.toDouble()` because `num.clamp` is typed to return `num`.
  return auto.clamp(minFraction, base);
}

/// Resolves the effective carousel height for the given [breakpoint].
///
/// Defaults to [base] (the mobile height) on every breakpoint — with the
/// constant-item-width fraction strategy the item proportions are preserved, so
/// the height usually shouldn't change. Per-breakpoint overrides are available
/// for the rare case a caller wants taller items on tablets. Falls back DOWN to
/// the nearest supplied smaller breakpoint, same as the fraction resolver.
///
/// Pure & side-effect free so it can be unit-tested directly.
double resolveCarouselHeight({
  required double base,
  required FoodlyCarouselBreakpoint breakpoint,
  double? smallTablet,
  double? tablet,
  double? desktop,
}) {
  final override = switch (breakpoint) {
    FoodlyCarouselBreakpoint.desktop => desktop ?? tablet ?? smallTablet,
    FoodlyCarouselBreakpoint.tablet => tablet ?? smallTablet,
    FoodlyCarouselBreakpoint.smallTablet => smallTablet,
    FoodlyCarouselBreakpoint.mobile => null,
  };
  return override ?? base;
}

/// A custom carousel widget built on top of [PageView] that avoids the
/// distortion issues caused by [CarouselSlider]'s internal transforms.
///
/// Supports auto-play, pagination dots, viewport fraction, infinite scroll,
/// and an [onPageChanged] callback for load-more / tracking.
///
/// ## Responsive behaviour (hybrid)
/// [viewportFraction] and [height] are the **mobile base** values. On tablets
/// and wider the carousel adapts automatically (see
/// [resolveCarouselViewportFraction]): instead of stretching a single item to
/// fill an iPad, it keeps each item at roughly its phone width and reveals more
/// of them. Phones are never affected.
///
/// Any breakpoint can be overridden per call site via
/// [smallTabletViewportFraction] / [tabletViewportFraction] /
/// [desktopViewportFraction] (and the matching `*Height` params) when a screen
/// wants a specific item count rather than the constant-width default.
class FoodlyCarousel extends StatefulWidget {
  /// The carousel items.
  final List<Widget> items;

  /// Fixed height for the carousel on **mobile**. Required.
  /// Tablets reuse this unless a `*Height` override is supplied.
  final double height;

  /// Fraction of the viewport that each item occupies on **mobile**.
  /// Defaults to `1.0` (full width). Values < 1.0 show peek of adjacent items.
  /// On tablets this is the base the responsive resolver scales from.
  final double viewportFraction;

  /// Optional per-breakpoint overrides for [viewportFraction]. When null, the
  /// constant-item-width default kicks in for that breakpoint.
  final double? smallTabletViewportFraction;
  final double? tabletViewportFraction;
  final double? desktopViewportFraction;

  /// Optional per-breakpoint overrides for [height]. When null, [height] is
  /// reused on that breakpoint.
  final double? smallTabletHeight;
  final double? tabletHeight;
  final double? desktopHeight;

  /// Reference phone width used by the constant-item-width default. Item target
  /// width = [viewportFraction] * [adaptiveReferenceWidth].
  final double adaptiveReferenceWidth;

  /// Floor for the auto-resolved viewport fraction on wide screens.
  final double minViewportFraction;

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
    this.smallTabletViewportFraction,
    this.tabletViewportFraction,
    this.desktopViewportFraction,
    this.smallTabletHeight,
    this.tabletHeight,
    this.desktopHeight,
    this.adaptiveReferenceWidth = kCarouselAdaptiveReferenceWidth,
    this.minViewportFraction = kCarouselMinViewportFraction,
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
  /// Created lazily in [didChangeDependencies] because the responsive viewport
  /// fraction depends on inherited widgets (`ResponsiveBreakpoints`) that are
  /// NOT safe to read inside [initState].
  PageController? _pageController;

  /// The viewport fraction the current [_pageController] was built with. Used
  /// to detect breakpoint changes (rotation / fold-unfold) so we can rebuild
  /// the controller — `PageController.viewportFraction` is immutable.
  double? _effectiveViewportFraction;

  Timer? _autoPlayTimer;
  int _currentPage = 0;

  /// Infinite scroll is only effective when requested AND there are enough
  /// items to make looping meaningful (≥ 3). With 1–2 items the modulo
  /// trick makes them appear duplicated.
  bool get _effectiveInfiniteScroll => widget.enableInfiniteScroll && widget.items.length >= 3;

  /// Auto-play only makes sense when there are at least 2 items.
  bool get _effectiveAutoPlay => widget.autoPlay && widget.items.length > 1;

  /// For infinite scroll we add a large initial offset so the user can scroll
  /// backwards from item 0.
  int get _initialPage => _effectiveInfiniteScroll ? widget.items.length * 100 : 0;

  // ---------------------------------------------------------------------------
  // Responsive resolution
  // ---------------------------------------------------------------------------

  FoodlyCarouselBreakpoint _breakpointOf(BuildContext context) {
    if (context.isDesktop) return FoodlyCarouselBreakpoint.desktop;
    if (context.isTablet) return FoodlyCarouselBreakpoint.tablet;
    if (context.isSmallTablet) return FoodlyCarouselBreakpoint.smallTablet;
    return FoodlyCarouselBreakpoint.mobile;
  }

  double _resolveViewportFraction(BuildContext context) {
    return resolveCarouselViewportFraction(
      base: widget.viewportFraction,
      breakpoint: _breakpointOf(context),
      screenWidth: context.screenWidth,
      smallTablet: widget.smallTabletViewportFraction,
      tablet: widget.tabletViewportFraction,
      desktop: widget.desktopViewportFraction,
      referenceWidth: widget.adaptiveReferenceWidth,
      minFraction: widget.minViewportFraction,
    );
  }

  double _resolveHeight(BuildContext context) {
    return resolveCarouselHeight(
      base: widget.height,
      breakpoint: _breakpointOf(context),
      smallTablet: widget.smallTabletHeight,
      tablet: widget.tabletHeight,
      desktop: widget.desktopHeight,
    );
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    // Controller creation deferred to didChangeDependencies (needs inherited
    // ResponsiveBreakpoints). Attach early so the external controller is wired
    // before the first programmatic call.
    widget.controller?._attach(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fires on first build AND whenever inherited deps change — e.g. the device
    // rotates or a foldable opens, flipping the breakpoint. Rebuild the
    // controller with the new fraction, preserving the current logical page.
    final vf = _resolveViewportFraction(context);
    if (_pageController == null) {
      _effectiveViewportFraction = vf;
      _pageController = PageController(
        viewportFraction: vf,
        initialPage: _initialPage,
      );
      _startAutoPlay();
    } else if (_effectiveViewportFraction != vf) {
      _rebuildController(vf);
    }
  }

  @override
  void didUpdateWidget(covariant FoodlyCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    final vf = _resolveViewportFraction(context);
    final fractionChanged = vf != _effectiveViewportFraction;
    final lengthChanged = oldWidget.items.length != widget.items.length;

    if (_pageController == null) {
      _effectiveViewportFraction = vf;
      _pageController = PageController(
        viewportFraction: vf,
        initialPage: _initialPage,
      );
    } else if (fractionChanged || lengthChanged) {
      _rebuildController(vf);
    }

    // Re-evaluate auto-play when items change or autoPlay flag changes.
    _stopAutoPlay();
    _startAutoPlay();

    widget.controller?._attach(this);
  }

  /// Disposes the current [_pageController] and creates a new one with [vf],
  /// keeping the same logical page centered (and the infinite-scroll offset).
  void _rebuildController(double vf) {
    final oldPage = _currentPage.clamp(0, widget.items.length - 1);
    _pageController?.dispose();
    _effectiveViewportFraction = vf;
    _pageController = PageController(
      viewportFraction: vf,
      initialPage: _effectiveInfiniteScroll ? widget.items.length * 100 + oldPage : oldPage,
    );
    _currentPage = oldPage;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _stopAutoPlay();
    _pageController?.dispose();
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
      final controller = _pageController;
      if (controller == null || !controller.hasClients) return;

      // When not infinite and on the last page, jump back to first.
      if (!_effectiveInfiniteScroll && _currentPage >= widget.items.length - 1) {
        controller.animateToPage(
          0,
          duration: widget.autoPlayAnimationDuration,
          curve: Curves.easeInOut,
        );
      } else {
        controller.nextPage(
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
    final controller = _pageController;
    if (_effectiveInfiniteScroll) {
      final n = widget.items.length;
      final currentVirtual =
          (controller?.hasClients ?? false) ? (controller!.page?.round() ?? _initialPage) : _initialPage;
      final currentLogical = ((currentVirtual % n) + n) % n;
      final forward = (index - currentLogical + n) % n;
      final backward = (currentLogical - index + n) % n;
      final delta = forward <= backward ? forward : -backward;
      return currentVirtual + delta;
    }
    return index.clamp(0, widget.items.length - 1);
  }

  void _animateToPage(int index, {Duration? duration, Curve? curve}) {
    final controller = _pageController;
    if (controller == null || !controller.hasClients || widget.items.isEmpty) {
      return;
    }
    controller.animateToPage(
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
    final controller = _pageController;
    if (controller == null || !controller.hasClients || widget.items.isEmpty) {
      return;
    }
    controller.jumpToPage(_targetVirtualPage(index));
  }

  void _nextPage({Duration? duration, Curve? curve}) {
    final controller = _pageController;
    if (controller == null || !controller.hasClients) return;
    controller.nextPage(
      duration: duration ?? const Duration(milliseconds: 400),
      curve: curve ?? Curves.linear,
    );
  }

  void _previousPage({Duration? duration, Curve? curve}) {
    final controller = _pageController;
    if (controller == null || !controller.hasClients) return;
    controller.previousPage(
      duration: duration ?? const Duration(milliseconds: 400),
      curve: curve ?? Curves.linear,
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final height = _resolveHeight(context);

    if (widget.items.isEmpty) return SizedBox(height: height);

    // Single item — render directly, no PageView needed.
    if (widget.items.length == 1) {
      return SizedBox(
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.itemSpacing),
          child: widget.items.first,
        ),
      );
    }

    final controller = _pageController;
    // Controller is created in didChangeDependencies before the first build;
    // this guard is purely defensive.
    if (controller == null) return SizedBox(height: height);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: controller,
            itemCount: _effectiveInfiniteScroll ? null : widget.items.length,
            onPageChanged: (virtualIndex) {
              final logical = _effectiveInfiniteScroll ? virtualIndex % widget.items.length : virtualIndex;
              if (_currentPage != logical) {
                setState(() => _currentPage = logical);
                widget.onPageChanged?.call(logical);
              }
            },
            itemBuilder: (context, virtualIndex) {
              final logical = _effectiveInfiniteScroll ? virtualIndex % widget.items.length : virtualIndex;
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
                    color: isActive ? widget.activeDotColor : widget.inactiveDotColor,
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
