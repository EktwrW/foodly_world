import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_loading_text_dots.dart';
import 'package:foodly_world/ui/shared_widgets/animations/icon_pulsing.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/home/widgets/voice_search/cubit/voice_search_cubit.dart';

class VoiceSearchSnackbars {
  const VoiceSearchSnackbars._();

  static void showInputSearchWdg(
    BuildContext context,
  ) {
    final cubit = context.read<VoiceSearchCubit>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final locationService = di<LocationService>();

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onDismiss: () => cubit.checkForResetToInitial(),
      buttonBuilder: (dismiss) => BlocBuilder<VoiceSearchCubit, VoiceSearchState>(
        builder: (context, state) {
          final vm = state.vm;

          return SizedBox(
            width: double.infinity,
            child: ValueListenableBuilder(
                valueListenable: vm.inputController.controller ?? TextEditingController(),
                builder: (_, textValue, __) {
                  final canNotSave = vm.recognizedText.isEmpty && textValue.text.isEmpty;

                  return ui.NeumoButton(
                    onPressed: canNotSave
                        ? null
                        : (textValue.text.isNotEmpty)
                            ? () {
                                cubit.searchBusinesses(
                                  locationService.currentLocation.position?.latitude ?? 0.0,
                                  locationService.currentLocation.position?.longitude ?? 0.0,
                                );

                                dismiss();
                              }
                            : () async {
                                final locationService = di<LocationService>();

                                await cubit.stopListening();
                                cubit.searchBusinesses(
                                  locationService.currentLocation.position?.latitude ?? 0.0,
                                  locationService.currentLocation.position?.longitude ?? 0.0,
                                );

                                dismiss();
                              },
                    style: ui.NeumoStyle(
                      shape: ui.NeumoShape.convex,
                      boxShape: ui.NeumoBoxShape.roundRect(BorderRadius.circular(12)),
                      depth: 3,
                      lightSource: ui.LightSource.topRight,
                      intensity: 1.2,
                      surfaceIntensity: .3,
                      color: ui.NeumoColors.embossMaxWhiteColor,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ClayText(
                        S.current.send,
                        color: canNotSave ? FoodlyThemes.lightTheme().disabledColor : FoodlyThemes.primaryFoodly,
                        spread: 0,
                        style: FoodlyTextStyles.snackBarPrimaryButton,
                      ),
                    ),
                  );
                }),
          );
        },
      ),
      content: const VoiceSearchContent(),
    );

    scaffoldMessenger
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar.getSnackBar(context)).closed.then((_) => cubit.checkForResetToInitial());
  }
}

class VoiceSearchContent extends StatelessWidget {
  const VoiceSearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceSearchCubit, VoiceSearchState>(
      builder: (context, state) {
        final vm = state.vm;

        return AnimatedSize(
          duration: Durations.medium2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedCrossFade(
                duration: Durations.medium3,
                crossFadeState: vm.smartSearchMode.isVoice ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: _VoiceSearchView(vm: vm),
                secondChild: _TextSearchView(vm: vm),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _VoiceSearchView extends StatelessWidget {
  final VoiceSearchVM vm;

  const _VoiceSearchView({required this.vm});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VoiceSearchCubit>();

    return Column(
      spacing: 40,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: PulsingMicIcon(
            icon: const Asset(FoodlyAssets.mic, height: 55, width: 55),
            animate: vm.isListening,
          ).paddingTop(20),
        ),
        Flexible(
          child: AnimatedSize(
            clipBehavior: Clip.antiAlias,
            duration: Durations.medium1,
            child: vm.recognizedText.isNotEmpty
                ? _TextWdg(
                    text: vm.recognizedText,
                    key: const Key('recognized-text'),
                  )
                : !vm.isListening
                    ? _TextWdg(
                        text: S.current.readyToListen,
                        key: const Key('Ready-to-listen'),
                      )
                    : AnimatedTextLoadingDots(
                        key: const Key('voice_search_listening_text'),
                        text: S.current.listening,
                        textStyle: FoodlyTextStyles.snackBarLightBody,
                        alignment: MainAxisAlignment.center,
                      ),
          ).paddingVertical(10),
        ),
        SizedBox(
          width: double.infinity,
          child: ui.NeumoButton(
            onPressed: vm.isListening ? () => cubit.stopListening() : () => cubit.startListening(),
            style: ui.NeumoStyle(
              shape: ui.NeumoShape.convex,
              boxShape: ui.NeumoBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 3,
              lightSource: ui.LightSource.topRight,
              intensity: 1.2,
              surfaceIntensity: .3,
              color: FoodlyThemes.primaryFoodly,
            ),
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ClayText(
                vm.isListening ? S.current.stop : S.current.retryRecording,
                color: ui.NeumoColors.decorationMaxWhiteColor,
                spread: 0,
                style: FoodlyTextStyles.snackBarPrimaryButton,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextSearchView extends StatelessWidget {
  final VoiceSearchVM vm;

  const _TextSearchView({required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Asset(
            FoodlyAssets.searchBusiness,
            height: 55,
            width: 55,
          ),
        ),
        _TextWdg(text: S.current.needBestRecommendations),
        FoodlyPrimaryInputText(
          minLines: 2,
          maxLines: 3,
          inputTextType: FoodlyInputType.search,
          autovalidateMode: AutovalidateMode.onUnfocus,
          controller: vm.inputController.controller,
          focusNode: vm.inputController.focusNode,
          enabled: !vm.smartSearchMode.isVoice,
          hideCurrentSnackBarWhenOnTap: false,
          showLeading: false,
          prefixIconConstraints: const BoxConstraints.tightFor(width: 32),
        ),
      ],
    ).paddingBottom(12);
  }
}

class _TextWdg extends StatelessWidget {
  final String text;
  const _TextWdg({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FoodlyTextStyles.snackBarLightBody,
      maxLines: 16,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}
