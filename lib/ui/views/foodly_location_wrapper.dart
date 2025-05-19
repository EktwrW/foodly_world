import 'package:foodly_world/core/services/dependency_injection_service.dart';

class FoodlyLocationWrapper extends StatefulWidget {
  final Widget childWidget;

  const FoodlyLocationWrapper({super.key, required this.childWidget});

  @override
  State<FoodlyLocationWrapper> createState() => _FoodlyLocationWrapperState();
}

class _FoodlyLocationWrapperState extends State<FoodlyLocationWrapper> {
  late final LocationService _locationService;
  late final DialogService _dialogService;

  @override
  void initState() {
    super.initState();
    _locationService = di<LocationService>();
    _dialogService = di<DialogService>();

    if (_locationService.mustFetchLocation) {
      context.read<LocationBloc>().add(const LocationEvent.checkLocation());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        state.whenOrNull(
          checkingLocation: () => mounted ? _dialogService.showLoading() : null,
          locationChecked: (locationDM) {
            _locationService.updateLocation(locationDM);

            final favsState = context.read<FavoritesCubit>().state;

            if (favsState == FavoritesState.loaded(favsState.vm)) {
              if (mounted) _dialogService.hideLoading();
              FlutterNativeSplash.remove();
            }
          },
        );
      },
      builder: (context, state) => state.maybeWhen(
        locationChecked: (locationDM) => _buildContent(),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildContent() => BlocListener<FavoritesCubit, FavoritesState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (vm) async {
              if (!_locationService.mustFetchLocation) {
                if (mounted) _dialogService.hideLoading();
                FlutterNativeSplash.remove();
              } else {
                await Future.delayed(const Duration(seconds: 10), () {
                  if (mounted) _dialogService.hideLoading();
                  FlutterNativeSplash.remove();
                });
              }
            },
          );
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.screenHeight,
            width: context.screenWidth,
            child: widget.childWidget,
          ),
        ),
      );
}
