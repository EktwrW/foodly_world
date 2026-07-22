import 'package:flutter/material.dart';
import 'package:foodly_world/core/network/moderation/moderation_repo.dart' show ReportableType;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/moderation/block_user_dialog.dart';
import 'package:foodly_world/ui/shared_widgets/moderation/report_content_sheet.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Menú de moderación (App Store Guideline 1.2) que se muestra en el contenido
/// de OTROS usuarios (reseñas, posts): permite Reportar el contenido y Bloquear
/// al autor. No mostrar en el contenido propio.
class ModerationMenuButton extends StatelessWidget {
  final ReportableType type;

  /// UUID del contenido reportable (reseña o post).
  final String contentUuid;

  /// UUID + nombre del autor, para el bloqueo.
  final String authorUuid;
  final String authorName;

  /// Se dispara tras bloquear, para que la lista contenedora se refresque.
  final VoidCallback? onModerated;

  final double iconSize;

  const ModerationMenuButton({
    super.key,
    required this.type,
    required this.contentUuid,
    required this.authorUuid,
    required this.authorName,
    this.onModerated,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      elevation: 3,
      icon: Icon(Bootstrap.three_dots_vertical, color: FoodlyThemes.primaryFoodly, size: iconSize),
      constraints: const BoxConstraints(maxWidth: 200),
      color: Colors.white.withValues(alpha: 0.96),
      padding: EdgeInsets.zero,
      onSelected: (value) {
        switch (value) {
          case 'report':
            showReportContentSheet(context, type: type, reportableUuid: contentUuid);
            break;
          case 'block':
            showBlockUserDialog(
              context,
              userUuid: authorUuid,
              userName: authorName,
              onBlocked: onModerated,
            );
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          height: 40,
          value: 'report',
          child: Row(
            children: [
              const Icon(Icons.flag_outlined, size: 18, color: FoodlyThemes.primaryFoodly),
              const SizedBox(width: 10),
              Text(S.current.reportContent, style: const TextStyle(color: FoodlyThemes.primaryFoodly)),
            ],
          ),
        ),
        if (authorUuid.isNotEmpty)
          PopupMenuItem(
            height: 40,
            value: 'block',
            child: Row(
              children: [
                const Icon(Icons.block, size: 18, color: FoodlyThemes.error),
                const SizedBox(width: 10),
                Text(S.current.blockUser, style: const TextStyle(color: FoodlyThemes.error)),
              ],
            ),
          ),
      ],
    );
  }
}
