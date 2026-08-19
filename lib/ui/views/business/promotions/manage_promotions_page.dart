import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/enums/promo_art_context_enum.dart';
import 'package:foodly_world/core/enums/promo_image_style_enum.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/image/image_slider_widget.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/utils/share_promotion_helper.dart';
import 'package:foodly_world/ui/views/business/promotions/cubit/manage_promotions_cubit.dart';
import 'package:foodly_world/ui/views/business/promotions/helper/promotions_helper.dart';
import 'package:foodly_world/ui/views/business/promotions/view_model/manage_promotions_vm.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, Clarity;
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:universal_io/io.dart';
import 'package:video_player/video_player.dart' show VideoPlayerController;

part 'widgets/cards/manage_promotion_card.dart';
part 'widgets/create_and_edit_promotion/create_or_edit_promotion_wdg.dart';
part 'widgets/create_and_edit_promotion/edit_promo_media.dart';
part 'widgets/create_and_edit_promotion/select_promo_dates.dart';
part 'widgets/create_and_edit_promotion/select_weekdays.dart';
part 'widgets/manage_promotions_header.dart';
part 'widgets/manage_promotions_snackbars.dart';

class ManagePromotionsPage extends StatelessWidget {
  const ManagePromotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: BlocConsumer<ManagePromotionsCubit, ManagePromotionsState>(
        listener: (context, state) {
          final dialogService = di<DialogService>();

          state.whenOrNull(
            loading: (vm) => dialogService.showLoading(),
            loaded: (vm) => dialogService.hideLoading(),
            error: (e, vm) {
              dialogService.hideLoading();
              FoodlySnackbars.errorGeneric(context, e);
            },
            aiQuotaExhausted: (vm) {
              dialogService.hideLoading();
              ManagePromotionsSnackbars.showAiPromoQuotaExhausted(
                context,
                vm.businessDM?.aiPromoMonthlyLimit ?? 3,
              );
            },
          );
        },
        builder: (context, state) {
          final cubit = context.read<ManagePromotionsCubit>();
          final vm = state.vm;

          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
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
                          final loaded = state == ManagePromotionsState.loaded(vm);

                          if (promos.isEmpty && loaded) {
                            return FadeIn(child: NoItemsViewWdg(text: S.current.noPromotionsInSection).paddingTop(120));
                          }

                          final scrollController = {
                            PromotionStatus.active: vm.activePromosScrollController,
                            PromotionStatus.next: vm.upcomingPromosScrollController,
                          }[status];

                          return FadeIn(
                            child: ListView.builder(
                              key: ValueKey(status),
                              controller: scrollController,
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
                _ManagePromotionsHeader(vm: vm, key: const Key('promotions')),
              ],
            ),
          );
        },
      ),
    );
  }
}
