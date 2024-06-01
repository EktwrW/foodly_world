import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/view_model/sign_up_vm.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class SignUpBusinessTooltip extends StatelessWidget {
  const SignUpBusinessTooltip({
    super.key,
    required GlobalKey<State<StatefulWidget>> tooltipKey,
  }) : _tooltipKey = tooltipKey;

  final GlobalKey<State<StatefulWidget>> _tooltipKey;

  GestureRecognizer _getRecognizer(SignUpCubit cubit) => TapGestureRecognizer()
    ..onTap = () {
      Tooltip.dismissAllToolTips();
      cubit.hideTooltipInBusinessSignUp();
    };

  TextSpan _getTextSpan(String text, SignUpCubit cubit) => TextSpan(
        text: text,
        recognizer: _getRecognizer(cubit),
      );

  TextSpan _getTextSpanBold(String text, SignUpCubit cubit) => TextSpan(
        text: text,
        recognizer: _getRecognizer(cubit),
        style: FoodlyTextStyles.primaryBodyBold,
      );

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: (signUpVM) => _buildTooltip(signUpVM, cubit),
          loaded: (signUpVM) => _buildTooltip(signUpVM, cubit),
          userCreated: (signUpVM) => _buildTooltip(signUpVM, cubit),
          businessCreated: (signUpVM) => _buildTooltip(signUpVM, cubit),
          orElse: () => const SizedBox.expand(),
        );
      },
    );
  }

  TooltipVisibility _buildTooltip(SignUpVM vm, SignUpCubit cubit) {
    return TooltipVisibility(
      visible: vm.tooltipActive,
      child: Tooltip(
        key: _tooltipKey,
        exitDuration: const Duration(hours: 6),
        textAlign: TextAlign.center,
        enableTapToDismiss: false,
        margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: FoodlyThemes.primaryFoodly, width: 2),
        ),
        richMessage: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            WidgetSpan(
              child: const Asset(FoodlyAssets.isoFoodly, height: 24).paddingOnly(right: 5, left: 2),
            ),
            _getTextSpan('${S.current.signUpBusinessTooltipTextSpan1} ', cubit),
            _getTextSpanBold(S.current.signUpBusinessTooltipTextSpan2, cubit),
            _getTextSpan(' ${S.current.signUpBusinessTooltipTextSpan3} ', cubit),
            _getTextSpanBold(S.current.signUpBusinessTooltipTextSpan4, cubit),
            _getTextSpan(' ${S.current.signUpBusinessTooltipTextSpan5} ', cubit),
            _getTextSpanBold(S.current.signUpBusinessTooltipTextSpan6, cubit),
            _getTextSpan(' ${S.current.signUpBusinessTooltipTextSpan7} ', cubit),
            _getTextSpanBold(S.current.signUpBusinessTooltipTextSpan8, cubit),
            _getTextSpan(' ${S.current.signUpBusinessTooltipTextSpan9}', cubit),
          ],
        ),
        child: ColoredBox(
          color: vm.tooltipActive ? Colors.white : Colors.transparent,
          child: AbsorbPointer(
            absorbing: vm.tooltipActive,
            child: PlacesAutocompleteWdg(
              language: cubit.lang,
              components: FoodlyCountries.USA.apiComponents,
              autofocus: !vm.tooltipActive,
              onPickedPlaceDetail: (detail) {
                cubit.updateBusinessFromPlacesAPI(detail);
                if (detail.geometry != null) {
                  vm.mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(detail.geometry!.location.lat, detail.geometry!.location.lng), zoom: 16)));
                }
                di<Logger>().i('$detail');
              },
            ).paddingOnly(
              bottom: 24,
              right: UIDimens.SCREEN_PADDING_MOB,
              left: UIDimens.SCREEN_PADDING_MOB,
            ),
          ),
        ),
      ),
    );
  }
}
