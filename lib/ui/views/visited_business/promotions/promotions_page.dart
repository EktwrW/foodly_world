import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' hide PromotionStatus;
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/video/video_players.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/cubit/promotions_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/view_model/promotions_vm.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

part 'widgets/cards/promotion_card.dart';
part 'widgets/promotions_header.dart';

/// Pantalla para ver las promociones de un negocio en modo solo lectura
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
                        controller: vm.controller,
                        physics: const PageScrollPhysics(),
                        itemCount: PromotionStatus.values.length,
                        onPageChanged: (i) => cubit.updateView(i),
                        itemBuilder: (context, i) {
                          final status = PromotionStatus.values[i];
                          final promos = vm.promotionsForRender(status);

                          if (promos.isEmpty && state.isLoaded) {
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
                              padding: const EdgeInsets.only(top: 180),
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
