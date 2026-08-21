import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:shimmer/shimmer.dart';

final _kBaseColor = FoodlyThemes.primaryFoodly.withValues(alpha: 0.15);
const _kHighlightColor = Color(0xFFF3F3F3);

// ─── Promo Carousel Shimmer ───────────────────────────────────────────────────

class PromoCarouselShimmer extends StatelessWidget {
  const PromoCarouselShimmer({super.key});

  static const _carouselH = 333.0;

  /// Visible para el centro, que comparte la geometría.
  static const carouselHeight = _carouselH;

  /// Las tarjetas de al lado NO están agrandadas (`enlargeCenterPage: true` en
  /// el carousel real), así que se ven más bajas que la del centro.
  ///
  /// Antes esto era 350 —o sea MÁS alto que `_carouselH`, pese a que el
  /// comentario decía lo contrario— y de ahí salían los dos defectos: la
  /// tarjeta lateral no entraba en la ventana del `ClipRect`, así que sus
  /// esquinas redondeadas quedaban recortadas arriba y abajo y el borde que da
  /// al centro se veía RECTO. Al bajar la altura entra completa y el redondeo
  /// aparece solo.
  static const _sideScale = .85;
  static const _sideH = _carouselH * _sideScale;

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
        // `_carouselH` y no un número suelto: la Row acota igual a esa altura,
        // y dejarlo explícito hace comparable la altura lateral con esta.
        return _PromoCardSkeleton(width: w, height: PromoCarouselShimmer.carouselHeight);
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
                    height: 260,
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
                              height: 230,
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

// ─── Categories / Business Results Shimmer ───────────────────────────────────

/// Skeleton for [BusinessResultsView] in list mode.
/// Shows 4 fake [BusinessListCard] items in a scrollable column.
class BusinessListShimmer extends StatelessWidget {
  const BusinessListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 16, left: 6, right: 6),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemBuilder: (_, __) => const _BusinessListCardSkeleton(),
      ),
    );
  }
}

/// Skeleton for [BusinessResultsView] in grid mode.
/// Shows 4 fake [BusinessGridCard] items in a 2-column grid.
class BusinessGridShimmer extends StatelessWidget {
  const BusinessGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 16, left: 6, right: 6),
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 18 / 29,
        children: const [
          _BusinessGridCardSkeleton(),
          _BusinessGridCardSkeleton(),
          _BusinessGridCardSkeleton(),
          _BusinessGridCardSkeleton(),
        ],
      ),
    );
  }
}

/// Matches [BusinessListCard] layout: logo (60×60) + name/address + fav button,
/// then status badge + schedule + category icon.
class _BusinessListCardSkeleton extends StatelessWidget {
  const _BusinessListCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                // Logo
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAEAEA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // Name + address
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Rect(width: 130, height: 12),
                      SizedBox(height: 8),
                      _Rect(width: 180, height: 10),
                      SizedBox(height: 4),
                      _Rect(width: 140, height: 10),
                    ],
                  ),
                ),
                // Favorite button
                const _Circle(size: 28),
              ],
            ),
            // Status badge + schedule + category
            const Row(
              spacing: 8,
              children: [
                _Rect(width: 50, height: 20, radius: 10),
                _Rect(width: 90, height: 10),
                Spacer(),
                _Circle(size: 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Matches [BusinessGridCard] layout: square logo with fav button overlay,
/// then name + address + schedule + status badge + category icon.
class _BusinessGridCardSkeleton extends StatelessWidget {
  const _BusinessGridCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          spacing: 8,
          children: [
            // Square logo with fav button
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAEAEA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const Positioned(
                    top: 3,
                    right: 3,
                    child: _Circle(size: 28),
                  ),
                ],
              ),
            ),
            // Name + address
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Rect(width: 100, height: 12),
                  SizedBox(height: 6),
                  _Rect(width: 130, height: 10),
                  SizedBox(height: 3),
                  _Rect(width: 90, height: 10),
                ],
              ),
            ),
            // Schedule + status + category
            const Column(
              spacing: 6,
              children: [
                _Rect(width: 80, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _Rect(width: 50, height: 20, radius: 10),
                    _Circle(size: 28),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Menu Shimmer ─────────────────────────────────────────────────────────────

/// Skeleton for menu screens (visited & manage) while loading.
/// Mimics the tab bar + category headers + menu item cards.
class MenuShimmer extends StatelessWidget {
  const MenuShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
        children: const [
          // Tab bar (Food / Drinks / Combos)
          _MenuTabBarSkeleton(),
          SizedBox(height: 20),
          // Category 1 with 2 items
          _MenuCategorySkeleton(),
          SizedBox(height: 10),
          _MenuItemSkeleton(),
          SizedBox(height: 12),
          _MenuItemSkeleton(),
          SizedBox(height: 24),
          // Category 2 with 2 items
          _MenuCategorySkeleton(),
          SizedBox(height: 10),
          _MenuItemSkeleton(),
          SizedBox(height: 12),
          _MenuItemSkeleton(),
        ],
      ),
    );
  }
}

