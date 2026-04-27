import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/network/business_availability/business_availability_repo.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/service_events_tracker.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;
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
  bool _isSending = false;
  // Note: we no longer expose an event-type selector to the customer. The
  // `event_type` on the reservation is now derived from
  // `service_package.service_type` server-side — one source of truth. See
  // memory note "Opción A: paquete manda" in
  // project_catering_chefs_vertical.md.

  // ── Availability state ──────────────────────────────────────────
  bool _isLoadingAvailability = true;
  bool _availabilityLoadFailed = false;
  // Dates that are 100% blocked (full-day). Stored as `yyyy-MM-dd` strings
  // so `Set.contains` is O(1) regardless of the DateTime instance.
  final Set<String> _fullDayBlockedDates = <String>{};
  // Partially-blocked dates — the customer can still pick them, we just
  // show an informational snackbar after they submit so they know the
  // manager may ask to adjust the time window.
  final Set<String> _partiallyBlockedDates = <String>{};
  // We fetch 180 days forward; the date-picker's lastDate stays at 365 to
  // keep the option to request far-future events, but beyond 180d we
  // treat everything as "available" since we don't have signal.
  static const int _availabilityHorizonDays = 180;

  @override
  void initState() {
    super.initState();
    if (widget.package.minGuests != null) {
      _guestCountController.text = widget.package.minGuests.toString();
    }
    // service.booking_started — open of the booking form is the funnel
    // checkpoint between "package inquiry" (tap on CTA) and "booking
    // submitted" (form sent). Fired once on initState; if the user
    // dismisses the sheet without submitting, that's an explicit drop-off
    // Mateo can compute as bookingStarted - bookingSubmitted.
    di<ServiceEventsTracker>().bookingStarted(
      packageUuid: widget.package.uuid ?? '',
      businessUuid: widget.businessUuid,
      sourceModule: 'ServiceBookingRequestSheet',
    );
    _loadAvailability();
  }

  Future<void> _loadAvailability() async {
    final repo = di<BusinessAvailabilityRepo>();
    final now = DateTime.now();
    final from = DateTime(now.year, now.month, now.day);
    final to = from.add(const Duration(days: _availabilityHorizonDays));

    final result = await repo.getPublicAvailability(
      widget.businessUuid,
      from: DateFormat('yyyy-MM-dd').format(from),
      to: DateFormat('yyyy-MM-dd').format(to),
    );

    if (!mounted) return;

    result.when(
      success: (response) {
        _fullDayBlockedDates.clear();
        _partiallyBlockedDates.clear();
        for (final slot in response.availability) {
          final d = slot.date;
          if (d == null) continue;
          final key = DateFormat('yyyy-MM-dd').format(d);
          if (slot.isFullDay) {
            _fullDayBlockedDates.add(key);
          } else {
            _partiallyBlockedDates.add(key);
          }
        }
        setState(() {
          _isLoadingAvailability = false;
          _availabilityLoadFailed = false;
        });
        // service.availability_checked — fired only on successful fetch so
        // Mateo's metric reflects "real consults the customer made", not
        // failed network attempts. The booking sheet calls this on mount
        // (and only on mount), so 1 event = 1 booking-form open.
        di<ServiceEventsTracker>().availabilityChecked(
          businessUuid: widget.businessUuid,
          sourceModule: 'ServiceBookingRequestSheet',
        );
      },
      failure: (_) {
        // Fail open: if we can't load availability, don't block the user.
        setState(() {
          _isLoadingAvailability = false;
          _availabilityLoadFailed = true;
        });
      },
    );
  }

  bool _isDateFullyBlocked(DateTime date) {
    final key = DateFormat('yyyy-MM-dd').format(date);
    return _fullDayBlockedDates.contains(key);
  }

  bool _isDatePartiallyBlocked(DateTime date) {
    final key = DateFormat('yyyy-MM-dd').format(date);
    return _partiallyBlockedDates.contains(key);
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
    // Don't open the picker until availability has loaded — otherwise the
    // user could pick a blocked date and only find out on submit.
    if (_isLoadingAvailability) {
      FoodlySnackbars.infoGeneric(context, S.current.loadingAvailability);
      return;
    }

    final now = DateTime.now();
    // Propose 7 days out, but skip forward if that day happens to be blocked.
    DateTime initial = now.add(const Duration(days: 7));
    int guard = 0;
    while (_isDateFullyBlocked(initial) && guard < 30) {
      initial = initial.add(const Duration(days: 1));
      guard++;
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      selectableDayPredicate: (date) => !_isDateFullyBlocked(date),
      helpText: S.current.selectDate,
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);

      // Gentle heads-up when the customer picks a day where the manager
      // has a partial block — they can still submit, but we set
      // expectations so the manager isn't surprised.
      if (_isDatePartiallyBlocked(picked) && mounted) {
        FoodlySnackbars.infoGeneric(context, S.current.datePartiallyBlockedInfo);
      }
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

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null) {
      FoodlySnackbars.errorGeneric(context, S.current.selectDate);
      return;
    }

    // Race condition guard: someone could have created a block between the
    // initial fetch and the moment the customer hits "Request". Re-check
    // against our (possibly stale) cache; if it's flagged, refuse the
    // submission instead of letting the BE bounce it with a generic error.
    if (_isDateFullyBlocked(_selectedDate!)) {
      FoodlySnackbars.errorGeneric(context, S.current.dateUnavailable);
      setState(() => _selectedDate = null);
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
      // `event_type` is intentionally NOT sent. BE derives it from the
      // selected service_package's service_type. Keeping a second source
      // of truth was the whole bug we just fixed.
      guestCount: int.parse(_guestCountController.text),
      dietaryNotes: _dietaryController.text.isNotEmpty ? _dietaryController.text : null,
      budgetEstimate: _budgetController.text.isNotEmpty ? double.tryParse(_budgetController.text) : null,
      specialRequests: _notesController.text.isNotEmpty ? _notesController.text : null,
    );

    if (!mounted) return;

    result.when(
      success: (response) {
        // service.booking_submitted — only fire after the BE accepted.
        // Failures don't count as a submission (Mateo's funnel rates would
        // otherwise look healthier than reality).
        di<ServiceEventsTracker>().bookingSubmitted(
          reservationUuid: response.reservation?.reservationUuid ?? '',
          packageUuid: widget.package.uuid ?? '',
          businessUuid: widget.businessUuid,
          guestCount: int.tryParse(_guestCountController.text),
          sourceModule: 'ServiceBookingRequestSheet',
        );
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
                        _buildTitle().paddingVertical(9),
                        _buildPackageInfo(),
                        _buildAvailabilityHint(),
                        _buildDateTimeRow(),
                        _buildGuestCountField(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(pkg.title, maxLines: 2, style: FoodlyTextStyles.actionsBodyBold)),
              _buildServiceTypeChip(pkg.serviceType),
            ],
          ),
          if (pkg.hasPrice) ...[
            const SizedBox(height: 4),
            Text(
              // The package carries its own currency (persisted by the BE
              // per business country at package-creation time). Fallback
              // is `$` — the same global default used in MenuVM,
              // ManageMenuVM, AuthSessionService.currency, etc. — so we
              // never display the wrong symbol on a defensive path.
              '${pkg.currency ?? '\$'}${pkg.price!.toStringAsFixed(2)} · ${pkg.priceType.name}',
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

  /// Small read-only chip showing the service type of the package
  /// (Wedding, Birthday, Dinner, etc.) — derived from `package.service_type`.
  /// The customer cannot edit it; it's shown so they know which kind of
  /// event this booking will be classified as.
  Widget _buildServiceTypeChip(ServiceType type) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: FoodlyThemes.primaryFoodly,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            type.icon,
            size: 13,
            color: FoodlyThemes.primaryFoodly,
          ),
          const SizedBox(width: 6),
          Text(
            type.label,
            style: FoodlyTextStyles.choiceChipBold.copyWith(
              color: FoodlyThemes.primaryFoodly,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 9, vertical: 3),
    );
  }

  /// Small row above the date picker that tells the customer whether we
  /// know which days are taken. Three states:
  ///   - loading: "Cargando disponibilidad…" with a spinner
  ///   - loaded + has blocks: "Días en gris no están disponibles"
  ///   - load failed: silent (we fail open — don't alarm the customer)
  ///   - loaded + no blocks: silent (nothing useful to say)
  Widget _buildAvailabilityHint() {
    if (_isLoadingAvailability) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: FoodlyThemes.secondaryFoodly.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: FoodlyThemes.primaryFoodly,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                S.current.loadingAvailability,
                style: FoodlyTextStyles.caption,
              ),
            ),
          ],
        ),
      );
    }
    if (_availabilityLoadFailed || _fullDayBlockedDates.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Bootstrap.info_circle, size: 14, color: FoodlyThemes.primaryFoodly),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              S.current.unavailableDaysHint,
              style: FoodlyTextStyles.caption,
            ),
          ),
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
      decoration: _inputDecoration(S.current.guestCount, prefixIcon: FontAwesome.people_group_solid),
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
      children: [
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.cancel,
            onPressed: _isSending ? null : () => Navigator.of(context).pop(),
            type: CustomNeumorphicBtnType.secondary,
            disabled: _isSending,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 9),
          ),
        ),
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.requestService,
            onPressed: _isSending ? null : _submit,
            disabled: _isSending,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 9),
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
