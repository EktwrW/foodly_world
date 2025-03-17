import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
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
import 'package:foodly_world/ui/views/foodly_wrapper.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  late final DialogService _dialogService;

  @override
  void initState() {
    super.initState();

    _dialogService = di<DialogService>();

    final bloc = context.read<BusinessBloc>();
    if (bloc.noCurrentBusiness) {
      bloc.add(const BusinessEvent.started());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FoodlyWrapper(
      child: BlocConsumer<BusinessBloc, BusinessState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: (vm) => _dialogService.showLoading(),
            updatingLogo: (vm) => _dialogService.showLoading(),
            updatingMenu: (vm) => _dialogService.showLoading(),
            loaded: (vm) => _dialogService.hideLoading(),
            showCoverImagesDialog: (_) => _dialogService.showCustomDialog(const EditCoverImagesDialog(), 2),
            updatingPictures: (vm) => _dialogService.showLoading(),
            picturesUpdated: (vm) async =>
                await _popAndSuccessConfirmation(context, S.current.coverImagesSuccessfullyUpdated),
            pictureDeleted: (vm) => _dialogService.hideLoading(),
            editLocation: (vm) => _dialogService.showCustomDialog(const EditAddressDialog(), 2),
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
          final dasboardSections = [
            const AddressWdg(),
            CustomNeumorphicButton(
              onPressed: () {},
              text: S.current.requestReservation,
              tooltip: '',
              shape: ui.NeumoShape.concave,
              disabled: !vm.loggedUserCanEdit,
              type: CustomNeumorphicBtnType.outlined,
              leading: const Icon(Icons.table_restaurant, size: 22),
              margin: const EdgeInsets.only(bottom: 20),
            ),
            CategoryAndRatingWdg(vm: vm),
            AboutUsWdg(vm: vm),
            OpeningHoursWdg(vm: vm),
            ServicesWdg(vm: vm),
            CustomerReviewsWdg(vm: vm),
            ContactChannelsWdg(vm: vm),
            AdditionalInfoWdg(vm: vm),
          ];

          return Scaffold(
            persistentFooterButtons: const [BusinessFooterButtons()],
            body: NestedScrollView(
              headerSliverBuilder: (_, value) => const [BusinessSliverAppBar()],
              body: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: UIDimens.SCREEN_PADDING_MOB,
                  vertical: 28,
                ),
                itemCount: dasboardSections.length,
                itemBuilder: (_, i) => dasboardSections[i],
                separatorBuilder: (_, i) => const SizedBox(height: 40),
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
    await Future.delayed(Durations.long1)
        .then((_) => context.mounted ? FoodlySnackbars.successGeneric(context, text) : null);
  }
}
