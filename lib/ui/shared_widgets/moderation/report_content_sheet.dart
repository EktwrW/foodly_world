import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/network/moderation/moderation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

/// Bottom sheet de reporte de contenido (App Store Guideline 1.2).
/// El usuario elige un motivo y envía; el contenido reportado puede auto-ocultarse
/// tras varios reportes (lógica del BE).
void showReportContentSheet(
  BuildContext context, {
  required ReportableType type,
  required String reportableUuid,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ReportContentSheet(type: type, reportableUuid: reportableUuid),
  );
}

class _ReportContentSheet extends StatefulWidget {
  final ReportableType type;
  final String reportableUuid;
  const _ReportContentSheet({required this.type, required this.reportableUuid});

  @override
  State<_ReportContentSheet> createState() => _ReportContentSheetState();
}

class _ReportContentSheetState extends State<_ReportContentSheet> {
  ReportReason? _selected;
  bool _sending = false;

  String _label(ReportReason r) => switch (r) {
        ReportReason.spam => S.current.reportReasonSpam,
        ReportReason.offensive => S.current.reportReasonOffensive,
        ReportReason.harassment => S.current.reportReasonHarassment,
        ReportReason.hateSpeech => S.current.reportReasonHateSpeech,
        ReportReason.sexual => S.current.reportReasonSexual,
        ReportReason.violence => S.current.reportReasonViolence,
        ReportReason.misinformation => S.current.reportReasonMisinformation,
        ReportReason.other => S.current.reportReasonOther,
      };

  Future<void> _submit() async {
    if (_selected == null || _sending) return;
    setState(() => _sending = true);

    final result = await di<ModerationRepo>().reportContent(
      type: widget.type,
      reportableUuid: widget.reportableUuid,
      reason: _selected!,
    );

    if (!mounted) return;
    result.when(
      success: (_) {
        Navigator.of(context).pop();
        FoodlySnackbars.successGeneric(context, S.current.reportSentSuccess);
      },
      failure: (_) {
        setState(() => _sending = false);
        FoodlySnackbars.errorGeneric(context, S.current.somethingWentWrong);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ui.NeumorphicColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: FadeIn(
                  duration: const Duration(milliseconds: 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.flag_outlined, color: FoodlyThemes.primaryFoodly),
                          const SizedBox(width: 10),
                          Text(S.current.reportContent, style: FoodlyTextStyles.menuTitle),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(S.current.reportContentSubtitle, style: FoodlyTextStyles.label),
                      const SizedBox(height: 12),
                      ...ReportReason.values.map((r) => _ReasonTile(
                            label: _label(r),
                            selected: _selected == r,
                            onTap: _sending ? null : () => setState(() => _selected = r),
                          )),
                      const SizedBox(height: 16),
                      CustomNeumorphicButton(
                        disabled: _selected == null || _sending,
                        onPressed: _selected == null || _sending ? null : _submit,
                        text: _sending ? '...' : S.current.reportSubmit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReasonTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const _ReasonTile({required this.label, required this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? FoodlyThemes.primaryFoodly.withValues(alpha: .08) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              size: 20,
              color: selected ? FoodlyThemes.primaryFoodly : Colors.black38,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: FoodlyTextStyles.label)),
          ],
        ),
      ),
    );
  }
}
