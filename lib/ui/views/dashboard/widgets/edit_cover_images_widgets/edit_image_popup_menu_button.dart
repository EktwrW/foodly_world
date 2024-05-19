import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/helpers/dashboard_helpers.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class EditImagePopupMenuButton extends StatelessWidget {
  final BusinessCoverImageDM coverImageDM;

  const EditImagePopupMenuButton({super.key, required this.coverImageDM});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      elevation: 3,
      icon: const Icon(Icons.more_vert, color: Colors.white),
      constraints: const BoxConstraints(maxWidth: 50),
      onSelected: (item) => onItemSelected(context, item),
      color: Colors.white70,
      itemBuilder: (context) => [
        const PopupMenuItem(
          height: 36,
          value: 1,
          child: Icon(Bootstrap.pencil_square, size: 24, color: FoodlyThemes.primaryFoodly),
        ),
        const PopupMenuItem(
          height: 36,
          value: 2,
          child: Icon(Bootstrap.trash3, size: 24, color: FoodlyThemes.primaryFoodly),
        ),
      ],
    );
  }

  void onItemSelected(BuildContext context, int item) async {
    switch (item) {
      case 1:
        if ((coverImageDM.url?.isNotEmpty ?? false) && (coverImageDM.imageId?.isNotEmpty ?? false)) {
          await DashboardHelpers.cropImageFromUrl(coverImageDM.url!, context).then(
            (filePath) => filePath.isNotEmpty
                ? context.read<DashboardBloc>().add(DashboardEvent.updatePicture(coverImageDM.imageId!, filePath))
                : null,
          );
        }
        break;
      case 2:
        context.read<DashboardBloc>().add(DashboardEvent.deleteCoverImageById(coverImageDM));
        break;

      default:
        break;
    }
  }
}
