// part of 'visited_menu_category_builder_wdg.dart';

// class AdaptiveItemVersionSelector extends StatelessWidget {
//   final ItemDM item;
//   final MenuCategory menuCategory;

//   const AdaptiveItemVersionSelector({
//     super.key,
//     required this.item,
//     required this.menuCategory,
//   });

//   void _onVersionChanged(BuildContext context, Version? newVersion) {
//     if (newVersion != null) {
//       // final updatedItem = item.copyWith(selectedVersion: newVersion);
//       // context.read<MenuCubit>().updateItem(updatedItem, menuCategory, subCategoryUuid);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!item.available) {
//       return Text(S.current.temporarilyUnavailable, style: FoodlyTextStyles.errorBodyText).paddingTop(12);
//     }

//     if (context.isSmallWidthPhone) {
//       return _buildDropdownButton(context);
//     } else {
//       return _buildToggleButtons(context);
//     }
//   }

//   Widget _buildToggleButtons(BuildContext context) {
//     return ToggleButtons(
//       isSelected: item.sortedVersions.map((v) => v == item.getSelectedVersion).toList(),
//       onPressed: (index) => _onVersionChanged(context, item.sortedVersions[index]),
//       constraints: const BoxConstraints.expand(height: 24, width: 70),
//       borderRadius: BorderRadius.circular(2.0),
//       fillColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
//       borderWidth: 0,
//       borderColor: FoodlyThemes.secondaryFoodly,
//       selectedColor: FoodlyThemes.primaryFoodly,
//       color: Colors.black,
//       children: item.sortedVersions
//           .map((v) => Text(
//                 v.text,
//                 style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//               ).paddingHorizontal(4))
//           .toList(),
//     );
//   }

//   Widget _buildDropdownButton(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(6),
//       child: ColoredBox(
//         color: FoodlyThemes.primaryFoodly.withAlpha(15),
//         child: SizedBox(
//           width: 110,
//           height: 28,
//           child: DropdownButton<Version>(
//             value: item.getSelectedVersion,
//             onChanged: (newVersion) => _onVersionChanged(context, newVersion),
//             items: item.sortedVersions.map((Version version) {
//               return DropdownMenuItem<Version>(
//                 value: version,
//                 child: Text(
//                   version.text,
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: version == item.getSelectedVersion ? FoodlyThemes.primaryFoodly : Colors.black,
//                   ),
//                 ),
//               );
//             }).toList(),
//             padding: const EdgeInsets.only(left: 10, top: 2, right: 4),
//             borderRadius: BorderRadius.circular(8),
//             icon: const Icon(Icons.arrow_drop_down, color: FoodlyThemes.primaryFoodly),
//             isDense: true,
//             isExpanded: true,
//           ),
//         ),
//       ),
//     );
//   }
// }
