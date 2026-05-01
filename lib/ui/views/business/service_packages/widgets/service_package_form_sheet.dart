import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:dio/dio.dart' show MultipartFile;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show BlocConsumer, FoodlyThemes, S, ReadContext;
import 'package:foodly_world/core/extensions/padding_extension.dart' show PaddingExtension;
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/service_packages/cubit/service_packages_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart' show File;

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

  /// Hard limit on photos per package. Kept deliberately low — catering
  /// providers benefit most from a handful of representative shots (hero
  /// image + 1-2 context), not a gallery; the visitor card only renders
  /// a lightweight carousel anyway. Synced with the BE validator in
  /// ServicePackagePhotoController (keep in step if that changes).
  static const int _maxPhotos = 3;

  /// Locally-picked photos that haven't been uploaded yet. Flushed on
  /// submit: after the package is created/updated we POST these as a
  /// single multipart upload. Stored as [XFile] so we keep the original
  /// file path + mime type for [MultipartFile.fromFile].
  final List<XFile> _pendingPhotos = [];

  /// Uploading is handled after the save() call completes. We show a
  /// small busy indicator over the photos section so the user doesn't
  /// think the form froze.
  bool _uploadingPhotos = false;

  bool get _isEditing => widget.existingPackage != null;

  @override
  void initState() {
    super.initState();
    final pkg = widget.existingPackage;

    _titleController = TextEditingController(text: pkg?.title ?? '');
    _descriptionController = TextEditingController(text: pkg?.description ?? '');
    _priceController = TextEditingController(text: pkg?.price?.toStringAsFixed(2) ?? '');
    // Default to ISO 4217 code (EUR) — BE validator requires `size:3`, so a
    // symbol like `€` would 422. Users in AR/VE/BR can change to ARS/VES/BRL.
    _currencyController = TextEditingController(text: pkg?.currency ?? 'EUR');
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
      // Close-on-save is handled explicitly inside [_submit] so we can
      // await the photo upload before popping. Listening to `saved` here
      // would fire right after the package row is written — before the
      // multipart upload has a chance to run — and the user would be back
      // at the list with a fresh empty-photo card for a blink.
      listener: (context, state) {
        state.mapOrNull(
          error: (e) => FoodlySnackbars.errorGeneric(context, e.message),
        );
      },
      builder: (context, state) {
        final isSaving = state.vm.isSavingPackage || _uploadingPhotos;

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
                            _buildTitle().paddingVertical(8),
                            _buildTitleField(isSaving),
                            _buildDescriptionField(isSaving),
                            _buildServiceTypeSelector(isSaving),
                            _buildPriceTypeSelector(isSaving),
                            if (_priceType != PriceType.onQuote) _buildPriceRow(isSaving),
                            _buildGuestsRow(isSaving),
                            _buildDurationField(isSaving),
                            _buildIncludesSection(isSaving),
                            _buildPhotosGrid(isSaving),
                            _buildToggles(isSaving),
                            _buildButtons(context, isSaving).paddingTop(32),
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
            // ISO 4217 codes are uppercase (EUR, USD, ARS, VES, BRL). BE
            // validates `size:3` — a lowercase `eur` still passes, but the
            // BE/stripe/mp layers assume uppercase downstream.
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.currency, hint: 'EUR', counterText: ''),
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
            // Chip spacing 8/8 instead of 6/6 — matches the type-selector
            // chips above (`_buildServiceTypeSelector`, `_buildPriceTypeSelector`)
            // and the canonical chip spacing across Foodly. 6 was tight enough
            // that adjacent chips visually merged on dense forms.
            spacing: 8,
            runSpacing: 8,
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
      spacing: 16,
      children: [
        _buildNeumorphicSwitchRow(
          label: S.current.active,
          subtitle: S.current.activePackageHint,
          value: _isActive,
          isSaving: isSaving,
          onChanged: (v) => setState(() => _isActive = v),
        ),
        _buildNeumorphicSwitchRow(
          label: S.current.featured,
          subtitle: S.current.featuredPackageHint,
          value: _isFeatured,
          isSaving: isSaving,
          onChanged: (v) => setState(() => _isFeatured = v),
          // Featured stays visually distinct with the gold thumb — same
          // semantic as the previous SwitchListTile's amber thumb.
          activeThumbColor: Colors.amber,
        ),
      ],
    );
  }

  // ── Neumorphic Switch Row (shared) ────────────────────────────
  //
  // Mirrors the `AllowReservations` widget in
  // `business/widgets/allow_reservations/allow_reservations.dart` so all
  // boolean toggles in the business-management surface share the same look.
  // Do NOT use Material `SwitchListTile` here — it breaks visual consistency
  // with the rest of the Foodly neumorphic UI.

  Widget _buildNeumorphicSwitchRow({
    required String label,
    required bool value,
    required bool isSaving,
    required ValueChanged<bool> onChanged,
    String? subtitle,
    Color? activeThumbColor,
  }) {
    final switchStyle = ui.NeumorphicSwitchStyle(
      activeTrackColor: FoodlyThemes.primaryFoodly.withValues(alpha: .73),
      inactiveTrackColor: Colors.black12,
      activeThumbColor: activeThumbColor ?? FoodlyThemes.success,
      inactiveThumbColor: FoodlyThemes.secondaryFoodly,
      thumbShape: ui.NeumorphicShape.convex,
      lightSource: ui.LightSource.topRight,
    );

    return Row(
      spacing: 16,
      children: [
        ui.NeumorphicSwitch(
          value: value,
          duration: Durations.medium2,
          curve: Curves.decelerate,
          onChanged: isSaving ? null : onChanged,
          height: 32,
          style: switchStyle,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: FoodlyTextStyles.actionsBody),
              if (subtitle != null && subtitle.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(subtitle, style: FoodlyTextStyles.caption),
              ],
            ],
          ),
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

  // ── Photos grid ───────────────────────────────────────────────

  /// Visual count of photos the user currently sees attached to this
  /// package: existing (server-side, already uploaded — only meaningful in
  /// edit mode) + pending (locally picked, not yet uploaded).
  int get _photoCount => (widget.existingPackage?.photos.length ?? 0) + _pendingPhotos.length;

  Widget _buildPhotosGrid(bool isSaving) {
    final existing = widget.existingPackage?.photos ?? const <ServicePackagePhotoDM>[];
    final remaining = _maxPhotos - _photoCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(S.current.photosOptionalMax(_maxPhotos), style: FoodlyTextStyles.labelPurpleBold),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final photo in existing)
              _PhotoTile(
                key: ValueKey('existing_${photo.uuid}'),
                imageUrl: photo.photoPath,
                onRemove: isSaving
                    ? null
                    : () {
                        if (photo.uuid != null) {
                          context.read<ServicePackagesCubit>().deletePhoto(photo.uuid!);
                        }
                      },
              ),
            for (int i = 0; i < _pendingPhotos.length; i++)
              _PhotoTile(
                key: ValueKey('pending_$i'),
                localFile: File(_pendingPhotos[i].path),
                onRemove: isSaving ? null : () => setState(() => _pendingPhotos.removeAt(i)),
              ),
            if (remaining > 0)
              _AddPhotoTile(
                enabled: !isSaving,
                onTap: () => _pickPhotos(remaining),
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickPhotos(int remaining) async {
    if (remaining <= 0) {
      FoodlySnackbars.infoGeneric(context, S.current.photoLimitReached(_maxPhotos));
      return;
    }
    // Gallery-only (no camera) per product decision: chefs upload curated
    // marketing shots, not raw captures. `limit` is honored on supported
    // platforms; we still cap defensively with `.take(remaining)`.
    final picker = ImagePicker();

    // image_picker's `pickMultiImage(limit:)` validator throws
    //   "Invalid argument (limit): cannot be lower than 2: 1"
    // when limit is 1 — it refuses to do "multi" with a max of one. So
    // when only one slot is left (e.g. user already added 2 of _maxPhotos=3),
    // fall back to single-image picking. Same gallery, same XFile output,
    // no crash.
    if (remaining == 1) {
      final picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked == null || !mounted) return;
      setState(() => _pendingPhotos.add(picked));
      return;
    }

    final picked = await picker.pickMultiImage(limit: remaining);
    if (picked.isEmpty || !mounted) return;
    setState(() => _pendingPhotos.addAll(picked.take(remaining)));
  }

  // ── Submit ────────────────────────────────────────────────────

  Future<void> _submit(BuildContext context) async {
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
      // Normalize to uppercase ISO 4217 (EUR/USD/ARS/VES/BRL). BE validates
      // `size:3` — forgetting this is how `€` slipped through before.
      data['currency'] = _currencyController.text.trim().toUpperCase();
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

    // Convert the locally-picked XFiles into dio MultipartFiles. We do
    // this lazily on submit (not during picking) so we don't hold open
    // file handles while the user is still editing the form.
    final photos = <MultipartFile>[
      for (final xf in _pendingPhotos) await MultipartFile.fromFile(xf.path, filename: xf.name),
    ];

    bool ok;
    if (_isEditing) {
      final updated = await cubit.updatePackage(widget.existingPackage!.uuid!, data);
      if (updated == null) {
        ok = false;
      } else if (photos.isEmpty) {
        ok = true;
      } else {
        setState(() => _uploadingPhotos = true);
        ok = await cubit.uploadPhotos(widget.existingPackage!.uuid!, photos);
        if (mounted) setState(() => _uploadingPhotos = false);
      }
    } else {
      // create + upload as a single logical operation. The cubit spinner
      // covers the create step; we flip our local flag for the upload
      // step so the form's save button stays disabled end-to-end.
      if (photos.isNotEmpty) setState(() => _uploadingPhotos = true);
      ok = await cubit.createPackageWithPhotos(data, photos);
      if (mounted) setState(() => _uploadingPhotos = false);
    }

    if (!context.mounted) return;
    if (ok) {
      Navigator.of(context).pop();
    } else if (photos.isNotEmpty) {
      // The package row likely landed but one or more uploads failed —
      // tell the user to retry from edit mode. errorGeneric is already
      // wired up in the BlocConsumer listener for plain save failures.
      FoodlySnackbars.infoGeneric(context, S.current.photoUploadFailed);
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

// ── Photo Tile ────────────────────────────────────────────────
//
// 80×80 thumbnail with a small close button in the corner. Dimensions and
// corner radius mirror [MenuItemPictureWdg] in `manage_menu` so the photo
// picker on a service package looks visually identical to the food/drink
// item picture in the menu editor — same Foodly visual language across
// both manager surfaces. Used for both already-uploaded photos
// (pass `imageUrl`) and locally-picked pending photos (pass `localFile`).
// Exactly one of the two must be set.

class _PhotoTile extends StatelessWidget {
  final String? imageUrl;
  final File? localFile;
  final VoidCallback? onRemove;

  const _PhotoTile({
    super.key,
    this.imageUrl,
    this.localFile,
    this.onRemove,
  }) : assert((imageUrl != null) ^ (localFile != null),
            'Provide exactly one of imageUrl (existing) or localFile (pending)');

  @override
  Widget build(BuildContext context) {
    final imageProvider = localFile != null ? FileImage(localFile!) as ImageProvider : NetworkImage(imageUrl!);

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.black12,
                  child: const Icon(Bootstrap.image, size: 24, color: Colors.black26),
                ),
              ),
            ),
          ),
          if (onRemove != null)
            Positioned(
              top: -6,
              right: -6,
              child: Material(
                color: Colors.white,
                shape: const CircleBorder(),
                elevation: 2,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onRemove,
                  child: Tooltip(
                    message: S.current.removePhoto,
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Icon(Bootstrap.x, size: 16, color: FoodlyThemes.error),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Add Photo Tile ────────────────────────────────────────────
//
// The empty slot that opens the gallery picker. Visually aligned with
// [MenuItemPictureWdg] in `manage_menu`: 80×80 container, BorderRadius 8,
// faint primary tint (alpha 0.036 in edit mode, same value the menu uses),
// and a single neumorphic [Icons.add_photo_alternate_outlined] glyph in
// [FoodlyThemes.accentColor]. The previous "+" + "Agregar foto" combo
// with a dashed purple border was a one-off; replacing it brings the
// catering & chefs photo picker in line with the rest of the manager UI.

class _AddPhotoTile extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;

  const _AddPhotoTile({required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 80,
        height: 80,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: FoodlyThemes.primaryFoodly.withValues(alpha: enabled ? 0.036 : 0.02),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: ui.NeumorphicIcon(
            Icons.add_photo_alternate_outlined,
            style: ui.NeumorphicStyle(
              shape: ui.NeumorphicShape.concave,
              color: enabled ? FoodlyThemes.accentColor : Colors.black26,
              depth: 2,
            ),
            size: 48,
          ),
        ),
      ),
    );
  }
}
