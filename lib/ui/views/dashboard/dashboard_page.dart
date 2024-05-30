import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/about_us/about_us.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/additional_info/additional_info.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/business_services/business_services.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/category_and_rating/category_and_rating.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/contact_channels/contact_channels.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/customer_reviews/customer_reviews.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_address.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_footer_buttons.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_sliver_app_bar.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/edit_cover_images_widgets/edit_cover_images_dialog.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/opening_hours/opening_hours.dart';

//import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();

    final bloc = context.read<DashboardBloc>();
    if (bloc.noCurrentBusiness) {
      bloc.add(const DashboardEvent.started());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) => di<DialogService>().showLoading(),
          updatingLogo: (vm) => di<DialogService>().showLoading(),
          updatingMenu: (vm) => di<DialogService>().showLoading(),
          loaded: (vm) => di<DialogService>().hideLoading(),
          showCoverImagesDialog: (_) => di<DialogService>().showCustomDialog(const EditCoverImagesDialog(), 2),
          updatingPictures: (vm) => di<DialogService>().showLoading(),
          picturesUpdated: (vm) async {
            Navigator.of(context).pop();
            di<DialogService>().hideLoading();
            await Future.delayed(Durations.long1)
                .then((_) => FoodlySnackbars.successGeneric(context, S.current.coverImagesSuccessfullyUpdated));
          },
          pictureDeleted: (vm) => di<DialogService>().hideLoading(),
          error: (e, vm) async {
            di<DialogService>().hideLoading();
            await Future.delayed(Durations.long1).then((_) => FoodlySnackbars.errorGeneric(context, e));
          },
        );
      },
      builder: (context, state) {
        final vm = state.vm;
        final dasboardSections = [
          AddressWdg(vm: vm),
          CategoryAndRatingWdg(vm: vm),
          AboutUsWdg(vm: vm),
          OpeningHoursWdg(vm: vm),
          BusinessServicesWdg(vm: vm),
          CustomerReviewsWdg(vm: vm),
          ContactChannelsWdg(vm: vm),
          AdditionalInfoWdg(vm: vm),
        ];

        return Scaffold(
          persistentFooterButtons: const [DashboardFooterButtons()],
          body: NestedScrollView(
            headerSliverBuilder: (_, value) => [const DashboardSliverAppBar()],
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
}
