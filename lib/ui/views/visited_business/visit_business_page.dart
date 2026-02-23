import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/core_exports.dart'
    show
        DialogService,
        FoodlyWrapper,
        di,
        PaddingExtension,
        BlocListener,
        S,
        FoodlyThemes,
        FoodlyCategories,
        BlocSelector,
        ReadContext,
        Weekday,
        BusinessDays,
        ScreenSizeExtension;
import 'package:foodly_world/core/enums/business_enums.dart' show BusinessServices;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/cards/review_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/texts/email_phone_text_links.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/widgets/visit_business_footer_buttons.dart';
import 'package:foodly_world/ui/views/visited_business/widgets/visit_business_sliver_app_bar.dart';
import 'package:foodly_world/ui/views/visited_business/widgets/visit_business_snackbars.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart' show Clarity;

part '../visited_business/widgets/about_us/about_us.dart';
part '../visited_business/widgets/address/address.dart';
part '../visited_business/widgets/category_and_rating/category.dart';
part '../visited_business/widgets/category_and_rating/category_and_rating.dart';
part '../visited_business/widgets/category_and_rating/rating.dart';
part '../visited_business/widgets/opening_hours/current_opening_hours_wdg.dart';
part '../visited_business/widgets/opening_hours/opening_hours.dart';
part '../visited_business/widgets/services/services.dart';
part '../visited_business/widgets/customer_reviews/customer_reviews.dart';
part '../visited_business/widgets/contact_channels/contact_channels.dart';
part '../visited_business/widgets/additional_info/additional_info.dart';

class VisitedBusinessPage extends StatefulWidget {
  const VisitedBusinessPage({super.key});

  @override
  State<VisitedBusinessPage> createState() => _VisitedBusinessPageState();
}

class _VisitedBusinessPageState extends State<VisitedBusinessPage> {
  late final DialogService _dialogService;

  @override
  void initState() {
    super.initState();
    _dialogService = di<DialogService>();
  }

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      key: const Key('business-page'),
      child: BlocListener<VisitBusinessCubit, VisitBusinessState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (vm) => _dialogService.showLoading(),
            loaded: (vm) => _dialogService.hideLoading(),
            error: (e, vm) async {
              _dialogService.hideLoading();
              await Future.delayed(Durations.long1)
                  .then((_) => context.mounted ? FoodlySnackbars.errorGeneric(context, e) : null);
            },
          );
        },
        child: Scaffold(
          persistentFooterButtons: const [VisitBusinessFooterButtons()],
          body: NestedScrollView(
            headerSliverBuilder: (_, value) => const [VisitBusinessSliverAppBar()],
            body: SingleChildScrollView(
              child: const Column(
                spacing: 34,
                children: [
                  _AddressWdg(key: Key('visited-business-address')),
                  _CategoryAndRatingWdg(key: Key('visited-business-category-and-rating')),
                  _AboutUsWdg(key: Key('visited-business-about-us')),
                  _OpeningHoursWdg(key: Key('visited-business-opening-hours')),
                  _ServicesWdg(key: Key('visited-business-services')),
                  _VisitorCustomerReviewsWdg(key: Key('visited-business-customer-reviews')),
                  _ContactChannelsWdg(key: Key('visited-business-contact-channels')),
                  _AdditionalInfoWdg(key: Key('visited-business-additional-info')),
                ],
              ).paddingSymmetric(
                horizontal: UIDimens.SCREEN_PADDING_MOB,
                vertical: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
