import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/business/widgets/about_us/about_us.dart';
import 'package:foodly_world/ui/views/business/widgets/additional_info/additional_info.dart';
import 'package:foodly_world/ui/views/business/widgets/address/address.dart';
import 'package:foodly_world/ui/views/business/widgets/business_footer_buttons.dart';
import 'package:foodly_world/ui/views/business/widgets/business_sliver_app_bar.dart';
import 'package:foodly_world/ui/views/business/widgets/category_and_rating/category_and_rating.dart';
import 'package:foodly_world/ui/views/business/widgets/contact_channels/contact_channels.dart';
import 'package:foodly_world/ui/views/business/widgets/customer_reviews/customer_reviews.dart';
import 'package:foodly_world/ui/views/business/widgets/edit_cover_images_widgets/edit_cover_images_dialog.dart';
import 'package:foodly_world/ui/views/business/widgets/opening_hours/opening_hours.dart';
import 'package:foodly_world/ui/views/business/widgets/services/services.dart';

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
                    CategoryAndRatingWdg(vm: vm),
                    AboutUsWdg(vm: vm),
                    OpeningHoursWdg(vm: vm),
                    ServicesWdg(vm: vm),
                    CustomerReviewsWdg(vm: vm),
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
    await Future.delayed(Durations.long1).then((_) => FoodlySnackbars.successGeneric(context, text));
  }
}
