import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:icons_plus/icons_plus.dart' show Clarity;

class AddressWdg extends StatelessWidget {
  const AddressWdg({
    super.key,
    required this.vm,
  });

  final DashboardVM vm;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 24),
      color: FoodlyThemes.tertiaryFoodly,
      child: Row(
        children: [
          const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16).paddingLeft(6),
          Expanded(
            child: Text(
              vm.currentBusiness?.fullAddress ?? '',
              maxLines: 5,
              style: FoodlyTextStyles.bodyWhiteSemibold,
            ).paddingLeft(8),
          ),
        ],
      ).paddingAll(6),
    );
  }
}
