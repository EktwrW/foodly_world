import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show BlocConsumer, FoodlyThemes, S, ReadContext;
import 'package:foodly_world/core/extensions/padding_extension.dart' show PaddingExtension;
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/service_packages/cubit/service_packages_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class ServicePackageFormSheet extends StatefulWidget {
  final ServicePackageDM? existingPackage;

  const ServicePackageFormSheet({super.key, this.existingPackage});

  @override
  State<ServicePackageFormSheet> createState() => _ServicePackageFormSheetState();
}

class _ServicePackageFormSheetState extends State<ServicePackageFormSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _currencyController;
  late final TextEditingController _minGuestsController;
  late final TextEditingController _maxGuestsController;
  late final TextEditingController _durationController;
  late final TextEditingController _includeItemController;

  late ServiceType _serviceType;
  late PriceType _priceType;
  late bool _isFeatured;
  late bool _isActive;
  late List<String> _includes;
  late List<String> _addOns;

  bool get _isEditing => widget.existingPackage != null;

  @override
  void initState() {
    super.initState();
    final pkg = widget.existingPackage;

    _titleController = TextEditingController(text: pkg?.title ?? '');
    _descriptionController = TextEditingController(text: pkg?.description ?? '');
    _priceController = TextEditingController(text: pkg?.price?.toStringAsFixed(2) ?? '');
    _currencyController = TextEditingController(text: pkg?.currency ?? '€');
    _minGuestsController = TextEditingController(text: pkg?.minGuests?.toString() ?? '');
    _maxGuestsController = TextEditingController(text: pkg?.maxGuests?.toString() ?? '');
    _durationController = TextEditingController(text: pkg?.durationHours?.toString() ?? '');
    _includeItemController = TextEditingController();

    _serviceType = pkg?.serviceType ?? ServiceType.custom;
    _priceType = pkg?.priceType ?? PriceType.onQuote;
    _isFeatured = pkg?.isFeatured ?? false;
    _isActive = pkg?.isActive ?? true;
    _includes = List<String>.from(pkg?.includes ?? []);
    _addOns = List<String>.from(pkg?.addOns ?? []);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _currencyController.dispose();
    _minGuestsController.dispose();
    _maxGuestsController.dispose();
    _durationController.dispose();
    _includeItemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicePackagesCubit, ServicePackagesState>(
      listener: (context, state) {
        state.mapOrNull(
          saved: (_) => Navigator.of(context).pop(),
        );
      },
      builder: (context, state) {
        final isSaving = state.vm.isSavingPackage;

        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
            decoration: const BoxDecoration(
              color: ui.NeumorphicColors.background,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHandle(),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 86),
                    child: FadeIn(
                      duration: const Duration(milliseconds: 300),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 16,
                          children: [
                            _buildTitle(),
                            _buildTitleField(isSaving),
                            _buildDescriptionField(isSaving),
                            _buildServiceTypeSelector(isSaving),
                            _buildPriceTypeSelector(isSaving),
                            if (_priceType != PriceType.onQuote) _buildPriceRow(isSaving),
                            _buildGuestsRow(isSaving),
                            _buildDurationField(isSaving),
                            _buildIncludesSection(isSaving),
                            _buildToggles(isSaving),
                            _buildButtons(context, isSaving).paddingTop(30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── Handle ────────────────────────────────────────────────────

  Widget _buildHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 4),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  // ── Title ─────────────────────────────────────────────────────

  Widget _buildTitle() {
    return Row(
      children: [
        Icon(
          _isEditing ? Bootstrap.pencil_square : Bootstrap.plus_circle,
          size: 22,
          color: FoodlyThemes.primaryFoodly,
        ),
        const SizedBox(width: 10),
        Text(
          _isEditing ? S.current.editPackage : S.current.createPackage,
          style: FoodlyTextStyles.menuTitle,
        ),
      ],
    );
  }

  // ── Text Fields ───────────────────────────────────────────────

  Widget _buildTitleField(bool isSaving) {
    return TextFormField(
      controller: _titleController,
      enabled: !isSaving,
      maxLength: 120,
      textInputAction: TextInputAction.next,
      style: FoodlyTextStyles.inputTextValue,
      decoration: _inputDecoration(
        label: S.current.title,
        hint: S.current.packageTitleHint,
        counterText: '',
      ),
      validator: (v) => (v == null || v.trim().isEmpty) ? S.current.fieldRequired : null,
    );
  }

  Widget _buildDescriptionField(bool isSaving) {
    return TextFormField(
      controller: _descriptionController,
      enabled: !isSaving,
      maxLength: 500,
      maxLines: 4,
      minLines: 2,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      style: FoodlyTextStyles.inputTextValue,
      decoration: _inputDecoration(
        label: S.current.descriptionLabel,
        hint: S.current.packageDescriptionHint,
        counterText: '',
      ),
    );
  }

  // ── Service Type ──────────────────────────────────────────────

  Widget _buildServiceTypeSelector(bool isSaving) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(S.current.serviceType, style: FoodlyTextStyles.labelPurpleBold),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ServiceType.values.map((type) {
            final selected = _serviceType == type;
            return GestureDetector(
              onTap: isSaving ? null : () => setState(() => _serviceType = type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: selected ? FoodlyThemes.primaryFoodly : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selected ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Text(
                  _serviceTypeLabel(type),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : FoodlyThemes.primaryFoodly,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ── Price Type ────────────────────────────────────────────────

  Widget _buildPriceTypeSelector(bool isSaving) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(S.current.priceType, style: FoodlyTextStyles.labelPurpleBold),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: PriceType.values.map((type) {
            final selected = _priceType == type;
            return GestureDetector(
              onTap: isSaving ? null : () => setState(() => _priceType = type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: selected ? FoodlyThemes.primaryFoodly : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selected ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Text(
                  _priceTypeLabel(type),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : FoodlyThemes.primaryFoodly,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ── Price Row ─────────────────────────────────────────────────

  Widget _buildPriceRow(bool isSaving) {
    return Row(
      spacing: 12,
      children: [
        SizedBox(
          width: 70,
          child: TextFormField(
            controller: _currencyController,
            enabled: !isSaving,
            maxLength: 3,
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.currency, hint: '€', counterText: ''),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _priceController,
            enabled: !isSaving,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.price, hint: '0.00'),
            validator: (v) {
              if (_priceType == PriceType.onQuote) return null;
              if (v == null || v.trim().isEmpty) return S.current.fieldRequired;
              final parsed = double.tryParse(v);
              if (parsed == null || parsed <= 0) return S.current.invalidValue;
              return null;
            },
          ),
        ),
      ],
    );
  }

  // ── Guests Row ────────────────────────────────────────────────

  Widget _buildGuestsRow(bool isSaving) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: TextFormField(
            controller: _minGuestsController,
            enabled: !isSaving,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.minGuests, hint: '10'),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _maxGuestsController,
            enabled: !isSaving,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.maxGuests, hint: '100'),
          ),
        ),
      ],
    );
  }

  // ── Duration ──────────────────────────────────────────────────

  Widget _buildDurationField(bool isSaving) {
    return TextFormField(
      controller: _durationController,
      enabled: !isSaving,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.next,
      style: FoodlyTextStyles.inputTextValue,
      decoration: _inputDecoration(
        label: S.current.durationHours,
        hint: '3.0',
        suffixText: 'h',
      ),
    );
  }

  // ── Includes Section ──────────────────────────────────────────

  Widget _buildIncludesSection(bool isSaving) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(S.current.includes, style: FoodlyTextStyles.labelPurpleBold),
        if (_includes.isNotEmpty)
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: _includes.asMap().entries.map((entry) {
              return Chip(
                label: Text(entry.value, style: const TextStyle(fontSize: 12)),
                deleteIcon: const Icon(Bootstrap.x, size: 14),
                onDeleted: isSaving ? null : () => setState(() => _includes.removeAt(entry.key)),
                backgroundColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              );
            }).toList(),
          ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: TextFormField(
                controller: _includeItemController,
                enabled: !isSaving,
                maxLength: 80,
                textInputAction: TextInputAction.done,
                style: FoodlyTextStyles.inputTextValue,
                decoration: _inputDecoration(
                  label: S.current.addItem,
                  hint: S.current.includeItemHint,
                  counterText: '',
                ),
                onFieldSubmitted: (_) => _addIncludeItem(),
              ),
            ),
            IconButton(
              onPressed: isSaving ? null : _addIncludeItem,
              icon: const Icon(Bootstrap.plus_circle, color: FoodlyThemes.primaryFoodly),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),
      ],
    );
  }

  void _addIncludeItem() {
    final text = _includeItemController.text.trim();
    if (text.isNotEmpty && !_includes.contains(text)) {
      setState(() {
        _includes.add(text);
        _includeItemController.clear();
      });
    }
  }

  // ── Toggles ───────────────────────────────────────────────────

  Widget _buildToggles(bool isSaving) {
    return Column(
      children: [
        SwitchListTile(
          title: Text(S.current.active, style: FoodlyTextStyles.actionsBody),
          subtitle: Text(S.current.activePackageHint, style: FoodlyTextStyles.caption),
          value: _isActive,
          onChanged: isSaving ? null : (v) => setState(() => _isActive = v),
          activeThumbColor: FoodlyThemes.tertiaryFoodly,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        SwitchListTile(
          title: Text(S.current.featured, style: FoodlyTextStyles.actionsBody),
          subtitle: Text(S.current.featuredPackageHint, style: FoodlyTextStyles.caption),
          value: _isFeatured,
          onChanged: isSaving ? null : (v) => setState(() => _isFeatured = v),
          activeThumbColor: Colors.amber,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
      ],
    );
  }

  // ── Buttons ───────────────────────────────────────────────────

  Widget _buildButtons(BuildContext context, bool isSaving) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: CustomNeumorphicButton(
            onPressed: isSaving ? null : () => Navigator.of(context).pop(),
            type: CustomNeumorphicBtnType.outlined,
            text: S.current.cancel,
            disabled: isSaving,
            padding: const EdgeInsets.all(9),
          ),
        ),
        Expanded(
          child: CustomNeumorphicButton(
            onPressed: isSaving ? null : () => _submit(context),
            text: S.current.save,
            disabled: isSaving,
            padding: const EdgeInsets.all(9),
          ),
        ),
      ],
    );
  }

  // ── Submit ────────────────────────────────────────────────────

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final data = <String, dynamic>{
      'title': _titleController.text.trim(),
      'description': _descriptionController.text.trim(),
      'service_type': _serviceType.name == 'cookingClassPrivate' ? 'cooking_class_private' : _serviceType.name,
      'price_type': _priceTypeToString(_priceType),
      'is_featured': _isFeatured,
      'is_active': _isActive,
      'includes': _includes,
      'add_ons': _addOns,
    };

    if (_priceType != PriceType.onQuote && _priceController.text.isNotEmpty) {
      data['price'] = double.tryParse(_priceController.text.trim());
      data['currency'] = _currencyController.text.trim();
    }
    if (_minGuestsController.text.isNotEmpty) {
      data['min_guests'] = int.tryParse(_minGuestsController.text.trim());
    }
    if (_maxGuestsController.text.isNotEmpty) {
      data['max_guests'] = int.tryParse(_maxGuestsController.text.trim());
    }
    if (_durationController.text.isNotEmpty) {
      data['duration_hours'] = double.tryParse(_durationController.text.trim());
    }

    final cubit = context.read<ServicePackagesCubit>();

    if (_isEditing) {
      cubit.updatePackage(widget.existingPackage!.uuid!, data);
    } else {
      cubit.createPackage(data);
    }
  }

  // ── Helpers ───────────────────────────────────────────────────

  String _serviceTypeLabel(ServiceType type) {
    return switch (type) {
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

  String _priceTypeLabel(PriceType type) {
    return switch (type) {
      PriceType.fixed => S.current.fixed,
      PriceType.perPerson => S.current.perPerson,
      PriceType.perHour => S.current.perHour,
      PriceType.onQuote => S.current.onQuote,
    };
  }

  String _priceTypeToString(PriceType type) {
    return switch (type) {
      PriceType.fixed => 'fixed',
      PriceType.perPerson => 'per_person',
      PriceType.perHour => 'per_hour',
      PriceType.onQuote => 'on_quote',
    };
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    String? counterText,
    String? suffixText,
  }) {
    const borderRadius = BorderRadius.all(Radius.circular(8));

    return InputDecoration(
      labelText: label,
      hintText: hint,
      counterText: counterText,
      suffixText: suffixText,
      hintStyle: FoodlyTextStyles.hintText,
      labelStyle: FoodlyTextStyles.labelPurpleBold,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      enabledBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.secondaryFoodly),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.primaryFoodly, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.error),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.error, width: 1.5),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: Colors.black12),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
