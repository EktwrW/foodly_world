import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_footer_buttons.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_sliver_app_bar.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/edit_cover_images_widgets/edit_cover_images_dialog.dart';
import 'package:foodly_world/ui/views/foodly_wrapper.dart';
import 'package:icons_plus/icons_plus.dart' show Clarity;
//import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // final _authService = di<AuthSessionService>();

  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(const DashboardEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (vm) => di<DialogService>().showLoading(),
            updatingLogo: (vm) => di<DialogService>().showLoading(),
            updatingMenu: (vm) => di<DialogService>().showLoading(),
            loaded: (vm) => di<DialogService>().hideLoading(),
            showCoverImagesDialog: (_) => di<DialogService>().showCustomDialog(const EditCoverImagesDialog(), 2),
            updatingPictures: (vm) => di<DialogService>().showLoading(),
            picturesUpdated: (vm) {
              Navigator.of(context).pop();
              di<DialogService>().hideLoading();
            },
            error: (e, vm) => di<DialogService>().hideLoading(),
          );
        },
        builder: (context, state) {
          final vm = state.vm;
          //final bloc = context.read<DashboardBloc>();

          return Scaffold(
            persistentFooterButtons: const [DashboardFooterButtons()],
            body: NestedScrollView(
              headerSliverBuilder: (context, value) => [const DashboardSliverAppBar()],
              body: Form(
                key: vm.formKey,
                autovalidateMode: vm.autovalidateMode,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        color: FoodlyThemes.tertiaryFoodly,
                        child: Row(
                          children: [
                            const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16).paddingLeft(6),
                            Expanded(
                              child: Text(
                                vm.currentBusiness?.fullAddress ?? '',
                                maxLines: 5,
                                style: FoodlyTextStyles.bodyWhiteSemibold,
                              ).paddingLeft(8),
                            ),
                          ],
                        ).paddingAll(6),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox.square(dimension: 30, child: FoodlyCategories.bakery.icon),
                              Text(FoodlyCategories.bakery.text).paddingLeft(8),
                            ],
                          ),
                          Column(
                            children: [
                              const Text.rich(TextSpan(children: [
                                TextSpan(text: 'Rating Avg:', style: FoodlyTextStyles.caption),
                                TextSpan(text: ' 4.3', style: FoodlyTextStyles.captionPurpleBold),
                              ])),
                              RatingBar.builder(
                                initialRating: 4.3,
                                itemSize: 18,
                                minRating: 1,
                                allowHalfRating: true,
                                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 16),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      const DashboardTitleRichText(
                        firstText: 'Sobre ',
                        secondText: 'Nosotros',
                      ),
                      const DashboardTitleRichText(
                        firstText: 'Horarios de ',
                        secondText: 'Apertura',
                      ),
                      const DashboardTitleRichText(
                        firstText: 'Opiniones de nuestros ',
                        secondText: 'Clientes',
                      ),
                      const DashboardTitleRichText(
                        firstText: 'Servicios en el ',
                        secondText: 'Establecimiento',
                      ),
                      const DashboardTitleRichText(
                        firstText: 'Medios de ',
                        secondText: 'Contacto',
                      ),
                      const DashboardTitleRichText(
                        firstText: 'Informaciones ',
                        secondText: 'Adicionales',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
