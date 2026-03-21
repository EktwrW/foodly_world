import 'dart:io';

import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart' hide CategoryDM;
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicMenuCategoryPage extends StatefulWidget {
  const PublicMenuCategoryPage({
    super.key,
    required this.categories,
    required this.menuCategory,
    required this.currency,
    required this.onScrollStart,
    required this.onScrollEnd,
  });

  final List<CategoryDM>? categories;
  final MenuCategory menuCategory;
  final String currency;
  final VoidCallback onScrollStart;
  final VoidCallback onScrollEnd;

  @override
  State<PublicMenuCategoryPage> createState() => _PublicMenuCategoryPageState();
}

class _PublicMenuCategoryPageState extends State<PublicMenuCategoryPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        if (widget.categories?.isEmpty ?? true) ...[
          Expanded(child: const NoItemsViewWdg().paddingBottom(80)),
        ] else
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) widget.onScrollStart();
                if (notification is ScrollEndNotification) widget.onScrollEnd();
                return true;
              },
              child: ListView.builder(
                controller: _scrollController,
                key: PageStorageKey('pub_menu_cat_${widget.menuCategory.name}'),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget.categories!.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final subCategory = widget.categories![index];
                  return _PublicSubCategoryWdg(
                    key: ValueKey(subCategory.uuid),
                    subCategory: subCategory,
                    menuCategory: widget.menuCategory,
                    currency: widget.currency,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

class _PublicSubCategoryWdg extends StatelessWidget {
  const _PublicSubCategoryWdg({
    super.key,
    required this.subCategory,
    required this.menuCategory,
    required this.currency,
  });

  final CategoryDM subCategory;
  final MenuCategory menuCategory;
  final String currency;

  static const _divider = Expanded(child: Divider(color: FoodlyThemes.primaryFoodly, thickness: 1.8));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        final items = subCategory.items;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: _buildTitle()),
            const SizedBox(height: 30),
            if (items.isNotEmpty)
              if (isWide)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      for (int i = 0; i < items.length; i++)
                        SizedBox(
                          width: (constraints.maxWidth - 16) / 2,
                          child: PublicMenuItemWdg(
                            key: Key(items[i].uuid),
                            item: items[i],
                            menuCategory: menuCategory,
                            currency: currency,
                          ),
                        ),
                    ],
                  ),
                )
              else
                for (int i = 0; i < items.length; i++)
                  PublicMenuItemWdg(
                    key: Key(items[i].uuid),
                    item: items[i],
                    menuCategory: menuCategory,
                    currency: currency,
                  ),
          ],
        ).paddingBottom(20);
      },
    );
  }

  Widget _buildTitle() {
    return FadeIn(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _divider,
          Expanded(
            flex: 3,
            child: Center(
              child: ui.NeumorphicText(
                subCategory.name,
                style: const ui.NeumorphicStyle(color: FoodlyThemes.primaryFoodly),
                textStyle: ui.NeumorphicTextStyle(
                  fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge?.fontFamily,
                  fontSize: FoodlyTextStyles.sectionsTitle.fontSize,
                  fontWeight: FoodlyTextStyles.sectionsTitle.fontWeight,
                ),
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
          _divider,
        ],
      ).paddingOnly(top: 24, right: 12, left: 12),
    );
  }
}

class PublicMenuItemWdg extends StatefulWidget {
  const PublicMenuItemWdg({
    super.key,
    required this.item,
    required this.menuCategory,
    required this.currency,
    this.margin,
  });

  final ItemDM item;
  final MenuCategory menuCategory;
  final String currency;
  final EdgeInsetsGeometry? margin;

  @override
  State<PublicMenuItemWdg> createState() => _PublicMenuItemWdgState();
}

class _PublicMenuItemWdgState extends State<PublicMenuItemWdg> {
  late Version _selectedVersion;

  @override
  void initState() {
    super.initState();
    _selectedVersion = widget.item.sortedVersions.isNotEmpty ? widget.item.sortedVersions.first : Version.regular;
  }

  void _updateSelectedVersion(Version? version) {
    if (version != null && version != _selectedVersion) setState(() => _selectedVersion = version);
  }

  double get _currentPrice =>
      widget.item.sortedVersions.isEmpty ? widget.item.prices.regular : widget.item.getVersionPrice(_selectedVersion);

