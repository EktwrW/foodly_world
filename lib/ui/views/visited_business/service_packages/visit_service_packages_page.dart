import 'dart:async';

import 'package:animate_do/animate_do.dart' show FadeIn, FadeInUp;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, S, AppRouter, di, PaddingExtension;
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/services/service_events_tracker.dart';
import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart' show YouTubeVideoPlayer;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/service_packages/cubit/visit_service_packages_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/service_packages/widgets/service_booking_request_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;
import 'package:visibility_detector/visibility_detector.dart';

class VisitServicePackagesPage extends StatelessWidget {
  const VisitServicePackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        leading: CustomRoundedNeumorphicButton(
          iconSize: 26,
          diameter: 32,
          iconData: Bootstrap.caret_left_fill,
          onPressed: () {
            if (context.canPop()) {
              di<AppRouter>().removeLastRouteHistory();
              context.pop();
            } else {
              di<AppRouter>().goBackToLastRoute();
            }
          },
        ).paddingSymmetric(vertical: 6, horizontal: 8),
        leadingWidth: 60,
        title: Text(
          S.current.servicePackages,
          style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: BlocBuilder<VisitServicePackagesCubit, VisitServicePackagesState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator(color: FoodlyThemes.primaryFoodly)),
                error: (msg) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(msg, style: FoodlyTextStyles.label, textAlign: TextAlign.center),
                  ),
                ),
                loaded: (profile, packages, allowReservations) =>
                    _LoadedContent(profile: profile, packages: packages, allowReservations: allowReservations),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ── Loaded Content ──────────────────────────────────────────────

class _LoadedContent extends StatelessWidget {
  final ProfessionalProfileDM? profile;
  final List<ServicePackageDM> packages;

  /// Mirrors `business.allow_reservations`. When false we keep the cards
  /// visible (visitors may still browse offerings) but neutralise the
  /// "Request service" CTA with a short explanatory snackbar. Ultimate
  /// enforcement lives in `ReservationController::storeServiceBooking`.
  final bool allowReservations;

  const _LoadedContent({this.profile, required this.packages, required this.allowReservations});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final horizontalPadding = isMobile ? 16.0 : 32.0;

    return CustomScrollView(
      slivers: [
        // ── Profile Header ──
        if (profile != null)
          SliverToBoxAdapter(
            child: FadeIn(
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
                child: _ProfileHeader(profile: profile!, isMobile: isMobile),
              ),
            ),
          ),

        // ── Empty State ──
        if (packages.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  const Icon(Bootstrap.briefcase, size: 48, color: Colors.black26),
                  Text(S.current.noPackagesYet, style: FoodlyTextStyles.label),
                ],
              ),
            ),
          )

        // ── Desktop/Tablet: Grid layout ──
        else if (!isMobile)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 420,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: _estimateCardHeight(packages),
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => FadeInUp(
                  delay: Duration(milliseconds: 60 * index),
                  duration: const Duration(milliseconds: 300),
                  child: _PackageVisibilityTracker(
                    packageUuid: packages[index].uuid ?? '',
                    position: index,
                    child: _VisitorPackageCard(
                      package: packages[index],
                      isMobile: false,
                      allowReservations: allowReservations,
                    ),
                  ),
                ),
                childCount: packages.length,
              ),
            ),
          )

        // ── Mobile: Single column list ──
        else
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 8),
            sliver: SliverList.builder(
              itemCount: packages.length,
              itemBuilder: (context, index) {
                return FadeInUp(
                  delay: Duration(milliseconds: 80 * index),
                  duration: const Duration(milliseconds: 300),
                  child: _PackageVisibilityTracker(
                    packageUuid: packages[index].uuid ?? '',
                    position: index,
                    child: _VisitorPackageCard(
                      package: packages[index],
                      isMobile: true,
                      allowReservations: allowReservations,
                    ),
                  ),
                );
              },
            ),
          ),

        // Bottom spacing
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }

  /// Estimate a reasonable fixed height for grid items based on content patterns.
  double _estimateCardHeight(List<ServicePackageDM> packages) {
    final hasPhotos = packages.any((p) => p.photos.isNotEmpty);
    final hasIncludes = packages.any((p) => p.includes.isNotEmpty);
    double h = 160; // base (title + type badge + price row)
    if (hasPhotos) h += 200;
    if (hasIncludes) h += 100;
    h += 60; // Request Service CTA
    return h;
  }
}

