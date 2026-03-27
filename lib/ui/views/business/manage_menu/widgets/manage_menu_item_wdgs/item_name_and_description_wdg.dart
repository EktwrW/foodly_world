part of '../menu_category_builder_wdg.dart';

class ItemNameAndDescriptionWdg extends StatefulWidget {
  const ItemNameAndDescriptionWdg({
    super.key,
    required this.item,
    required this.cubit,
    required this.menuCategory,
    required this.subCategory,
  });

  final ItemDM item;
  final ManageMenuCubit cubit;
  final MenuCategory menuCategory;
  final CategoryDM subCategory;

  @override
  State<ItemNameAndDescriptionWdg> createState() => _ItemNameAndDescriptionWdgState();
}

class _ItemNameAndDescriptionWdgState extends State<ItemNameAndDescriptionWdg> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final FocusNode _nameFocusNode;
  late final FocusNode _descriptionFocusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item.name);
    _descriptionController = TextEditingController(text: widget.item.description);
    _nameFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _nameFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _updateNameAndDescription(ItemEditing itemEditing) {
    widget.cubit.updateItemNameOrDescription(
      widget.item.copyWith(editingField: itemEditing),
      widget.menuCategory,
      widget.subCategory.uuid,
      newName: _nameController.text,
      newDescription: _descriptionController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.item.isEditingName
            ? FoodlyPrimaryInputText(
                key: ValueKey('name_${widget.item.uuid}'),
                controller: _nameController,
                focusNode: _nameFocusNode,
                isUnderlineStyle: true,
                enabled: widget.item.isEditingName,
                autofocus: !widget.cubit.state.vm.avoidFocus,
                onChanged: (_) => _updateNameAndDescription(ItemEditing.name),
                onFieldSubmitted: (_) {
                  _updateNameAndDescription(ItemEditing.description);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_descriptionFocusNode.canRequestFocus) {
                      _descriptionFocusNode.requestFocus();
                    }
                  });
                },
                inputTextType: FoodlyInputType.generic,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: S.current.addName,
                maxLength: 30,
                suffixIconConstraints: BoxConstraints.tight(const Size(30, 20)),
                trailing: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _nameController,
                  builder: (context, value, child) {
                    final hasText = value.text.length > 2;
                    return IconButton(
                      onPressed: hasText
                          ? () {
                              _updateNameAndDescription(ItemEditing.description);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (_descriptionFocusNode.canRequestFocus) {
                                  _descriptionFocusNode.requestFocus();
                                }
                              });
                            }
                          : null,
                      icon: Icon(
                        Bootstrap.check_circle,
                        size: 18,
                        color: hasText ? FoodlyThemes.primaryFoodly : Colors.grey,
                      ),
                    );
                  },
                ),
              )
            : GestureDetector(
                onTap: () => widget.item.isEditing && !widget.item.isEditingName
                    ? _updateNameAndDescription(ItemEditing.name)
                    : null,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.isEditing
                            ? (_nameController.text.isNotEmpty ? _nameController.text : S.current.addName)
                            : widget.item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FoodlyTextStyles.labelPurpleBold.copyWith(
                            letterSpacing: .75,
                            fontSize: 13,
                            fontStyle: widget.item.name.isEmpty && widget.item.isEditing ? FontStyle.italic : null),
                      ).paddingTop(12),
                    ),
                  ],
                ),
              ),
        widget.item.isEditingDescription
            ? FoodlyPrimaryInputText(
                key: ValueKey('description_${widget.item.uuid}'),
                controller: _descriptionController,
                focusNode: _descriptionFocusNode,
                isUnderlineStyle: true,
                enabled: widget.item.isEditingDescription,
                autofocus: !widget.cubit.state.vm.avoidFocus,
                onChanged: (_) => _updateNameAndDescription(ItemEditing.description),
                onFieldSubmitted: (_) async {
                  _updateNameAndDescription(ItemEditing.versions);
                  _callToVersionsFocus();
                },
                inputTextType: FoodlyInputType.generic,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: S.current.addADescription,
                maxLength: 69,
                suffixIconConstraints: BoxConstraints.tight(const Size(30, 20)),
                trailing: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _descriptionController,
                  builder: (context, value, child) {
                    final hasText = value.text.length > 2;
                    return IconButton(
                      onPressed: hasText
                          ? () {
                              _updateNameAndDescription(ItemEditing.versions);
                              _callToVersionsFocus();
                            }
                          : null,
                      icon: Icon(
                        Bootstrap.check_circle,
                        size: 18,
                        color: hasText ? FoodlyThemes.primaryFoodly : Colors.grey,
                      ),
                    );
                  },
                ),
              )
            : GestureDetector(
                onTap: () => widget.item.isEditing && !widget.item.isEditingDescription
                    ? _updateNameAndDescription(ItemEditing.description)
                    : null,
                child: Row(
                  children: [
                    Expanded(
                      child: Tooltip(
                        message: widget.item.isEditing ? '' : widget.item.description,
                        child: Text(
                          widget.item.isEditing
                              ? (_descriptionController.text.isNotEmpty
                                  ? _descriptionController.text
                                  : S.current.addADescription)
                              : widget.item.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: FoodlyTextStyles.caption.copyWith(
                            fontStyle:
                                widget.item.description.isEmpty && widget.item.isEditing ? FontStyle.italic : null,
                            fontSize: 11.6,
                          ),
                        ).paddingVertical(5),
                      ),
                    ),
                  ],
                ),
              ),
      ],
    ).paddingHorizontal(10);
  }

  void _callToVersionsFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final nextFocusNode = widget.item.sortedVersions.firstWhereOrNull((v) => v.focusNode.canRequestFocus)?.focusNode;
      if (nextFocusNode != null) {
        nextFocusNode.requestFocus();
      }
    });
  }

  @override
  void didUpdateWidget(ItemNameAndDescriptionWdg oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update controllers if item changes externally
    if (oldWidget.item.name != widget.item.name) {
      _nameController.text = widget.item.name;
    }
    if (oldWidget.item.description != widget.item.description) {
      _descriptionController.text = widget.item.description;
    }
  }
}