class _MenuTabBarSkeleton extends StatelessWidget {
  const _MenuTabBarSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Rect(width: 80, height: 32, radius: 16),
          _Rect(width: 80, height: 32, radius: 16),
          _Rect(width: 80, height: 32, radius: 16),
        ],
      ),
    );
  }
}

class _MenuCategorySkeleton extends StatelessWidget {
  const _MenuCategorySkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const _Rect(width: 140, height: 14),
    );
  }
}

/// Mimics VisitedMenuItemWdg: image (left) + name/description (center) +
/// fav button (right), then version selector + price card.
class _MenuItemSkeleton extends StatelessWidget {
  const _MenuItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // Top row: image + name/description + fav
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item image
                _Rect(width: 80, height: 80, radius: 8),
                SizedBox(width: 10),
                // Name + description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Rect(width: 130, height: 12),
                      SizedBox(height: 8),
                      _Rect(width: 180, height: 10),
                      SizedBox(height: 5),
                      _Rect(width: 150, height: 10),
                    ],
                  ),
                ),
                SizedBox(width: 6),
                // Fav button
                _Circle(size: 26),
              ],
            ),
            SizedBox(height: 8),
            // Bottom row: version selector + price
            Row(
              children: [
                _Rect(width: 70, height: 28, radius: 6),
                Spacer(),
                _Rect(width: 40, height: 12),
                SizedBox(width: 8),
                _Rect(width: 110, height: 36, radius: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Notifications Shimmer ────────────────────────────────────────────────────

/// Skeleton for notifications list while loading.
/// Mimics ListTile layout: avatar + title/subtitle + trailing icons.
class NotificationsShimmer extends StatelessWidget {
  const NotificationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, __) => const _NotificationCardSkeleton(),
      ),
    );
  }
}

class _NotificationCardSkeleton extends StatelessWidget {
  const _NotificationCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Circle(size: 40),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Rect(width: 160, height: 12),
                  SizedBox(height: 8),
                  _Rect(width: 220, height: 10),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _Circle(size: 16),
                      SizedBox(width: 6),
                      _Rect(width: 60, height: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            _Circle(size: 24),
          ],
        ),
      ),
    );
  }
}

// ─── Social Posts Feed Shimmer ────────────────────────────────────────────────

/// Skeleton for social posts feed while loading.
/// Mimics PostCard: avatar + name, content text, photo area, like row.
class PostsFeedShimmer extends StatelessWidget {
  const PostsFeedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        itemCount: 3,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) => _PostCardSkeleton(showPhoto: index != 1),
      ),
    );
  }
}

class _PostCardSkeleton extends StatelessWidget {
  final bool showPhoto;
  const _PostCardSkeleton({this.showPhoto = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: avatar + name + time
            const Row(
              children: [
                _Circle(size: 40),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Rect(width: 120, height: 12),
                    SizedBox(height: 6),
                    _Rect(width: 70, height: 10),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Content text
            const _Rect(width: 260, height: 10),
            const SizedBox(height: 6),
            const _Rect(width: 200, height: 10),
            if (showPhoto) ...[
              const SizedBox(height: 12),
              // Photo placeholder
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(height: 180, color: const Color(0xFFEAEAEA)),
              ),
            ],
            const SizedBox(height: 10),
            // Like row
            const Row(
              children: [
                _Circle(size: 22),
                SizedBox(width: 6),
                _Rect(width: 30, height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Buzz Feed Shimmer ───────────────────────────────────────────────────────

/// Skeleton for buzz feed while loading.
/// Mimics BuzzItemCard: icon box + message + business name + avatar.
class BuzzFeedShimmer extends StatelessWidget {
  const BuzzFeedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, __) => const _BuzzItemSkeleton(),
      ),
    );
  }
}

class _BuzzItemSkeleton extends StatelessWidget {
  const _BuzzItemSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            // Icon box
            _Rect(width: 36, height: 36, radius: 8),
            SizedBox(width: 12),
            // Text column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Rect(width: 200, height: 11),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      _Rect(width: 100, height: 10),
                      SizedBox(width: 8),
                      _Rect(width: 50, height: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            _Circle(size: 40),
          ],
        ),
      ),
    );
  }
}

// ─── Users Discovery Shimmer ──────────────────────────────────────────────────

/// Skeleton for nearby users list while loading.
/// Mimics NearbyUserCard: avatar + name/username/bio + stats row + follow button.
class UsersDiscoveryShimmer extends StatelessWidget {
  const UsersDiscoveryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, __) => const _NearbyUserCardSkeleton(),
      ),
    );
  }
}

