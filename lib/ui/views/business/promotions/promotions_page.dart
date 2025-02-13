import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:dart_openai/dart_openai.dart' show OpenAIImageStyle;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/like_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/image_slider_widget.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/business/promotions/cubit/promotions_cubit.dart';
import 'package:foodly_world/ui/views/business/promotions/helper/promotions_helper.dart';
import 'package:foodly_world/ui/views/business/promotions/view_model/promotions_vm.dart';
import 'package:foodly_world/ui/views/foodly_wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity, FontAwesome, LineAwesome;
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:universal_io/io.dart';
import 'package:video_player/video_player.dart' show VideoPlayerController;

part 'widgets/cards/promotion_card.dart';
part 'widgets/create_and_edit_promotion/create_or_edit_promotion_wdg.dart';
part 'widgets/create_and_edit_promotion/edit_promo_media.dart';
part 'widgets/create_and_edit_promotion/select_promo_dates.dart';
part 'widgets/create_and_edit_promotion/select_weekdays.dart';
part 'widgets/promotions_header.dart';
part 'widgets/promotions_snackbars.dart';

class PromotionsPage extends StatelessWidget {
  const PromotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: BlocConsumer<PromotionsCubit, PromotionsState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (vm) => di<DialogService>().showLoading(),
            loaded: (vm) => di<DialogService>().hideLoading(),
            error: (e, vm) {
              di<DialogService>().hideLoading();
              FoodlySnackbars.errorGeneric(context, e);
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<PromotionsCubit>();
          final vm = state.vm;

          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        key: const PageStorageKey<String>('promotions-pageview'),
                        controller: vm.controller,
                        physics: vm.isEditing ? const NeverScrollableScrollPhysics() : const PageScrollPhysics(),
                        itemCount: PromotionStatus.values.length,
                        onPageChanged: (i) => cubit.updateView(i),
                        itemBuilder: (context, i) {
                          if (vm.isEditing) {
                            return const CreateOrEditPromotionWdg();
                          }

                          final status = PromotionStatus.values[i];
                          final promos = vm.promotionsForRender(status);
                          final loaded = state == PromotionsState.loaded(vm);

                          if (promos.isEmpty && loaded) {
                            return FadeIn(child: NoItemsViewWdg(text: S.current.noPromotionsInSection).paddingTop(120));
                          }

                          return FadeIn(
                            child: ListView.builder(
                              key: ValueKey(status.name),
                              controller: status == PromotionStatus.active ? vm.activePromosScrollController : null,
                              padding: const EdgeInsets.only(top: 232),
                              itemBuilder: (_, i) => PromotionCard(
                                key: ValueKey('promo-${promos[i].uuid}'),
                                promo: promos[i],
                              ),
                              itemCount: promos.length,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                _PromotionsHeader(vm: vm, key: const Key('promotions')),
              ],
            ),
          );
        },
      ),
    );
  }
}
