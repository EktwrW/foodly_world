part of '../visited_menu_category_builder_wdg.dart';

class VisitedMenuItemWdg extends StatefulWidget {
  const VisitedMenuItemWdg({
    super.key,
    required this.menuCategory,
    this.vm,
    this.currency,
    required this.item,
    required this.isLastScreenItem,
    this.margin,
  });

  final MenuCategory menuCategory;
  final MenuVM? vm;
  final String? currency;
  final ItemDM item;
  final bool isLastScreenItem;
  final EdgeInsetsGeometry? margin;

  @override
  State<VisitedMenuItemWdg> createState() => _VisitedMenuItemWdgState();
}

class _VisitedMenuItemWdgState extends State<VisitedMenuItemWdg> {
  // Estado para mantener la versión seleccionada
  late Version _selectedVersion;

  @override
  void initState() {
    super.initState();
    // Inicializar con la versión predeterminada del ítem
    // Verificar que existan versiones para evitar errores
    if (widget.item.sortedVersions.isNotEmpty) {
      _selectedVersion = widget.item.sortedVersions.first;
    } else {
      // Valor por defecto si no hay versiones
      _selectedVersion = Version.regular;
    }
  }

  // Método para actualizar la versión seleccionada
  void _updateSelectedVersion(Version? version) {
    if (version != null && version != _selectedVersion) {
      setState(() {
        _selectedVersion = version;
      });
    }
  }

  // Obtener el precio de la versión actual seleccionada
  double get _currentPrice {
    if (widget.item.sortedVersions.isEmpty) {
      // Si no hay versiones disponibles, usar el precio regular o 0
      return widget.item.prices.regular;
    }
    return widget.item.getVersionPrice(_selectedVersion) ?? 0;
  }

