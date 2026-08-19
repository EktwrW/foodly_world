part of '../manage_promotions_page.dart';

class ManagePromotionsSnackbars {
  const ManagePromotionsSnackbars._();

  static void showCreatePromoWithAI(
    BuildContext context,
    ManagePromotionsCubit cubit,
    ManagePromotionsVM vm,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final opts = ValueNotifier<AiPromoImageOptions>((
      generate: true,
      style: PromoImageStyle.natural,
      context: PromoArtContext.producto,
      people: false,
    ));

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onPressed: () => cubit.generatePromotion(options: opts.value),
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
            S.current.aiPromoContent(vm.businessDM?.aiPromoRemaining ?? 0),
            style: FoodlyTextStyles.snackBarLightBody,
          ).paddingBottom(16),

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
              ValueListenableBuilder<AiPromoImageOptions>(
                valueListenable: opts,
                builder: (context, value, child) => Checkbox(
                  value: value.generate,
                  onChanged: (newValue) => opts.value = (
                    generate: newValue ?? true,
                    style: value.style,
                    context: value.context,
                    people: value.people,
                  ),
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
          ValueListenableBuilder<AiPromoImageOptions>(
            valueListenable: opts,
            builder: (context, value, child) => SegmentedButton<PromoImageStyle>(
              segments: [
                ButtonSegment(
                  value: PromoImageStyle.natural,
                  label: Text(S.current.aiPromoImageNatural, style: FoodlyTextStyles.captionBold).paddingHorizontal(10),
                ),
                ButtonSegment(
                  value: PromoImageStyle.vivid,
                  label: Text(S.current.aiPromoImageVivid, style: FoodlyTextStyles.captionBold).paddingHorizontal(10),
                ),
              ],
              showSelectedIcon: false,
              selected: {value.style},
              onSelectionChanged: value.generate
                  ? (styles) => opts.value = (
                        generate: value.generate,
                        style: styles.first,
                        context: value.context,
                        people: value.people,
                      )
                  : null,
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

          // Contexto del arte. Define QUÉ muestra la imagen; el backend lo
          // traduce a composición y se lo pasa tanto a Gemini (para el sujeto)
          // como al modelo de imagen (para el encuadre).
          ValueListenableBuilder<AiPromoImageOptions>(
            valueListenable: opts,
            builder: (context, value, child) => SegmentedButton<PromoArtContext>(
              segments: [
                ButtonSegment(
                  value: PromoArtContext.producto,
                  label:
                      Text(S.current.aiPromoContextProduct, style: FoodlyTextStyles.captionBold).paddingHorizontal(6),
                ),
                ButtonSegment(
                  value: PromoArtContext.escena,
                  label: Text(S.current.aiPromoContextScene, style: FoodlyTextStyles.captionBold).paddingHorizontal(6),
                ),
                ButtonSegment(
                  value: PromoArtContext.evento,
                  label: Text(S.current.aiPromoContextEvent, style: FoodlyTextStyles.captionBold).paddingHorizontal(6),
                ),
              ],
              showSelectedIcon: false,
              selected: {value.context},
              onSelectionChanged: value.generate
                  ? (ctx) => opts.value = (
                        generate: value.generate,
                        style: value.style,
                        context: ctx.first,
                        people: value.people,
                      )
                  : null,
              style: ButtonStyle(
                side: const WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.primaryFoodly)),
                foregroundColor: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.selected) ? Colors.white : FoodlyThemes.primaryFoodly,
                ),
                padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16)),
                visualDensity: VisualDensity.compact,
              ),
            ).paddingTop(8),
          ),

          // Personas sí/no. Cuando está activo el backend pide siempre gente
          // de espaldas o con la cara fuera de cuadro: nunca un rostro nítido,
          // que es donde estos modelos producen ojos deformes y manos de seis
          // dedos.
          ValueListenableBuilder<AiPromoImageOptions>(
            valueListenable: opts,
            builder: (context, value, child) => Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    ui.NeumorphicSwitch(
                      value: value.people,
                      duration: Durations.medium2,
                      curve: Curves.decelerate,
                      onChanged: value.generate
                          ? (newValue) => opts.value = (
                                generate: value.generate,
                                style: value.style,
                                context: value.context,
                                people: newValue,
                              )
                          : null,
                      height: 28,
                      isEnabled: value.generate,
                      style: ui.NeumorphicSwitchStyle(
                        activeTrackColor: FoodlyThemes.primaryFoodly.withValues(alpha: .73),
                        inactiveTrackColor: Colors.black12,
                        activeThumbColor: FoodlyThemes.success,
                        inactiveThumbColor: FoodlyThemes.secondaryFoodly,
                        thumbShape: ui.NeumorphicShape.convex,
                        lightSource: ui.LightSource.topRight,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        S.current.aiPromoIncludePeople,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FoodlyTextStyles.snackBarLightBody,
                      ),
                    ),
                  ],
                ).paddingVertical(10),
                if (value.generate)
                  Text(
                    'Tiempo de procesamiento ~25s',
                    style: FoodlyTextStyles.caption.copyWith(fontSize: 10, color: Colors.black),
                  ),
              ],
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }

  static void showAiPromoQuotaExhausted(BuildContext context, int limit) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBarWdg(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  S.current.aiPromoQuotaExhaustedTitle,
                  style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 16),
                ),
              ),
              const Asset(FoodlyAssets.ai, height: 40, width: 40),
            ],
          ).paddingBottom(16),
          Text(
            S.current.aiPromoQuotaExhaustedContent(limit),
            style: FoodlyTextStyles.snackBarLightBody,
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
  }
}