class _NearbyUserCardSkeleton extends StatelessWidget {
  const _NearbyUserCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(14),
        child: Row(
          children: [
            // Avatar
            _Circle(size: 56),
            SizedBox(width: 12),
            // Name + username + bio + stats
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Rect(width: 120, height: 12),
                  SizedBox(height: 6),
                  _Rect(width: 80, height: 10),
                  SizedBox(height: 6),
                  _Rect(width: 180, height: 10),
                  SizedBox(height: 8),
                  // Stats row
                  Row(
                    children: [
                      _Rect(width: 30, height: 10),
                      SizedBox(width: 12),
                      _Rect(width: 30, height: 10),
                      SizedBox(width: 12),
                      _Rect(width: 30, height: 10),
                      SizedBox(width: 12),
                      _Rect(width: 50, height: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Follow button
            _Rect(width: 70, height: 32, radius: 16),
          ],
        ),
      ),
    );
  }
}

// ─── Reservations Shimmer ────────────────────────────────────────────────────

/// Skeleton for reservation lists (both customer and manager views).
/// Mimics ReservationCard: avatar + business/user name + status badge + info chips.
class ReservationsShimmer extends StatelessWidget {
  final bool isManager;
  const ReservationsShimmer({super.key, this.isManager = false});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, __) => _ReservationCardSkeleton(isManager: isManager),
      ),
    );
  }
}

class _ReservationCardSkeleton extends StatelessWidget {
  final bool isManager;
  const _ReservationCardSkeleton({this.isManager = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(isManager ? 12 : 10)),
      child: Padding(
        padding: EdgeInsets.all(isManager ? 14 : 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: avatar + name + status badge
            Row(
              children: [
                const _Circle(size: 40),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Rect(width: 140, height: 12),
                      SizedBox(height: 6),
                      _Rect(width: 100, height: 10),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const _Rect(width: 70, height: 22, radius: 12),
                    if (isManager) ...[
                      const SizedBox(height: 6),
                      const Row(
                        children: [
                          _Circle(size: 24),
                          SizedBox(width: 6),
                          _Circle(size: 24),
                        ],
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Info chips: date + party size
            const Row(
              children: [
                _Rect(width: 130, height: 28, radius: 6),
                SizedBox(width: 10),
                _Rect(width: 90, height: 28, radius: 6),
              ],
            ),
            if (isManager) ...[
              const SizedBox(height: 14),
              // Action buttons row
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _Rect(width: 80, height: 32, radius: 6),
                  SizedBox(width: 8),
                  _Rect(width: 80, height: 32, radius: 6),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Analytics Dashboard Shimmer ─────────────────────────────────────────────

/// Skeleton for [AnalyticsDashboardPage] while loading.
/// Mimics the full dashboard: period selector + KPI cards row + line chart +
/// funnel + breakdown cards.
class AnalyticsDashboardShimmer extends StatelessWidget {
  const AnalyticsDashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: _kBaseColor,
      highlightColor: _kHighlightColor,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Period selector: business name + segmented button
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Rect(width: 130, height: 14),
                  _Rect(width: 170, height: 32, radius: 16),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // KPI cards row (horizontal scroll)
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, __) => const _KpiCardSkeleton(),
              ),
            ),
            const SizedBox(height: 20),

            // Daily trends chart placeholder
            const _ChartSkeleton(height: 220),
            const SizedBox(height: 20),

            // Funnel chart placeholder
            const _ChartSkeleton(height: 180),
            const SizedBox(height: 20),

            // Breakdown cards (donut + bar side by side)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _BreakdownCardSkeleton()),
                  SizedBox(width: 12),
                  Expanded(child: _BreakdownCardSkeleton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Mimics [KpiCard]: icon box + value + label inside a 140-wide container.
class _KpiCardSkeleton extends StatelessWidget {
  const _KpiCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Rect(width: 30, height: 30, radius: 8),
          _Rect(width: 60, height: 20),
          _Rect(width: 90, height: 11),
        ],
      ),
    );
  }
}

/// Generic chart placeholder: card with title line + a series of horizontal bars.
class _ChartSkeleton extends StatelessWidget {
  final double height;
  const _ChartSkeleton({required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Rect(width: 120, height: 14),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (i) {
                  // Vary bar heights to look like a chart
                  final heights = [0.4, 0.6, 0.5, 0.8, 0.65, 0.75, 0.55];
                  return Expanded(
                    child: FractionallySizedBox(
                      heightFactor: heights[i],
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAEAEA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Placeholder for a breakdown card (donut or bar chart).
class _BreakdownCardSkeleton extends StatelessWidget {
  const _BreakdownCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Rect(width: 100, height: 12),
          SizedBox(height: 14),
          Center(child: _Circle(size: 90)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Rect(width: 40, height: 10),
              _Rect(width: 40, height: 10),
              _Rect(width: 40, height: 10),
            ],
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
