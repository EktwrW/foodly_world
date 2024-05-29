import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:foodly_world/core/blocs/location/location_bloc.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';

class FoodlyLocationWrapper extends StatefulWidget {
  final Widget childWidget;

  const FoodlyLocationWrapper({super.key, required this.childWidget});

  @override
  State<FoodlyLocationWrapper> createState() => _FoodlyLocationWrapperState();
}

class _FoodlyLocationWrapperState extends State<FoodlyLocationWrapper> {
  @override
  void initState() {
    super.initState();
    if (di<LocationService>().mustFetchLocation) {
      context.read<LocationBloc>().add(const LocationEvent.checkLocation());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        state.whenOrNull(
          checkingLocation: () => mounted ? di<DialogService>().showLoading() : null,
          locationChecked: (locationDM) {
            di<LocationService>().updateLocation(locationDM);
            if (mounted) di<DialogService>().hideLoading();
            FlutterNativeSplash.remove();
          },
        );
      },
      builder: (context, state) => _buildContent(),
    );
  }

  Widget _buildContent() => SingleChildScrollView(
        child: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: widget.childWidget,
        ),
      );
}
