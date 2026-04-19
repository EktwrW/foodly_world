import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;

class ServicePackageCard extends StatelessWidget {
  final ServicePackageDM package;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isManager;

  const ServicePackageCard({
    super.key,
    required this.package,
    this.onEdit,
    this.onDelete,
    this.isManager = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo carousel or placeholder
          _buildPhotoSection(),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + featured badge
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        package.title,
                        style: FoodlyTextStyles.actionsBodyBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (package.isFeatured)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.amber, width: 0.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 4,
                          children: [
                            const Icon(Bootstrap.star_fill, size: 10, color: Colors.amber),
                            Text(
                              S.current.featured,
                              style: const TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),

                // Service type badge
                _ServiceTypeBadge(serviceType: package.serviceType),
                const SizedBox(height: 8),

                // Description
                if (package.description != null && package.description!.isNotEmpty)
                  Text(
                    package.description!,
                    style: FoodlyTextStyles.caption,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                const SizedBox(height: 10),

                // Info chips: price, guests, duration
                Wrap(
                  spacing: 10,
                  runSpacing: 6,
                  children: [
                    if (package.hasPrice)
                      _InfoChip(
                        icon: Bootstrap.currency_exchange,
                        label:
                            '${package.currency ?? '€'}${package.price!.toStringAsFixed(2)} / ${_priceTypeLabel(package.priceType)}',
                      )
                    else if (package.isOnQuote)
                      _InfoChip(
                        icon: Bootstrap.currency_exchange,
                        label: S.current.onQuote,
                      ),
                    if (package.hasGuestRange)
                      _InfoChip(
                        icon: FontAwesome.people_group_solid,
                        label: '${package.guestRangeText} ${S.current.guests}',
                      ),
                    if (package.durationHours != null)
                      _InfoChip(
                        icon: Bootstrap.clock,
                        label: '${package.durationHours}h',
                      ),
                  ],
                ),

                // Includes list
                if (package.includes.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(S.current.includes, style: FoodlyTextStyles.captionBold),
                  const SizedBox(height: 4),
                  ...package.includes.take(4).map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Bootstrap.check2, size: 12, color: FoodlyThemes.tertiaryFoodly),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(item,
                                    style: FoodlyTextStyles.caption, maxLines: 1, overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ),
                  if (package.includes.length > 4)
                    Text(
                      '+${package.includes.length - 4} ${S.current.more}',
                      style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
                    ),
                ],

                // Manager action buttons
                if (isManager) ...[
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 8,
                    children: [
                      if (onDelete != null)
                        TextButton.icon(
                          onPressed: onDelete,
                          icon: const Icon(Bootstrap.trash, size: 14),
                          label: Text(S.current.delete, style: const TextStyle(fontSize: 12)),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red.shade700,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      if (onEdit != null)
                        TextButton.icon(
                          onPressed: onEdit,
                          icon: const Icon(Bootstrap.pencil_square, size: 14),
                          label: Text(S.current.edit, style: const TextStyle(fontSize: 12)),
                          style: TextButton.styleFrom(
                            foregroundColor: FoodlyThemes.primaryFoodly,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoSection() {
    if (package.photos.isEmpty) {
      return Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: const Center(
          child: Icon(Bootstrap.camera, size: 40, color: FoodlyThemes.secondaryFoodly),
        ),
      );
    }

    if (package.photos.length == 1) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: Image.network(
          package.photos.first.photoPath ?? '',
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 140,
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
            child: const Center(child: Icon(Bootstrap.image, size: 40, color: FoodlyThemes.secondaryFoodly)),
          ),
        ),
      );
    }

    // Multiple photos — horizontal page view
    return SizedBox(
      height: 180,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        child: PageView.builder(
          itemCount: package.photos.length,
          itemBuilder: (context, index) {
            return Image.network(
              package.photos[index].photoPath ?? '',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                child: const Center(child: Icon(Bootstrap.image, size: 40, color: FoodlyThemes.secondaryFoodly)),
              ),
            );
          },
        ),
      ),
    );
  }

  String _priceTypeLabel(PriceType type) {
    return switch (type) {
      PriceType.fixed => S.current.fixed,
      PriceType.perPerson => S.current.perPerson,
      PriceType.perHour => S.current.perHour,
      PriceType.onQuote => S.current.onQuote,
    };
  }
}

class _ServiceTypeBadge extends StatelessWidget {
  final ServiceType serviceType;

  const _ServiceTypeBadge({required this.serviceType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _label,
        style: const TextStyle(color: FoodlyThemes.primaryFoodly, fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }

  String get _label => switch (serviceType) {
        ServiceType.dinner => S.current.dinner,
        ServiceType.lunch => S.current.lunch,
        ServiceType.brunch => S.current.brunch,
        ServiceType.cocktail => S.current.cocktail,
        ServiceType.wedding => S.current.wedding,
        ServiceType.corporate => S.current.corporate,
        ServiceType.birthday => S.current.birthday,
        ServiceType.cookingClassPrivate => S.current.cookingClass,
        ServiceType.custom => S.current.custom,
      };
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Icon(icon, size: 13, color: FoodlyThemes.secondaryFoodly),
        Flexible(
          child: Text(label, style: FoodlyTextStyles.caption, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
