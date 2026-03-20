import 'dart:math' as math show pi;

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicShape;
import 'package:foodly_world/core/consts/foodly_assets.dart' show FoodlyAssets;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/cards/business_card.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class BusinessResultsView extends StatelessWidget {
  final List<BusinessDM> searchResults;
  final bool isGridView;
  final String? noResultsMessage;

  const BusinessResultsView({
    super.key,
    required this.searchResults,
    required this.isGridView,
    this.noResultsMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (searchResults.isEmpty) {
      return Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Asset(FoodlyAssets.searchBusinessAgain, width: 48),
          Text(
            noResultsMessage ?? S.current.noRecommendationsFound,
            style: FoodlyTextStyles.actionsBody.copyWith(fontStyle: FontStyle.italic, height: 1.9),
            textAlign: TextAlign.center,
          ).paddingHorizontal(context.screenWidth * .1),
          const SizedBox(height: 48),
        ],
      );
    }

    return AnimatedSwitcher(
      duration: Durations.medium2,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.97, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut),
          ),
          child: child,
        ),
      ),
      child: isGridView
          ? GridView.count(
              key: const ValueKey(BusinessResultsViewMode.grid),
              padding: EdgeInsets.only(top: 16, bottom: context.screenHeight * .15),
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 18 / 29,
              children: searchResults
                  .map((result) => BusinessGridCard(
                        business: result,
                        heroTagPrefix: result.uuid,
                      ))
                  .toList(),
            )
          : ListView.separated(
              key: const ValueKey(BusinessResultsViewMode.list),
              itemCount: searchResults.length,
              padding: EdgeInsets.only(top: 16, bottom: context.screenHeight * .15),
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final business = searchResults[index];
                return BusinessListCard(
                  business: business,
                  heroTagPrefix: business.uuid,
                );
              },
            ),
    );
  }
}

class ViewModeToggleButton extends StatefulWidget {
  final bool isGrid;
  final VoidCallback? onPressed;
  final double? diameter;

  const ViewModeToggleButton({
    super.key,
    required this.isGrid,
    required this.onPressed,
    this.diameter,
  });

  @override
  State<ViewModeToggleButton> createState() => _ViewModeToggleButtonState();
}

class _ViewModeToggleButtonState extends State<ViewModeToggleButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Durations.long1);
    _rotation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
  }

  @override
  void didUpdateWidget(covariant ViewModeToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isGrid != widget.isGrid) {
      _controller.reset(); // Reset before starting new animation
      _controller.forward(); // Start the animation
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = widget.isGrid ? Bootstrap.list : Bootstrap.grid;
    final disabled = widget.onPressed == null;

    return CustomRoundedNeumorphicButton(
      onPressed: widget.onPressed,
      diameter: widget.diameter ?? 26,
      disableDepth: disabled,
      depth: 3,
      shape: ui.NeumorphicShape.concave,
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotation.value * 2 * math.pi, // Rotate 360 degrees
            child: Icon(icon, color: disabled ? Colors.grey : FoodlyThemes.primaryFoodly),
          );
        },
      ),
    );
  }
}
