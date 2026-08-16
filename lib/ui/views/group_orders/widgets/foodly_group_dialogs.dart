import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

/// Shell de diálogo Foodly (refinamiento UI pre-F4a): bordes 24, título
/// centrado, CTA neumórfico y cancelar discreto — el MISMO lenguaje visual
/// del selector de split/transferencia en todo Group Orders. Reemplaza a los
/// AlertDialog crudos de Material.
class FoodlyDialogShell extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget child;
  final List<Widget> actions;
  final Color? backgroundColor;

  const FoodlyDialogShell({
    super.key,
    this.title,
    this.icon,
    required this.child,
    required this.actions,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 34, color: FoodlyThemes.primaryFoodly),
              const SizedBox(height: 10),
            ],
            if (title != null) ...[
              Text(title!, style: FoodlyTextStyles.sectionsTitle, textAlign: TextAlign.center),
              const SizedBox(height: 12),
            ],
            child,
            const SizedBox(height: 16),
            ...actions,
          ],
        ),
      ),
    );
  }
}

/// Confirmación estilo Foodly. true = confirmó.
Future<bool> showFoodlyConfirm(
  BuildContext context, {
  required String message,
  String? confirmText,
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => FoodlyDialogShell(
      actions: [
        CustomNeumorphicButton(
          text: confirmText ?? S.current.confirm,
          disabled: false,
          margin: const EdgeInsets.only(bottom: 16),
          onPressed: () => Navigator.pop(ctx, true),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(S.current.cancel, style: FoodlyTextStyles.caption),
        ),
      ],
      child: Text(message, style: FoodlyTextStyles.label, textAlign: TextAlign.center).paddingVertical(16),
    ),
  );
  return ok ?? false;
}

/// Informativo estilo Foodly (un solo CTA de cierre).
Future<void> showFoodlyInfo(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String message,
}) {
  return showDialog<void>(
    context: context,
    builder: (ctx) => FoodlyDialogShell(
      icon: icon,
      title: title,
      actions: [
        CustomNeumorphicButton(
          text: S.current.confirm,
          disabled: false,
          margin: EdgeInsets.zero,
          onPressed: () => Navigator.pop(ctx),
        ),
      ],
      child: Text(message, style: FoodlyTextStyles.caption, textAlign: TextAlign.center),
    ),
  );
}