  bool get _itemNotAvailable => !widget.item.available;

  String get _photoUrl {
    final photos = widget.item.referencePhotos;
    if (photos == null || photos.isEmpty) return '';
    final last = photos.last;
    if (widget.menuCategory.isFood) return last.businessFoodPhotoUrl ?? '';
    if (widget.menuCategory.isDrinks) return last.businessDrinkPhotoUrl ?? '';
    return last.businessComboPhotoUrl ?? '';
  }

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
                      _PublicMenuItemPictureWdg(
                        photoUrl: _photoUrl,
                        item: widget.item,
                        menuCategory: widget.menuCategory,
                      ),
                      Expanded(
                        flex: 9,
                        child: _buildNameAndDescription(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: _itemNotAvailable ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: [
                      _buildVersionSelector(context).paddingOnly(left: 10, right: 6),
                      if (widget.item.available) const Spacer(),
                      if (widget.item.available)
                        Text('${widget.currency}:', style: FoodlyTextStyles.label).paddingHorizontal(4),
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
                  ).paddingBottom(_itemNotAvailable ? 8 : 0),
                ],
              ).paddingRight(2),
            ),
          ).paddingOnly(left: 6, right: 6, bottom: 20),
        ],
      ),
    );
  }

  Widget _buildNameAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: FoodlyTextStyles.labelPurpleBold.copyWith(letterSpacing: .75, fontSize: 13),
              ).paddingTop(12),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Tooltip(
                message: widget.item.description,
                child: Text(
                  widget.item.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.caption,
                ).paddingVertical(5),
              ),
            ),
          ],
        ),
      ],
    ).paddingHorizontal(10);
  }

  Widget _buildVersionSelector(BuildContext context) {
    if (_itemNotAvailable) {
      return Text(S.current.temporarilyUnavailable, style: FoodlyTextStyles.errorBodyText).paddingTop(12);
    }
    if (widget.item.sortedVersions.isEmpty) return const SizedBox.shrink();
    return context.isSmallWidthPhone ? _buildDropdown() : _buildToggleButtons();
  }

  Widget _buildToggleButtons() {
    return ToggleButtons(
      isSelected: widget.item.sortedVersions.map((v) => v == _selectedVersion).toList(),
      onPressed: (i) => _updateSelectedVersion(widget.item.sortedVersions[i]),
      constraints: const BoxConstraints.expand(height: 24, width: 70),
      borderRadius: BorderRadius.circular(2.0),
      fillColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
      borderWidth: 0,
      borderColor: FoodlyThemes.secondaryFoodly,
      selectedColor: FoodlyThemes.primaryFoodly,
      color: Colors.black,
      children: widget.item.sortedVersions
          .map((v) =>
              Text(v.text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)).paddingHorizontal(4))
          .toList(),
    );
  }

  Widget _buildDropdown() {
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
            items: widget.item.sortedVersions
                .map((v) => DropdownMenuItem<Version>(
                      value: v,
                      child: Text(
                        v.text,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: v == _selectedVersion ? FoodlyThemes.primaryFoodly : Colors.black,
                        ),
                      ),
                    ))
                .toList(),
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

class _PublicMenuItemPictureWdg extends StatelessWidget {
  const _PublicMenuItemPictureWdg({
    required this.photoUrl,
    required this.item,
    required this.menuCategory,
  });

  final String photoUrl;
  final ItemDM item;
  final MenuCategory menuCategory;

  Widget get _imageWidget {
    if (photoUrl.startsWith('http://') || photoUrl.startsWith('https://')) {
      return CachedNetworkImage(
        imageUrl: photoUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => const LoadingWidgetFoodlyIso(height: 28),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
      );
    }
    if (kIsWeb) {
      return Image.network(photoUrl, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.error));
    }
    return Image.file(File(photoUrl), fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.error));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: FoodlyThemes.primaryFoodly.withValues(alpha: .093),
      ),
      clipBehavior: Clip.hardEdge,
      child: photoUrl.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ui.NeumorphicIcon(
                  Icons.dining_outlined,
                  style: ui.NeumorphicStyle(
                    shape: ui.NeumorphicShape.concave,
                    color: FoodlyThemes.accentColor,
                    depth: 2,
                  ),
                  size: 50,
                ),
              ],
            )
          : _imageWidget,
    ).paddingOnly(top: 10, left: 10);
  }
}
