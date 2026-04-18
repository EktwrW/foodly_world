import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show BlocConsumer, FoodlyThemes, PaddingExtension, ReadContext, S;
import 'package:foodly_world/data_models/service_packages/professional_profile_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/service_packages/cubit/service_packages_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class ProfessionalProfileFormSheet extends StatefulWidget {
  const ProfessionalProfileFormSheet({super.key});

  @override
  State<ProfessionalProfileFormSheet> createState() => _ProfessionalProfileFormSheetState();
}

class _ProfessionalProfileFormSheetState extends State<ProfessionalProfileFormSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _yearsExpController;
  late final TextEditingController _serviceRadiusController;
  late final TextEditingController _travelFeeController;
  late final TextEditingController _minBookingController;
  late final TextEditingController _minBookingCurrencyController;
  late final TextEditingController _depositPercentageController;
  late final TextEditingController _cancellationTextController;
  late final TextEditingController _portfolioUrlController;
  late final TextEditingController _tagInputController;

  late TeamSize? _teamSize;
  late CancellationPolicy? _cancellationPolicy;
  late bool _depositRequired;
  late bool _hasInsurance;
  late List<String> _specialties;
  late List<String> _cuisines;
  late List<String> _certifications;
  late List<String> _languagesSpoken;

  // Which tag list is currently being edited
  _TagSection _activeTagSection = _TagSection.specialties;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ServicePackagesCubit>().state.vm.profile;

    _yearsExpController = TextEditingController(text: profile?.yearsExperience?.toString() ?? '');
    _serviceRadiusController = TextEditingController(text: profile?.serviceRadiusKm?.toString() ?? '');
    _travelFeeController = TextEditingController(text: profile?.travelFeePerKm?.toString() ?? '');
    _minBookingController = TextEditingController(text: profile?.minBookingAmount?.toString() ?? '');
    _minBookingCurrencyController = TextEditingController(text: profile?.minBookingCurrency ?? '€');
    _depositPercentageController = TextEditingController(text: profile?.depositPercentage?.toString() ?? '');
    _cancellationTextController = TextEditingController(text: profile?.cancellationPolicyText ?? '');
    _portfolioUrlController = TextEditingController(text: profile?.portfolioVideoUrl ?? '');
    _tagInputController = TextEditingController();

    _teamSize = profile?.teamSize;
    _cancellationPolicy = profile?.cancellationPolicy;
    _depositRequired = profile?.depositRequired ?? false;
    _hasInsurance = profile?.hasInsurance ?? false;
    _specialties = List<String>.from(profile?.specialties ?? []);
    _cuisines = List<String>.from(profile?.cuisines ?? []);
    _certifications = List<String>.from(profile?.certifications ?? []);
    _languagesSpoken = List<String>.from(profile?.languagesSpoken ?? []);
  }

  @override
  void dispose() {
    _yearsExpController.dispose();
    _serviceRadiusController.dispose();
    _travelFeeController.dispose();
    _minBookingController.dispose();
    _minBookingCurrencyController.dispose();
    _depositPercentageController.dispose();
    _cancellationTextController.dispose();
    _portfolioUrlController.dispose();
    _tagInputController.dispose();
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
        final isSaving = state.vm.isSavingProfile;

        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.92),
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

                            // ── Tags: specialties, cuisines, certifications, languages ──
                            _buildTagSectionSelector(isSaving),
                            _buildTagInput(isSaving),
                            _buildTagChips(),

                            // ── Experience & Team ──
                            _buildExperienceRow(isSaving),

                            // ── Service Area ──
                            _buildSectionLabel(S.current.serviceArea, Bootstrap.geo_alt),
                            _buildServiceAreaRow(isSaving),

                            // ── Booking & Pricing ──
                            _buildSectionLabel(S.current.bookingPricing, Bootstrap.cash_stack),
                            _buildMinBookingRow(isSaving),
                            _buildDepositSection(isSaving),
                            _buildCancellationSection(isSaving),

                            // ── Additional Info ──
                            _buildInsuranceToggle(isSaving),
                            _buildPortfolioField(isSaving),

                            // ── Buttons ──
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
        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2)),
      ),
    );
  }

  // ── Title ─────────────────────────────────────────────────────

  Widget _buildTitle() {
    return Row(
      children: [
        const Icon(Bootstrap.person_badge, size: 22, color: FoodlyThemes.primaryFoodly),
        const SizedBox(width: 10),
        Text(S.current.professionalProfile, style: FoodlyTextStyles.menuTitle),
      ],
    );
  }

  // ── Section Label ─────────────────────────────────────────────

  Widget _buildSectionLabel(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        spacing: 8,
        children: [
          Icon(icon, size: 16, color: FoodlyThemes.primaryFoodly),
          Text(text, style: FoodlyTextStyles.labelPurpleBold),
        ],
      ),
    );
  }

  // ── Tag Sections ──────────────────────────────────────────────

  Widget _buildTagSectionSelector(bool isSaving) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _TagSection.values.map((section) {
        final selected = _activeTagSection == section;
        return GestureDetector(
          onTap: isSaving ? null : () => setState(() => _activeTagSection = section),
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text(
                  _tagSectionLabel(section),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.white : FoodlyThemes.primaryFoodly,
                  ),
                ),
                Text(
                  '(${_getTagList(section).length})',
                  style: TextStyle(
                    fontSize: 10,
                    color: selected ? Colors.white70 : FoodlyThemes.secondaryFoodly,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTagInput(bool isSaving) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: TextFormField(
            controller: _tagInputController,
            enabled: !isSaving,
            maxLength: 50,
            textInputAction: TextInputAction.done,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(
              label: _tagSectionHint(_activeTagSection),
              hint: _tagSectionPlaceholder(_activeTagSection),
              counterText: '',
            ),
            onFieldSubmitted: (_) => _addTag(),
          ),
        ),
        IconButton(
          onPressed: isSaving ? null : _addTag,
          icon: const Icon(Bootstrap.plus_circle, color: FoodlyThemes.primaryFoodly),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }

  Widget _buildTagChips() {
    final tags = _getTagList(_activeTagSection);
    if (tags.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: tags.asMap().entries.map((entry) {
        return Chip(
          label: Text(entry.value, style: const TextStyle(fontSize: 12)),
          deleteIcon: const Icon(Bootstrap.x, size: 14),
          onDeleted: () => setState(() => _getTagList(_activeTagSection).removeAt(entry.key)),
          backgroundColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        );
      }).toList(),
    );
  }

  void _addTag() {
    final text = _tagInputController.text.trim();
    final list = _getTagList(_activeTagSection);
    if (text.isNotEmpty && !list.contains(text)) {
      setState(() {
        list.add(text);
        _tagInputController.clear();
      });
    }
  }

  List<String> _getTagList(_TagSection section) {
    return switch (section) {
      _TagSection.specialties => _specialties,
      _TagSection.cuisines => _cuisines,
      _TagSection.certifications => _certifications,
      _TagSection.languages => _languagesSpoken,
    };
  }

  // ── Experience Row ────────────────────────────────────────────

  Widget _buildExperienceRow(bool isSaving) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: TextFormField(
            controller: _yearsExpController,
            enabled: !isSaving,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.yearsExperience, hint: '5'),
          ),
        ),
        Expanded(
          child: DropdownButtonFormField<TeamSize>(
            initialValue: _teamSize,
            isExpanded: true,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.teamSize, hint: ''),
            items: TeamSize.values.map((ts) {
              return DropdownMenuItem(value: ts, child: Text(_teamSizeLabel(ts), style: const TextStyle(fontSize: 13)));
            }).toList(),
            onChanged: isSaving ? null : (v) => setState(() => _teamSize = v),
          ),
        ),
      ],
    );
  }

  // ── Service Area ──────────────────────────────────────────────

  Widget _buildServiceAreaRow(bool isSaving) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: TextFormField(
            controller: _serviceRadiusController,
            enabled: !isSaving,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.radiusKm, hint: '50', suffixText: 'km'),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _travelFeeController,
            enabled: !isSaving,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.travelFeeKm, hint: '1.50', suffixText: '€/km'),
          ),
        ),
      ],
    );
  }

  // ── Minimum Booking ───────────────────────────────────────────

  Widget _buildMinBookingRow(bool isSaving) {
    return Row(
      spacing: 12,
      children: [
        SizedBox(
          width: 70,
          child: TextFormField(
            controller: _minBookingCurrencyController,
            enabled: !isSaving,
            maxLength: 3,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.currency, hint: '€', counterText: ''),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _minBookingController,
            enabled: !isSaving,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.minBookingAmount, hint: '500'),
          ),
        ),
      ],
    );
  }

  // ── Deposit ───────────────────────────────────────────────────

  Widget _buildDepositSection(bool isSaving) {
    return Column(
      children: [
        SwitchListTile(
          title: Text(S.current.depositRequired, style: FoodlyTextStyles.actionsBody),
          value: _depositRequired,
          onChanged: isSaving ? null : (v) => setState(() => _depositRequired = v),
          activeThumbColor: FoodlyThemes.tertiaryFoodly,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
        if (_depositRequired)
          TextFormField(
            controller: _depositPercentageController,
            enabled: !isSaving,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: FoodlyTextStyles.inputTextValue,
            decoration: _inputDecoration(label: S.current.depositPercentage, hint: '30', suffixText: '%'),
            validator: (v) {
              if (!_depositRequired) return null;
              if (v == null || v.trim().isEmpty) return S.current.fieldRequired;
              final p = double.tryParse(v);
              if (p == null || p <= 0 || p > 100) return S.current.invalidValue;
              return null;
            },
          ),
      ],
    );
  }

  // ── Cancellation ──────────────────────────────────────────────

  Widget _buildCancellationSection(bool isSaving) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        DropdownButtonFormField<CancellationPolicy>(
          initialValue: _cancellationPolicy,
          isExpanded: true,
          style: FoodlyTextStyles.inputTextValue,
          decoration: _inputDecoration(label: S.current.cancellationPolicy, hint: ''),
          items: CancellationPolicy.values.map((cp) {
            return DropdownMenuItem(
              value: cp,
              child: Text(_cancellationLabel(cp), style: const TextStyle(fontSize: 13)),
            );
          }).toList(),
          onChanged: isSaving ? null : (v) => setState(() => _cancellationPolicy = v),
        ),
        TextFormField(
          controller: _cancellationTextController,
          enabled: !isSaving,
          maxLength: 300,
          maxLines: 3,
          minLines: 1,
          keyboardType: TextInputType.multiline,
          style: FoodlyTextStyles.inputTextValue,
          decoration: _inputDecoration(
            label: S.current.cancellationDetails,
            hint: S.current.cancellationDetailsHint,
            counterText: '',
          ),
        ),
      ],
    );
  }

  // ── Insurance ─────────────────────────────────────────────────

  Widget _buildInsuranceToggle(bool isSaving) {
    return SwitchListTile(
      title: Text(S.current.hasInsurance, style: FoodlyTextStyles.actionsBody),
      subtitle: Text(S.current.insuranceHint, style: FoodlyTextStyles.caption),
      value: _hasInsurance,
      onChanged: isSaving ? null : (v) => setState(() => _hasInsurance = v),
      activeThumbColor: FoodlyThemes.tertiaryFoodly,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }

  // ── Portfolio ─────────────────────────────────────────────────

  Widget _buildPortfolioField(bool isSaving) {
    return TextFormField(
      controller: _portfolioUrlController,
      enabled: !isSaving,
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      style: FoodlyTextStyles.inputTextValue,
      decoration: _inputDecoration(
        label: S.current.portfolioVideoUrl,
        hint: 'https://youtube.com/...',
      ),
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
      'specialties': _specialties,
      'cuisines': _cuisines,
      'certifications': _certifications,
      'languages_spoken': _languagesSpoken,
      'cancellation_policy_text': _cancellationTextController.text.trim(),
      'has_insurance': _hasInsurance,
      'deposit_required': _depositRequired,
      'portfolio_video_url': _portfolioUrlController.text.trim(),
    };

    if (_yearsExpController.text.isNotEmpty) {
      data['years_experience'] = int.tryParse(_yearsExpController.text.trim());
    }
    if (_teamSize != null) {
      data['team_size'] = _teamSizeToString(_teamSize!);
    }
    if (_serviceRadiusController.text.isNotEmpty) {
      data['service_radius_km'] = double.tryParse(_serviceRadiusController.text.trim());
    }
    if (_travelFeeController.text.isNotEmpty) {
      data['travel_fee_per_km'] = double.tryParse(_travelFeeController.text.trim());
    }
    if (_minBookingController.text.isNotEmpty) {
      data['min_booking_amount'] = double.tryParse(_minBookingController.text.trim());
      data['min_booking_currency'] = _minBookingCurrencyController.text.trim();
    }
    if (_depositRequired && _depositPercentageController.text.isNotEmpty) {
      data['deposit_percentage'] = double.tryParse(_depositPercentageController.text.trim());
    }
    if (_cancellationPolicy != null) {
      data['cancellation_policy'] = _cancellationPolicy!.name;
    }

    context.read<ServicePackagesCubit>().saveProfile(data);
  }

  // ── Helpers ───────────────────────────────────────────────────

  String _teamSizeLabel(TeamSize ts) {
    return switch (ts) {
      TeamSize.solo => S.current.solo,
      TeamSize.small2to4 => '2–4',
      TeamSize.medium5to10 => '5–10',
      TeamSize.large11Plus => '11+',
    };
  }

  String _teamSizeToString(TeamSize ts) {
    return switch (ts) {
      TeamSize.solo => 'solo',
      TeamSize.small2to4 => 'small_2_4',
      TeamSize.medium5to10 => 'medium_5_10',
      TeamSize.large11Plus => 'large_11_plus',
    };
  }

  String _cancellationLabel(CancellationPolicy cp) {
    return switch (cp) {
      CancellationPolicy.flexible => S.current.flexible,
      CancellationPolicy.moderate => S.current.moderate,
      CancellationPolicy.strict => S.current.strict,
    };
  }

  String _tagSectionLabel(_TagSection section) {
    return switch (section) {
      _TagSection.specialties => S.current.specialties,
      _TagSection.cuisines => S.current.cuisines,
      _TagSection.certifications => S.current.certifications,
      _TagSection.languages => S.current.languages,
    };
  }

  String _tagSectionHint(_TagSection section) {
    return switch (section) {
      _TagSection.specialties => S.current.addSpecialty,
      _TagSection.cuisines => S.current.addCuisine,
      _TagSection.certifications => S.current.addCertification,
      _TagSection.languages => S.current.addLanguage,
    };
  }

  String _tagSectionPlaceholder(_TagSection section) {
    return switch (section) {
      _TagSection.specialties => S.current.specialtyExample,
      _TagSection.cuisines => S.current.cuisineExample,
      _TagSection.certifications => S.current.certificationExample,
      _TagSection.languages => S.current.languageExample,
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

// ── Tag Section Enum ────────────────────────────────────────────

enum _TagSection {
  specialties,
  cuisines,
  certifications,
  languages,
}
