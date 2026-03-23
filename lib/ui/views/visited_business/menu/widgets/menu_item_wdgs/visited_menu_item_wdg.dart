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
    return widget.item.getVersionPrice(_selectedVersion);
  }

  Widget get _currencyWidget => Text('${widget.vm?.currency ?? widget.currency}:', style: FoodlyTextStyles.label);
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
                      FavMenuItemBtns(
                        key: Key(widget.item.uuid),
                        item: widget.item,
                        menuCategory: widget.menuCategory,
                      ).paddingAll(2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: !widget.item.available ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: [
                      // Usar el selector de versiones conectado a nuestro método de actualización
                      _buildVersionSelector(context).paddingOnly(left: 10, right: 6),
                      if (widget.item.available) const Spacer(),
                      if (widget.item.available) _currencyWidget.paddingHorizontal(4),
                      if (widget.item.available)
                        SizedBox(
                          width: 110,
                          height: 36,
                          child: Card.filled(
                            elevation: 3,
                            color: FoodlyThemes.tertiaryFoodly,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text(
                                _itemNotAvailable ? '-' : '$_currentPrice',
                                style: FoodlyTextStyles.bodyWhiteSemibold.copyWith(fontSize: 16.5),
                              ),
                            ),
                          ),
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
