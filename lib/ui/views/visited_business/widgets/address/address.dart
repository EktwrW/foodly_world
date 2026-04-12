part of '../../visit_business_page.dart';

class _AddressWdg extends StatelessWidget {
  const _AddressWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: FoodlyThemes.tertiaryFoodly,
      child: Column(
        children: [
          BlocSelector<VisitBusinessCubit, VisitBusinessState, (double?, double?, Set<Marker>)>(
            selector: (state) {
              final business = state.vm.currentBusiness;

              return (business?.latitude, business?.longitude, state.vm.markers);
            },
            builder: (context, positionRecord) {
              if (positionRecord.$1 == null || positionRecord.$2 == null) return const SizedBox.shrink();

              return AspectRatio(
                aspectRatio: 2.6,
                child: GoogleMap(
                  key: const Key('visit-business-map'),
                  mapToolbarEnabled: false,
                  onMapCreated: (controller) => context.read<VisitBusinessCubit>().setMapcontroller(controller),
                  liteModeEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      positionRecord.$1!,
                      positionRecord.$2!,
                    ),
                    zoom: 16.0,
                  ),
                  markers: positionRecord.$3,
                ),
              );
            },
          ),
          BlocSelector<VisitBusinessCubit, VisitBusinessState, (String, double?, double?)>(
            selector: (state) {
              final b = state.vm.currentBusiness;
              return (b?.fullAddress ?? '', b?.latitude, b?.longitude);
            },
            builder: (context, record) {
              final (fullAddress, lat, lng) = record;

              return Row(
                children: [
                  const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16).paddingLeft(6),
                  Expanded(
                    child: Text(
                      fullAddress,
                      maxLines: 5,
                      style: FoodlyTextStyles.bodyWhiteSemibold,
                    ).paddingLeft(8),
                  ),
                  if (lat != null && lng != null) ...[
                    IconButton(
                      onPressed: () => UrlLauncher.launchWazeDirections(lat, lng),
                      tooltip: 'Waze',
                      icon: Brand(Brands.waze, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        minimumSize: const Size(36, 36),
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: () => UrlLauncher.launchGoogleMapsDirections(lat, lng),
                      tooltip: 'Google Maps',
                      icon: Brand(Brands.google_maps_old, size: 20),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        minimumSize: const Size(36, 36),
                      ),
                    ),
                  ],
                ],
              ).paddingAll(6);
            },
          ),
        ],
      ),
    );
  }
}
