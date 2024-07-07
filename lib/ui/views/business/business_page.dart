import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
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

//import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<BusinessBloc>();
    if (bloc.noCurrentBusiness) {
      bloc.add(const BusinessEvent.started());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessBloc, BusinessState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) => di<DialogService>().showLoading(),
          updatingLogo: (vm) => di<DialogService>().showLoading(),
          updatingMenu: (vm) => di<DialogService>().showLoading(),
          loaded: (vm) => di<DialogService>().hideLoading(),
          showCoverImagesDialog: (_) => di<DialogService>().showCustomDialog(const EditCoverImagesDialog(), 2),
          updatingPictures: (vm) => di<DialogService>().showLoading(),
          picturesUpdated: (vm) async =>
              await popAndSuccessConfirmation(context, S.current.coverImagesSuccessfullyUpdated),
          pictureDeleted: (vm) => di<DialogService>().hideLoading(),
          editLocation: (vm) => di<DialogService>().showCustomDialog(const EditAddressDialog(), 2),
          locationUpdated: (vm) async =>
              await popAndSuccessConfirmation(context, S.current.locationSuccessfullyUpdated),
          error: (e, vm) async {
            di<DialogService>().hideLoading();
            await Future.delayed(Durations.long1).then((_) => FoodlySnackbars.errorGeneric(context, e));
          },
        );
      },
      builder: (context, state) {
        final vm = state.vm;
        final dasboardSections = [
          const AddressWdg(),
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
            headerSliverBuilder: (_, value) => [const BusinessSliverAppBar()],
            body: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: UIDimens.SCREEN_PADDING_MOB,
                vertical: 28,
              ),
              itemCount: dasboardSections.length,
              itemBuilder: (_, i) => dasboardSections[i],
              separatorBuilder: (_, i) => const SizedBox(height: 30),
            ),
          ),
        );
      },
    );
  }

  Future<void> popAndSuccessConfirmation(BuildContext context, String text) async {
    Navigator.of(context).pop();
    di<DialogService>().hideLoading();
    await Future.delayed(Durations.long1).then((_) => FoodlySnackbars.successGeneric(context, text));
  }
}
