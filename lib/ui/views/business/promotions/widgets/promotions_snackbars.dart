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
            hintText: S.current.tapToAddPrompt,
          ),
          Row(
            children: [
              ValueListenableBuilder<(bool, OpenAIImageStyle)>(
                valueListenable: generateAIPromoImage,
                builder: (context, value, child) => Checkbox(
                  value: value.$1,
                  onChanged: (newValue) => generateAIPromoImage.value = ((newValue) ?? true, value.$2),
                ),
              ),
              Expanded(
                child: Text(
                  S.current.aiPromoImageLabel,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: FoodlyTextStyles.snackBarLightBody,
                ),
              ),
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