// ── Profile Header ──────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  final ProfessionalProfileDM profile;
  final bool isMobile;

  const _ProfileHeader({required this.profile, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3)),
      ),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        _buildHeader(),
        if (profile.hasPortfolioVideo) _buildPortfolioVideo(),
        ..._buildInfoWidgets(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    final infoWidgets = _buildInfoWidgets();
    final midpoint = (infoWidgets.length / 2).ceil();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        _buildHeader(),
        if (profile.hasPortfolioVideo) _buildPortfolioVideo(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: infoWidgets.sublist(0, midpoint),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: infoWidgets.sublist(midpoint),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Bootstrap.person_badge, size: 20, color: FoodlyThemes.primaryFoodly),
        Text(S.current.professionalProfile, style: FoodlyTextStyles.labelPurpleBold),
        if (profile.isVerified) const Icon(Bootstrap.patch_check_fill, size: 16, color: FoodlyThemes.tertiaryFoodly),
      ],
    );
  }

  /// Portfolio video block. Guarded by [profile.hasPortfolioVideo] so this is
  /// only called when there's a URL. We reuse the same [YouTubeVideoPlayer]
  /// that powers promotions: inline playback on mobile, thumbnail + external
  /// launch on web (the package's WebView isn't supported there), and a
  /// graceful fallback to a thumbnail when the embed fails (geo-restricted,
  /// embed-disabled, or WebView stuck on loading).
  Widget _buildPortfolioVideo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Row(
          spacing: 6,
          children: [
            const Icon(Bootstrap.play_btn, size: 16, color: FoodlyThemes.primaryFoodly),
            Text(S.current.portfolio, style: FoodlyTextStyles.captionBold),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: YouTubeVideoPlayer(url: profile.portfolioVideoUrl!),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildInfoWidgets() {
    return [
      if (profile.specialties.isNotEmpty) _TagRow(label: S.current.specialties, tags: profile.specialties),
      if (profile.cuisines.isNotEmpty) _TagRow(label: S.current.cuisines, tags: profile.cuisines),
      if (profile.yearsExperience != null)
        _InfoChip(icon: Bootstrap.clock_history, text: '${profile.yearsExperience} ${S.current.yearsExperience}'),
      if (profile.teamSize != null)
        _InfoChip(icon: FontAwesome.people_group_solid, text: _teamSizeLabel(profile.teamSize!)),
      if (profile.serviceRadiusKm != null) _InfoChip(icon: Bootstrap.geo_alt, text: '${profile.serviceRadiusKm} km'),
      if (profile.certifications.isNotEmpty) _TagRow(label: S.current.certifications, tags: profile.certifications),
      if (profile.languagesSpoken.isNotEmpty) _TagRow(label: S.current.languages, tags: profile.languagesSpoken),
      if (profile.cancellationPolicy != null)
        _InfoChip(
          icon: Bootstrap.shield_check,
          text: '${S.current.cancellationPolicy}: ${_cancellationLabel(profile.cancellationPolicy!)}',
        ),
      if (profile.hasInsurance) _InfoChip(icon: Bootstrap.shield_fill_check, text: S.current.hasInsurance),
    ];
  }

  String _teamSizeLabel(TeamSize ts) {
    return switch (ts) {
      TeamSize.solo => S.current.solo,
      TeamSize.small2to4 => '2–4',
      TeamSize.medium5to10 => '5–10',
      TeamSize.large11Plus => '11+',
    };
  }

  String _cancellationLabel(CancellationPolicy cp) {
    return switch (cp) {
      CancellationPolicy.flexible => S.current.flexible,
      CancellationPolicy.moderate => S.current.moderate,
      CancellationPolicy.strict => S.current.strict,
    };
  }
}

// ── Tag Row ─────────────────────────────────────────────────────

class _TagRow extends StatelessWidget {
  final String label;
  final List<String> tags;

  const _TagRow({required this.label, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(label, style: FoodlyTextStyles.captionBold),
        Wrap(
          spacing: 6,
          runSpacing: 4,
          children: tags.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(tag, style: const TextStyle(fontSize: 12, color: FoodlyThemes.primaryFoodly)),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ── Info Chip ───────────────────────────────────────────────────

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        Icon(icon, size: 14, color: FoodlyThemes.primaryFoodly),
        Flexible(child: Text(text, style: FoodlyTextStyles.captionBold)),
      ],
    );
  }
}

// ── Visitor Package Card ────────────────────────────────────────

class _VisitorPackageCard extends StatelessWidget {
  final ServicePackageDM package;
  final bool isMobile;
  final bool allowReservations;

  const _VisitorPackageCard({
    required this.package,
    required this.isMobile,
    required this.allowReservations,
  });

  @override
  Widget build(BuildContext context) {
    final photoHeight = isMobile ? 180.0 : 220.0;
    final contentPadding = isMobile ? 14.0 : 18.0;

    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: isMobile ? 12 : 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo section
          if (package.photos.isNotEmpty)
            SizedBox(
              height: photoHeight,
              width: double.infinity,
              child: package.photos.length == 1
                  ? Image.network(package.photos.first.photoPath ?? '', fit: BoxFit.cover)
                  : PageView.builder(
                      itemCount: package.photos.length,
                      itemBuilder: (_, i) => Image.network(package.photos[i].photoPath ?? '', fit: BoxFit.cover),
                    ),
            ),

          Padding(
            padding: EdgeInsets.all(contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                // Title + featured badge
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        package.title,
                        style: isMobile ? FoodlyTextStyles.actionsBodyBold : FoodlyTextStyles.menuTitle,
                      ),
                    ),
                    if (package.isFeatured)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 4,
                          children: [
                            Icon(Bootstrap.star_fill, size: 12, color: Colors.amber.shade700),
                            Text(
                              S.current.featured,
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.amber.shade800),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

                // Service type badge
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: FoodlyThemes.primaryFoodly,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        package.serviceType.icon,
                        size: 13,
                        color: FoodlyThemes.primaryFoodly,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        package.serviceType.label,
                        style: FoodlyTextStyles.choiceChipBold.copyWith(
                          color: FoodlyThemes.primaryFoodly,
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 9, vertical: 3),
                ),

                // Description
                if (package.description != null && package.description!.isNotEmpty)
                  Text(
                    package.description!,
                    style: FoodlyTextStyles.caption,
                    maxLines: isMobile ? 3 : 5,
                    overflow: TextOverflow.ellipsis,
                  ),

                // Info chips row
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  children: [
                    if (package.isOnQuote)
                      _InfoChip(icon: Bootstrap.chat_left_quote, text: S.current.onQuote)
                    else if (package.hasPrice)
                      _InfoChip(
                        icon: Bootstrap.cash,
                        // Customer-facing card: the package itself carries
                        // its currency (BE persists it). Fallback is `$`,
                        // matching the global default used by MenuVM and
                        // AuthSessionService.currency. Never default to
                        // `€` — would mislabel ARS / VES / USD prices.
                        text:
                            '${package.currency ?? "\$"} ${package.price!.toStringAsFixed(2)} ${package.priceType.priceTypeLabel}',
                      ),
                    if (package.hasGuestRange)
                      _InfoChip(
                          icon: FontAwesome.people_group_solid, text: '${package.guestRangeText} ${S.current.guests}'),
                    if (package.durationHours != null)
                      _InfoChip(icon: Bootstrap.clock, text: '${package.durationHours}h'),
                  ],
                ),

                // Includes
                if (package.includes.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(S.current.includes, style: FoodlyTextStyles.caption.copyWith(fontWeight: FontWeight.w600)),
                      ...package.includes.take(isMobile ? 5 : 8).map(
                            (item) => Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 6,
                              children: [
                                const Icon(Bootstrap.check2, size: 14, color: FoodlyThemes.tertiaryFoodly),
                                Flexible(child: Text(item, style: FoodlyTextStyles.caption)),
                              ],
                            ),
                          ),
                      if (package.includes.length > (isMobile ? 5 : 8))
                        Text(
                          '+${package.includes.length - (isMobile ? 5 : 8)} ${S.current.more}',
                          style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
                        ),
                    ],
                  ),

                // Request Service CTA — greyed-out when the business has
                // flipped off `allow_reservations`. Tapping the disabled
                // state still gives the user feedback via a snackbar so the
                // affordance doesn't feel broken (silent no-op). We wrap in
                // a GestureDetector + IgnorePointer because
                // CustomNeumorphicButton nullifies onPressed when
                // `disabled: true`, so we need the outer detector to catch
                // the tap and surface the snackbar.
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: CustomNeumorphicButton(
                    text: S.current.requestService,
                    disabled: !allowReservations,
                    tooltip: !allowReservations ? S.current.businessNotAcceptingRequestsNow : null,
                    fontSize: 13,
                    padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    onPressed: () {
                      final businessUuid = context.read<VisitServicePackagesCubit>().businessUuid;
                      // service.package_inquiry — funnel checkpoint between
                      // viewing and submitting the booking. Fired on the tap
                      // (not after the sheet mounts) so we still capture
                      // the intent if the sheet itself fails to open.
                      di<ServiceEventsTracker>().packageInquiry(
                        packageUuid: package.uuid ?? '',
                        businessUuid: businessUuid,
                        sourceModule: 'VisitServicePackagesPage',
                      );
                      showServiceBookingRequestSheet(
                        context,
                        businessUuid: businessUuid,
                        package: package,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Package visibility tracker ──────────────────────────────────
//
// Wraps a package card and emits `service.package_view` exactly once when
// the card has been at least 50 % visible for a continuous 1 s. Standard
// feed-analytics gating to filter:
//
//   - Scroll fly-bys (cards that flash through the viewport without
//     actually being read).
//   - Off-screen cards built by the SliverList builder.
//
// Tracking from a dedicated wrapper (instead of inside the card itself)
// keeps the card stateless and lets us enable/disable analytics at the
// page level by swapping the wrapper for `child` in tests.

class _PackageVisibilityTracker extends StatefulWidget {
  final String packageUuid;
  final int position;
  final Widget child;

  const _PackageVisibilityTracker({
    required this.packageUuid,
    required this.position,
    required this.child,
  });

  @override
  State<_PackageVisibilityTracker> createState() => _PackageVisibilityTrackerState();
}

class _PackageVisibilityTrackerState extends State<_PackageVisibilityTracker> {
  static const _visibilityThreshold = 0.5;
  static const _dwellTime = Duration(seconds: 1);

  Timer? _dwellTimer;
  bool _tracked = false;

  @override
  void dispose() {
    _dwellTimer?.cancel();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (_tracked || widget.packageUuid.isEmpty) return;

    if (info.visibleFraction >= _visibilityThreshold) {
      // Card crossed the threshold — start the dwell countdown. If it
      // disappears before the timer fires, we cancel and wait for the
      // next time it reappears.
      _dwellTimer ??= Timer(_dwellTime, () {
        if (!mounted || _tracked) return;
        _tracked = true;
        final businessUuid = context.read<VisitServicePackagesCubit>().businessUuid;
        di<ServiceEventsTracker>().packageView(
          packageUuid: widget.packageUuid,
          businessUuid: businessUuid,
          position: widget.position,
          sourceModule: 'VisitServicePackagesPage',
        );
      });
    } else {
      _dwellTimer?.cancel();
      _dwellTimer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('pkg-vis-${widget.packageUuid}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: widget.child,
    );
  }
}
