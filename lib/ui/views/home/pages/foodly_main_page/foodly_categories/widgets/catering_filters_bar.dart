part of '../categories_page.dart';

/// Filter row surfaced in [CategoriesPage] when the active category is
/// `cateringAndChefs`. Two compact dropdowns side-by-side:
///
///   1. **Tipo de evento** — `ServiceType` (wedding, birthday, cocktail…)
///      with a "Todos" null entry at the top.
///   2. **Ordenar por** — `DiscoveryOrdering` (distance / price_asc /
///      rating_desc).
///
/// Why dropdowns and not chips+segmented: on mobile the combined radius
/// pills + chip scroller + segmented button stacked vertically felt
/// visually noisy — too many "purple pill rows" competing for attention
/// right under the AppBar. Two dropdowns collapse the same state into a
/// single row that's compact on phones and scales cleanly to tablets.
/// Matches the styling of `_StatusFilterDropdown` in
/// `manage_reservations_page.dart` so the discovery page speaks the same
/// visual language as the business dashboard.
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        spacing: 10,
        children: [
          // ── Tipo de evento ───────────────────────────────────
          Expanded(
            child: _FilterDropdownShell<ServiceType?>(
              value: selectedServiceType,
              leadingIcon: selectedServiceType?.icon ?? Bootstrap.grid,
              items: [
                _DropdownItem(null, S.current.serviceTypeAll, Bootstrap.grid),
                for (final t in ServiceType.discoveryChipOrder) _DropdownItem<ServiceType?>(t, t.label, t.icon),
              ],
              onChanged: onServiceTypeSelected,
            ),
          ),
          // ── Ordenar por ──────────────────────────────────────
          Expanded(
            child: _FilterDropdownShell<DiscoveryOrdering>(
              value: ordering,
              leadingIcon: _orderingIcon(ordering),
              items: [
                for (final o in DiscoveryOrdering.values)
                  _DropdownItem<DiscoveryOrdering>(o, o.label, _orderingIcon(o)),
              ],
              onChanged: (v) {
                if (v != null) onOrderingChanged(v);
              },
            ),
          ),
        ],
      ),
    );
  }

  static IconData _orderingIcon(DiscoveryOrdering o) => switch (o) {
        // Sensible default — near-me is the map-pin metaphor users already
        // associate with "distance sort" in most food apps.
        DiscoveryOrdering.distance => Bootstrap.geo_alt,
        DiscoveryOrdering.priceAsc => Bootstrap.tag,
        DiscoveryOrdering.ratingDesc => Bootstrap.star,
      };
}

/// Value-label-icon triple for each dropdown entry. Kept as a private
/// record-lite class so the generic [_FilterDropdownShell] can work for
/// any enum (ServiceType, DiscoveryOrdering, and anything else that
/// joins this page later) without duplicating the shell's glassmorphic
/// styling.
class _DropdownItem<T> {
  final T value;
  final String label;
  final IconData icon;

  const _DropdownItem(this.value, this.label, this.icon);
}

/// Pill-shaped dropdown with a soft purple border + 5 %-alpha fill. Same
/// visual treatment as `_StatusFilterDropdown` in manage reservations so
/// the two screens feel like siblings. Uses [DropdownButton.selectedItemBuilder]
/// so the closed-state text renders in primary purple bold, while
/// expanded items render in neutral text for readability.
class _FilterDropdownShell<T> extends StatelessWidget {
  final T value;
  final IconData leadingIcon;
  final List<_DropdownItem<T>> items;
  final ValueChanged<T?> onChanged;

  const _FilterDropdownShell({
    super.key,
    required this.value,
    required this.leadingIcon,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.4)),
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.05),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(Bootstrap.chevron_down, size: 12, color: FoodlyThemes.primaryFoodly),
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          // The closed-state rendering — icon + label in primary purple bold.
          // We add the leading icon here because the expanded menu items
          // already include the icon inline; keeping both consistent means
          // the user sees the same affordance in open and closed states.
          selectedItemBuilder: (context) => items
              .map(
                (item) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(leadingIcon, size: 14, color: FoodlyThemes.primaryFoodly),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        item.label,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: FoodlyThemes.primaryFoodly,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item.value,
                  child: Row(
                    children: [
                      Icon(
                        item.icon,
                        size: 16,
                        color: item.value == value ? FoodlyThemes.primaryFoodly : Colors.black54,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.label,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: item.value == value ? FoodlyThemes.primaryFoodly : Colors.black87,
                            fontWeight: item.value == value ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
