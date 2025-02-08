part of '../promotions_page.dart';

class PromotionsSnackbars {
  const PromotionsSnackbars._();

  static void showCreatePromoWithAI(
    BuildContext context,
    PromotionsCubit cubit,
    PromotionsVM vm,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final generateAIPromoImage = ValueNotifier<(bool, OpenAIImageStyle)>((true, OpenAIImageStyle.natural));

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onPressed: () => cubit.generatePromotion(generateImage: generateAIPromoImage.value),
      buttonText: S.current.aiPromoGenerate,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.aiPromoTitle,
                style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 16),
              ),
              const Asset(FoodlyAssets.ai, height: 40, width: 40),
            ],
          ).paddingBottom(24),
          Text(
            S.current.aiPromoContent(3),
            style: FoodlyTextStyles.snackBarLightBody,
          ),
          FoodlyPrimaryInputText(
            controller: vm.promptCtrl?.controller,
            maxLength: 369,
            maxLines: 3,
            minLines: 3,
            enabled: true,
            autovalidateMode: vm.autovalidateMode,
            inputTextType: FoodlyInputType.generic,
            hideCurrentSnackBarWhenOnTap: false,
            hintText: 'Tap here to add a new prompt',
          ),
          Row(
            children: [
              ValueListenableBuilder<(bool, OpenAIImageStyle)>(
                valueListenable: generateAIPromoImage,
                builder: (context, value, child) => ui.NeumoCheckbox(
                  value: value.$1,
                  onChanged: (newValue) => generateAIPromoImage.value = ((newValue as bool?) ?? true, value.$2),
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.fromLTRB(0, 12, 8, 12),
                  style: ui.NeumoCheckboxStyle(
                    selectedColor: FoodlyThemes.primaryFoodly,
                    boxShape: ui.NeumoBoxShape.roundRect(BorderRadius.circular(4)),
                  ),
                ),
              ),
              Text(
                S.current.aiPromoImageLabel,
                overflow: TextOverflow.ellipsis,
                style: FoodlyTextStyles.snackBarLightBody,
              ).paddingLeft(8),
            ],
          ),
          ValueListenableBuilder<(bool, OpenAIImageStyle)>(
            valueListenable: generateAIPromoImage,
            builder: (context, value, child) => SegmentedButton<OpenAIImageStyle>(
              segments: [
                ButtonSegment(
                  value: OpenAIImageStyle.natural,
                  label: Text(S.current.aiPromoImageNatural, style: FoodlyTextStyles.captionBold).paddingHorizontal(10),
                ),
                ButtonSegment(
                  value: OpenAIImageStyle.vivid,
                  label: Text(S.current.aiPromoImageVivid, style: FoodlyTextStyles.captionBold).paddingHorizontal(10),
                ),
              ],
              showSelectedIcon: false,
              selected: {value.$2},
              onSelectionChanged: value.$1 ? (styles) => generateAIPromoImage.value = (value.$1, styles.first) : null,
              style: ButtonStyle(
                side: const WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.primaryFoodly)),
                foregroundColor: WidgetStateProperty.resolveWith(
                  (states) {
                    return states.contains(WidgetState.selected) ? Colors.white : FoodlyThemes.primaryFoodly;
                  },
                ),
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16)),
                visualDensity: VisualDensity.compact,
              ),
            ).paddingTop(8),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }
}
