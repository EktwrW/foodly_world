import 'package:animate_do/animate_do.dart' show FadeIn, FadeInRight, FadeOutRight;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart' show RatingBar;
import 'package:foodly_world/core/consts/foodly_assets.dart' show FoodlyAssets;
import 'package:foodly_world/core/extensions/category_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart' show SaveAndCancelButtons;
import 'package:foodly_world/ui/shared_widgets/cards/review_card.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart' show FoodlySectionsTitle;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart' show BusinessVM, DashboardEditing;
import 'package:foodly_world/ui/views/business/widgets/about_us/about_us.dart';
import 'package:foodly_world/ui/views/business/widgets/additional_info/additional_info.dart';
import 'package:foodly_world/ui/views/business/widgets/address/address.dart';
import 'package:foodly_world/ui/views/business/widgets/business_footer_buttons.dart';
import 'package:foodly_world/ui/views/business/widgets/business_sliver_app_bar.dart';
import 'package:foodly_world/ui/views/business/widgets/contact_channels/contact_channels.dart';
import 'package:foodly_world/ui/views/business/widgets/edit_cover_images_widgets/edit_cover_images_dialog.dart';
import 'package:foodly_world/ui/views/business/widgets/opening_hours/opening_hours.dart';
import 'package:foodly_world/ui/views/business/widgets/services/services.dart';

part 'widgets/customer_reviews/customer_reviews.dart';
part 'widgets/category_and_rating/category_and_rating.dart';
part 'widgets/category_and_rating/category.dart';
part 'widgets/category_and_rating/rating.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  late final DialogService _dialogService;
  late final BusinessBloc _bloc;

  @override
  void initState() {
    super.initState();

    _dialogService = di<DialogService>();
    _bloc = context.read<BusinessBloc>();

    if (_bloc.noCurrentBusiness) {
      _bloc.add(const BusinessEvent.started());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      key: const Key('business-page'),
      child: BlocConsumer<BusinessBloc, BusinessState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (vm) => _dialogService.showLoading(),
            updatingLogo: (vm) => _dialogService.showLoading(),
            updatingMenu: (vm) => _dialogService.showLoading(),
            loaded: (vm) => _dialogService.hideLoading(),
            showCoverImagesDialog: (_) {
              _dialogService.showCustomDialog(
                BlocProvider.value(value: _bloc, child: const EditCoverImagesDialog()),
                2,
              );
            },
            updatingPictures: (vm) => _dialogService.showLoading(),
            picturesUpdated: (vm) async =>
                await _popAndSuccessConfirmation(context, S.current.coverImagesSuccessfullyUpdated),
            pictureDeleted: (vm) => _dialogService.hideLoading(),
            editLocation: (vm) {
              _dialogService.showCustomDialog(
                BlocProvider.value(value: _bloc, child: const EditAddressDialog()),
                2,
              );
            },
            locationUpdated: (vm) async =>
                await _popAndSuccessConfirmation(context, S.current.locationSuccessfullyUpdated),
            error: (e, vm) async {
              _dialogService.hideLoading();
              await Future.delayed(Durations.long1)
                  .then((_) => context.mounted ? FoodlySnackbars.errorGeneric(context, e) : null);
            },
          );
        },
        builder: (context, state) {
          final vm = state.vm;

          return Scaffold(
            persistentFooterButtons: const [BusinessFooterButtons()],
            body: NestedScrollView(
              headerSliverBuilder: (_, value) => const [BusinessSliverAppBar()],
              body: SingleChildScrollView(
                child: Column(
                  spacing: 40,
                  children: [
                    const AddressWdg(),
                    const CategoryAndRatingWdg(),
                    AboutUsWdg(vm: vm),
                    OpeningHoursWdg(vm: vm),
                    ServicesWdg(vm: vm),
                    const CustomerReviewsWdg(),
                    ContactChannelsWdg(vm: vm),
                    AdditionalInfoWdg(vm: vm),
                  ],
                ).paddingSymmetric(
                  horizontal: UIDimens.SCREEN_PADDING_MOB,
                  vertical: 28,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _popAndSuccessConfirmation(BuildContext context, String text) async {
    Navigator.of(context).pop();
    _dialogService.hideLoading();
    // ignore: use_build_context_synchronously
    await Future.delayed(Durations.long1).then((_) => FoodlySnackbars.successGeneric(context, text));
  }
}
