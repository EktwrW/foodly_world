import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:shimmer/shimmer.dart';

final _kBaseColor = FoodlyThemes.primaryFoodly.withValues(alpha: 0.15);
const _kHighlightColor = Color(0xFFF3F3F3);

// ─── Promo Carousel Shimmer ───────────────────────────────────────────────────

/// Skeleton for [TopOffersWidget] while promotions are loading.
///
/// Emulates the real CarouselSlider layout:
///   - left peek card  (~24 px visible, slightly shorter = non-enlarged)
///   - center card     (Expanded, full 369 px height)
///   - right peek card (~24 px visible, slightly shorter)
///
/// Matches viewportFraction ≈ 0.9 and enlargeCenterPage/enlargeFactor: 0.15.
class PromoCarouselShimmer extends StatelessWidget {
  const PromoCarouselShimmer({super.key});

  static const _carouselH = 369.0;
  static const _sideH = 350.0; // slightly shorter → non-enlarged side cards
  static const _peekW = 24.0; // visible slice of each side card

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _carouselH,
      child: Shimmer.fromColors(
        baseColor: _kBaseColor,
        highlightColor: _kHighlightColor,
        child: const Row(
          children: [
            // Left card peeking in — only rightmost _peekW px visible
            _SidePeekCard(
              peekWidth: _peekW,
              totalHeight: _sideH,
              align: Alignment.centerRight,
            ),

            // Center card — gets the remaining width via Expanded
            Expanded(child: _CenterPromoCard()),

            // Right card peeking in — only leftmost _peekW px visible
            _SidePeekCard(
              peekWidth: _peekW,
              totalHeight: _sideH,
              align: Alignment.centerLeft,
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows a thin slice of a fake promo card to simulate adjacent carousel items.
class _SidePeekCard extends StatelessWidget {
  final double peekWidth;
  final double totalHeight;
  final AlignmentGeometry align;

  const _SidePeekCard({
    required this.peekWidth,
    required this.totalHeight,
    required this.align,
  });

  @override
  Widget build(BuildContext context) {
    // The "full" side card is proportional to the actual carousel card.
    // We render it at full width inside an OverflowBox so it looks realistic,
    // then ClipRect limits the visible area to peekWidth.
    final fullW = context.screenWidth * 0.86;

    return ClipRect(
      child: SizedBox(
        width: peekWidth,
        height: totalHeight,
        child: OverflowBox(
          alignment: align,
          maxWidth: fullW,
          minWidth: 0,
          maxHeight: totalHeight,
          minHeight: 0,
          child: _PromoCardSkeleton(width: fullW, height: totalHeight),
        ),
      ),
    );
  }
}

/// Full-size center card skeleton — uses LayoutBuilder so the 16∶9 image
/// always tracks the actual rendered width from Expanded.
class _CenterPromoCard extends StatelessWidget {
  const _CenterPromoCard();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final w = constraints.maxWidth;
        return _PromoCardSkeleton(width: w, height: 367);
      },
    );
  }
}

/// Shared skeleton structure for both center and side cards.
class _PromoCardSkeleton extends StatelessWidget {
  final double width;
  final double height;

  const _PromoCardSkeleton({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final imageH = width * 9 / 16;
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: Stack(
          children: [
            // ── Image area ──────────────────────────────────────────────
            Container(
              width: width,
              height: imageH,
              color: const Color(0xFFEAEAEA),
            ),

            // ── Favorite button (top-right) ──────────────────────────────
            const Positioned(
              right: 10,
              top: 10,
              child: _Circle(size: 34),
            ),

            // ── Frosted-glass info panel ─────────────────────────────────
            Positioned(
              left: 10,
              right: 10,
              bottom: 54,
              child: Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Rect(width: width * 0.50, height: 13),
                    _Rect(width: width * 0.70, height: 10),
                    _Rect(width: width * 0.58, height: 10),
                  ],
                ),
              ),
            ),

            // ── Business name + rating + action buttons ──────────────────
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Rect(width: 110, height: 12),
                          SizedBox(height: 5),
                          _Rect(width: 78, height: 9),
                        ],
                      ),
                      Row(
                        children: [
                          _Circle(size: 30),
                          SizedBox(width: 10),
                          _Circle(size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── New Releases Shimmer ─────────────────────────────────────────────────────

/// Skeleton for [NewReleasesCard] while businesses are loading.
/// Mirrors the Stack layout: header badge + main card with cover image + logo.
class NewReleaseShimmer extends StatelessWidget {
  const NewReleaseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final cardW = context.screenWidth - 32;

    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Header badge placeholder
          const Card(
            color: Colors.white,
            child: SizedBox(
              height: 90,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Rect(width: 150, height: 14),
                  SizedBox(height: 9),
                  _Rect(width: 90, height: 10),
                ],
              ),
            ),
          ),

          // Main card — offset matches the real card's paddingOnly(top: 55)
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 320,
                    child: Stack(
                      children: [
                        // Cover image skeleton
                        Positioned(
                          top: 1,
                          left: 1,
                          right: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 270,
                              width: cardW,
                              color: const Color(0xFFEAEAEA),
                            ),
                          ),
                        ),

                        // Logo circle skeleton — centered at bottom
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(child: _Circle(size: 100)),
                        ),
                      ],
                    ),
                  ),

                  // Bottom info block
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Description lines
                        SizedBox(
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Rect(width: cardW * 0.78, height: 12),
                              const SizedBox(height: 8),
                              _Rect(width: cardW * 0.55, height: 12),
                            ],
                          ),
                        ),

                        // Footer row: category chip + location pill + "+ info"
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              _Circle(size: 30),
                              SizedBox(width: 6),
                              _Rect(width: 110, height: 24, radius: 6),
                              Spacer(),
                              _Rect(width: 50, height: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Primitives ───────────────────────────────────────────────────────────────

class _Rect extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const _Rect({required this.width, required this.height, this.radius = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  const _Circle({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    );
  }
}
