import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:intl/intl.dart';

void showServiceBookingRequestSheet(
  BuildContext context, {
  required String businessUuid,
  required ServicePackageDM package,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ServiceBookingRequestSheet(
      businessUuid: businessUuid,
      package: package,
    ),
  );
}

class _ServiceBookingRequestSheet extends StatefulWidget {
  final String businessUuid;
  final ServicePackageDM package;

  const _ServiceBookingRequestSheet({
    required this.businessUuid,
    required this.package,
  });

  @override
  State<_ServiceBookingRequestSheet> createState() => _ServiceBookingRequestSheetState();
}

class _ServiceBookingRequestSheetState extends State<_ServiceBookingRequestSheet> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _dietaryController = TextEditingController();
  final _budgetController = TextEditingController();
  final _notesController = TextEditingController();
  final _guestCountController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  EventType? _eventType;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    if (widget.package.minGuests != null) {
      _guestCountController.text = widget.package.minGuests.toString();
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _dietaryController.dispose();
    _budgetController.dispose();
    _notesController.dispose();
    _guestCountController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 19, minute: 0),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  String _eventTypeToString(EventType type) {
    return switch (type) {
      EventType.dinner => 'dinner',
      EventType.wedding => 'wedding',
      EventType.corporate => 'corporate',
      EventType.birthday => 'birthday',
      EventType.brunch => 'brunch',
      EventType.cocktail => 'cocktail',
      EventType.custom => 'custom',
    };
  }

  String _eventTypeLabel(EventType type) {
    return switch (type) {
      EventType.dinner => S.current.eventTypeDinner,
      EventType.wedding => S.current.eventTypeWedding,
      EventType.corporate => S.current.eventTypeCorporate,
      EventType.birthday => S.current.eventTypeBirthday,
      EventType.brunch => S.current.eventTypeBrunch,
      EventType.cocktail => S.current.eventTypeCocktail,
      EventType.custom => S.current.eventTypeCustom,
    };
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null) {
      FoodlySnackbars.errorGeneric(context, S.current.selectDate);
      return;
    }

    setState(() => _isSending = true);

    final repo = di<ReservationRepo>();
    final result = await repo.createServiceBooking(
      businessUuid: widget.businessUuid,
      servicePackageUuid: widget.package.uuid!,
      reservationDate: DateFormat('yyyy-MM-dd').format(_selectedDate!),
      reservationTime: _selectedTime != null
          ? '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
          : null,
      eventAddress: _addressController.text.isNotEmpty ? _addressController.text : null,
      eventCity: _cityController.text.isNotEmpty ? _cityController.text : null,
      eventType: _eventType != null ? _eventTypeToString(_eventType!) : null,
      guestCount: int.parse(_guestCountController.text),
      dietaryNotes: _dietaryController.text.isNotEmpty ? _dietaryController.text : null,
      budgetEstimate: _budgetController.text.isNotEmpty ? double.tryParse(_budgetController.text) : null,
      specialRequests: _notesController.text.isNotEmpty ? _notesController.text : null,
    );

    if (!mounted) return;

    result.when(
      success: (response) {
        Navigator.of(context).pop();
        FoodlySnackbars.successGeneric(context, response.message);
      },
      failure: (error) {
        setState(() => _isSending = false);
        FoodlySnackbars.errorGeneric(context, error.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        _buildPackageInfo(),
                        _buildDateTimeRow(),
                        _buildGuestCountField(),
                        _buildEventTypeSelector(),
                        _buildAddressFields(),
                        _buildDietaryField(),
                        _buildBudgetField(),
                        _buildNotesField(),
                        _buildButtons(),
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
  }

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

  Widget _buildTitle() {
    return Row(
      children: [
        const Icon(Bootstrap.calendar2_plus, size: 22, color: FoodlyThemes.primaryFoodly),
        const SizedBox(width: 10),
        Text(S.current.requestService, style: FoodlyTextStyles.menuTitle),
      ],
    );
  }

  Widget _buildPackageInfo() {
    final pkg = widget.package;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pkg.title, style: FoodlyTextStyles.actionsBodyBold),
          if (pkg.hasPrice) ...[
            const SizedBox(height: 4),
            Text(
              '${pkg.currency ?? '€'}${pkg.price!.toStringAsFixed(2)} · ${pkg.priceType.name}',
              style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
            ),
          ] else if (pkg.isOnQuote) ...[
            const SizedBox(height: 4),
            Text(
              S.current.requestQuote,
              style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
            ),
          ],
          if (pkg.hasGuestRange) ...[
            const SizedBox(height: 4),
            Text(
              pkg.guestRangeText,
              style: FoodlyTextStyles.caption,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDateTimeRow() {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: _isSending ? null : _selectDate,
            child: InputDecorator(
              decoration: _inputDecoration(S.current.date, prefixIcon: Bootstrap.calendar_event),
              child: Text(
                _selectedDate != null ? DateFormat.yMMMd().format(_selectedDate!) : S.current.selectDate,
                style: _selectedDate != null ? FoodlyTextStyles.inputTextValue : FoodlyTextStyles.hintText,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: _isSending ? null : _selectTime,
            child: InputDecorator(
              decoration: _inputDecoration(S.current.time, prefixIcon: Bootstrap.clock),
              child: Text(
                _selectedTime != null ? _selectedTime!.format(context) : S.current.optional,
                style: _selectedTime != null ? FoodlyTextStyles.inputTextValue : FoodlyTextStyles.hintText,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGuestCountField() {
    return TextFormField(
      controller: _guestCountController,
      enabled: !_isSending,
      decoration: _inputDecoration(S.current.guestCount, prefixIcon: Bootstrap.people_fill),
      keyboardType: TextInputType.number,
      validator: (v) {
        if (v == null || v.isEmpty) return S.current.fieldRequired;
        final n = int.tryParse(v);
        if (n == null || n < 1) return S.current.invalidValue;
        if (widget.package.minGuests != null && n < widget.package.minGuests!) {
          return '${S.current.minimum}: ${widget.package.minGuests}';
        }
        if (widget.package.maxGuests != null && n > widget.package.maxGuests!) {
          return '${S.current.maximum}: ${widget.package.maxGuests}';
        }
        return null;
      },
    );
  }

  Widget _buildEventTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.current.eventType, style: FoodlyTextStyles.caption),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: EventType.values.map((type) {
            final isSelected = _eventType == type;
            return ChoiceChip(
              label: Text(_eventTypeLabel(type)),
              selected: isSelected,
              selectedColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.2),
              onSelected: _isSending
                  ? null
                  : (selected) {
                      setState(() => _eventType = selected ? type : null);
                    },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAddressFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(S.current.eventLocation, style: FoodlyTextStyles.caption),
        TextFormField(
          controller: _addressController,
          enabled: !_isSending,
          decoration: _inputDecoration(S.current.eventAddress, prefixIcon: Bootstrap.geo_alt),
        ),
        TextFormField(
          controller: _cityController,
          enabled: !_isSending,
          decoration: _inputDecoration(S.current.eventCity, prefixIcon: Bootstrap.building),
        ),
      ],
    );
  }

  Widget _buildDietaryField() {
    return TextFormField(
      controller: _dietaryController,
      enabled: !_isSending,
      decoration: _inputDecoration(S.current.dietaryNotes, prefixIcon: Bootstrap.egg),
      maxLines: 2,
    );
  }

  Widget _buildBudgetField() {
    return TextFormField(
      controller: _budgetController,
      enabled: !_isSending,
      decoration: _inputDecoration(S.current.budgetEstimate, prefixIcon: Bootstrap.cash_coin),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }

  Widget _buildNotesField() {
    return TextFormField(
      controller: _notesController,
      enabled: !_isSending,
      decoration: _inputDecoration(S.current.specialRequests, prefixIcon: Bootstrap.chat_left_text),
      maxLines: 3,
      maxLength: 500,
    );
  }

  Widget _buildButtons() {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.cancel,
            onPressed: _isSending ? null : () => Navigator.of(context).pop(),
            type: CustomNeumorphicBtnType.secondary,
            disabled: _isSending,
          ),
        ),
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.requestService,
            onPressed: _isSending ? null : _submit,
            disabled: _isSending,
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label, {IconData? prefixIcon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: FoodlyTextStyles.hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 18, color: FoodlyThemes.secondaryFoodly) : null,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: FoodlyThemes.primaryFoodly),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red.shade300),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red.shade300),
      ),
    );
  }
}
