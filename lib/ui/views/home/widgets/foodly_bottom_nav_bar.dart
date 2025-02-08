part of '../home_page.dart';

class _FoodlyBottomNavBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTap;

  const _FoodlyBottomNavBar({
    required this.activeIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      splashColor: FoodlyThemes.tertiaryFoodly.withValues(alpha: .5),
      onTap: onTap,
      itemCount: UIIconsData.bottomNavigationIcons.length,
      tabBuilder: (int index, bool isActive) => _buildNavBarItem(index: index, isActive: isActive),
    );
  }

  Widget _buildNavBarItem({
    required int index,
    required bool isActive,
  }) {
    if (UIIconsData.bottomNavigationIcons[index] == Bootstrap.shop_window) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            UIIconsData.bottomNavigationIcons[index],
            size: 24,
            color: isActive ? FoodlyThemes.primaryFoodly : Colors.black.withValues(alpha: .75),
          ),
          Icon(
            Bootstrap.heart_fill,
            size: 14,
            color: isActive ? FoodlyThemes.primaryFoodly : const Color(0xFF313030),
          ).paddingOnly(bottom: 16, left: 12),
        ],
      );
    }

    return Icon(
      UIIconsData.bottomNavigationIcons[index],
      size: 24,
      color: isActive ? FoodlyThemes.primaryFoodly : Colors.black.withValues(alpha: .75),
    );
  }
}
