part of '../categories_page.dart';

/// Horizontal filter bar surfaced in [CategoriesPage] when the active
/// category is `cateringAndChefs`. Renders:
///   1. A scrollable row of [ServiceType] chips (wedding, birthday, cocktail…)
///   2. A compact segmented control for [DiscoveryOrdering] (distance /
///      price / rating).
///
/// Production quality: matches the glassmorphic-purple AppBar + primary-green
/// selection language already used by the radius selector right above. Reuses
/// [FoodlyThemes] tokens so changes to brand colours propagate for free.
class _CateringFiltersBar extends StatelessWidget {
  final ServiceType? selectedServiceType;
  final DiscoveryOrdering ordering;
  final ValueChanged<ServiceType?> onServiceTypeSelected;
  final ValueChanged<DiscoveryOrdering> onOrderingChanged;

  const _CateringFiltersBar({
    super.key,
    required this.selectedServiceType,
    required this.ordering,
    required this.onServiceTypeSelected,
    required this.onOrderingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 38,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: ServiceType.discoveryChipOrder.length + 1, // +1 for "All"
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              if (index == 0) {
                final selected = selectedServiceType == null;
                return _FilterChip(
                  label: S.current.serviceTypeAll,
                  icon: Bootstrap.grid,
                  selected: selected,
                  onTap: () => onServiceTypeSelected(null),
                );
              }
              final type = ServiceType.discoveryChipOrder[index - 1];
              final selected = selectedServiceType == type;
              return _FilterChip(
                label: type.label,
                icon: type.icon,
                selected: selected,
                onTap: () => onServiceTypeSelected(type),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  S.current.orderingLabel,
                  style: FoodlyTextStyles.captionPurple,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SegmentedButton<DiscoveryOrdering>(
                segments: DiscoveryOrdering.values
                    .map(
                      (o) => ButtonSegment<DiscoveryOrdering>(
                        value: o,
                        label: Text(
                          o.label,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
                        ),
                      ),
                    )
                    .toList(),
                selected: {ordering},
                onSelectionChanged: (newSelection) => onOrderingChanged(newSelection.first),
                showSelectedIcon: false,
                style: ButtonStyle(
                  side: const WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.primaryFoodly)),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    return states.contains(WidgetState.selected) ? Colors.white : FoodlyThemes.primaryFoodly;
                  }),
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return FoodlyThemes.primaryFoodly.withValues(alpha: .7);
                    }
                    return null;
                  }),
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? FoodlyThemes.primaryFoodly : Colors.white;
    final fg = selected ? Colors.white : FoodlyThemes.primaryFoodly;
    final borderColor = FoodlyThemes.primaryFoodly.withValues(alpha: selected ? 1 : .45);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: AnimatedContainer(
          duration: Durations.short3,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: borderColor, width: selected ? 1.4 : 1),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: FoodlyThemes.primaryFoodly.withValues(alpha: .25),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: fg),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: fg,
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