  bool get _itemNotAvailable => !widget.item.available;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Durations.short1,
      opacity: _itemNotAvailable ? .5 : 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 2,
            color: ui.NeumorphicColors.decorationMaxWhiteColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedSize(
              duration: Durations.medium3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VisitedMenuItemPictureWdg(
                        item: widget.item,
                        menuCategory: widget.menuCategory,
                      ),
                      Expanded(
                        flex: 9,
                        child: VisitedItemNameAndDescriptionWdg(item: widget.item),
                      ),
                      Column(
                        spacing: 16,
                        children: [
                          FavMenuItemBtns(
                            key: Key(widget.item.uuid),
                            item: widget.item,
                            menuCategory: widget.menuCategory,
                          ),
                          // "+" para sumar el plato a la orden grupal activa (si la hay).
                          if (widget.item.available)
                            _AddToGroupOrderButton(
                              businessUuid: widget.vm?.menuDM?.business?.uuid,
                              itemableType: _groupItemableType(widget.menuCategory),
                              itemUuid: widget.item.uuid,
                              // El tamaño que el comensal está viendo AHORA:
                              // es el precio que le muestra el toggle de
                              // arriba. Sin esto el BE cobra regular y
                              // fusiona la grande con la chica en una línea.
                              version: _selectedVersion,
                            ),
                        ],
                      ).paddingAll(2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: !widget.item.available ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: [
                      // Usar el selector de versiones conectado a nuestro método de actualización
                      _buildVersionSelector(context).paddingOnly(left: 10, right: 6),
                      if (widget.item.available) const Spacer(),
                      // Patrón canónico: currency dentro del badge verde,
                      // a la izquierda del precio. Antes mostrábamos el
                      // currency afuera en negro y el precio adentro —
                      // se leían como dos cosas separadas. Ver
                      // MenuItemPriceTag.
                      if (widget.item.available)
                        MenuItemPriceTag(
                          currency: widget.vm?.currency ?? widget.currency ?? '\$',
                          price: _itemNotAvailable ? null : '$_currentPrice',
                        ),
                    ],
                  ).paddingBottom(widget.item.available ? 0 : 8),
                ],
              ).paddingRight(2),
            ),
          ).paddingOnly(left: 6, right: 6, bottom: 20),
          if (widget.isLastScreenItem) const MenuDisclaimerWdg(),
        ],
      ),
    );
  }

  // Método para construir el selector de versiones
  Widget _buildVersionSelector(BuildContext context) {
    if (!widget.item.available) {
      return Text(S.current.temporarilyUnavailable, style: FoodlyTextStyles.errorBodyText).paddingTop(12);
    }

    // Si no hay versiones disponibles, mostrar un mensaje o no mostrar nada
    if (widget.item.sortedVersions.isEmpty) {
      return const SizedBox.shrink(); // Widget invisible
    }

    if (context.isSmallWidthPhone) {
      return _buildDropdownButton(context);
    } else {
      return _buildToggleButtons(context);
    }
  }

  Widget _buildToggleButtons(BuildContext context) {
    return ToggleButtons(
      isSelected: widget.item.sortedVersions.map((v) => v == _selectedVersion).toList(),
      onPressed: (index) => _updateSelectedVersion(widget.item.sortedVersions[index]),
      constraints: const BoxConstraints.expand(height: 24, width: 70),
      borderRadius: BorderRadius.circular(2.0),
      fillColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
      borderWidth: 0,
      borderColor: FoodlyThemes.secondaryFoodly,
      selectedColor: FoodlyThemes.primaryFoodly,
      color: Colors.black,
      children: widget.item.sortedVersions
          .map((v) => Text(
                v.text,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
              ).paddingHorizontal(4))
          .toList(),
    );
  }

  Widget _buildDropdownButton(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: ColoredBox(
        color: FoodlyThemes.primaryFoodly.withAlpha(15),
        child: SizedBox(
          width: 110,
          height: 28,
          child: DropdownButton<Version>(
            value: _selectedVersion,
            onChanged: _updateSelectedVersion,
            items: widget.item.sortedVersions.map((Version version) {
              return DropdownMenuItem<Version>(
                value: version,
                child: Text(
                  version.text,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: version == _selectedVersion ? FoodlyThemes.primaryFoodly : Colors.black,
                  ),
                ),
              );
            }).toList(),
            padding: const EdgeInsets.only(left: 10, top: 2, right: 4),
            borderRadius: BorderRadius.circular(8),
            icon: const Icon(Icons.arrow_drop_down, color: FoodlyThemes.primaryFoodly),
            isDense: true,
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}

/// Mapea la categoría del menú al `itemableType` que espera el backend.
String _groupItemableType(MenuCategory c) => switch (c) {
      MenuCategory.food => 'food',
      MenuCategory.drinks => 'drink',
      MenuCategory.combos => 'combo',
    };

/// Botón "+" que suma el plato a la orden grupal ACTIVA. Solo aparece cuando
/// hay una orden abierta para ESTE negocio (reacciona al ActiveGroupOrderCubit).
/// Botón "+" de agregar a la orden. Feedback e2e 2026-07-31: al agregar con
/// éxito hace un morph elegante a verde con check (~200ms de transición,
/// check visible ~900ms) y vuelve solo. Barato en performance: es un widget
/// de 28px con un AnimatedContainer + AnimatedSwitcher — nada de rebuilds
/// del tile ni listeners globales.
class _AddToGroupOrderButton extends StatefulWidget {
  final String? businessUuid;
  final String itemableType;
  final String itemUuid;
  final Version version;

  const _AddToGroupOrderButton({
    required this.businessUuid,
    required this.itemableType,
    required this.itemUuid,
    required this.version,
  });

  @override
  State<_AddToGroupOrderButton> createState() => _AddToGroupOrderButtonState();
}

class _AddToGroupOrderButtonState extends State<_AddToGroupOrderButton> {
  bool _success = false;
  bool _busy = false;
  Timer? _revert;

  @override
  void dispose() {
    _revert?.cancel();
    super.dispose();
  }

  Future<void> _onTap(ActiveGroupOrderCubit cubit) async {
    if (_busy || _success) return; // el check en pantalla ya confirma este tap
    // e2e r6: spinner visible durante la espera — sin él, el usuario
    // re-tapea pensando que no registró (y el merge del BE lo colapsa a 1).
    setState(() => _busy = true);
    final ok = await cubit.addFood(
      widget.itemableType,
      widget.itemUuid,
      version: widget.version,
    );
    if (!mounted) return;
    setState(() => _busy = false);
    if (!ok) return;

    HapticFeedback.lightImpact();
    setState(() => _success = true);
    _revert?.cancel();
    _revert = Timer(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => _success = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final uuid = widget.businessUuid;
    if (uuid == null || uuid.isEmpty) return const SizedBox.shrink();

    final cubit = di<ActiveGroupOrderCubit>();
    return BlocBuilder<ActiveGroupOrderCubit, GroupOrderDM?>(
      bloc: cubit,
      builder: (context, order) {
        // F4b: en cuenta abierta la mesa sigue agregando ítems con la orden
        // ya CONFIRMADA (tandas) — mientras no se pida la cuenta.
        final acceptsItems =
            order != null && (order.isOpen || (order.isOpenTab && order.isConfirmed && order.billRequestedAt == null));
        final active = acceptsItems && order.businessUuid == uuid;
        if (!active) return const SizedBox.shrink();

        return InkWell(
          onTap: () => _onTap(cubit),
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: _success ? FoodlyThemes.tertiaryFoodly : FoodlyThemes.primaryFoodly,
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: UIDecorations.NEUMORPHIC_PURPLE_GRADIENT.colors),
              boxShadow: _success
                  ? [
                      BoxShadow(
                        color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.45),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                  : const [],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeOutBack,
              transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
              child: _busy
                  ? const SizedBox(
                      key: ValueKey('busy'),
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : Icon(
                      _success ? Icons.check_rounded : Icons.add_rounded,
                      key: ValueKey(_success),
                      color: Colors.white,
                      size: 18,
                    ),
            ),
          ),
        );
      },
    );
  }
}
