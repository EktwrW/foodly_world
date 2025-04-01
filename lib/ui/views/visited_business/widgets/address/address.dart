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
          Row(
            children: [
              const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16).paddingLeft(6),
              Expanded(
                child: BlocSelector<VisitBusinessCubit, VisitBusinessState, String>(
                  selector: (state) => state.vm.currentBusiness?.fullAddress ?? '',
                  builder: (context, fullAddress) => Text(
                    fullAddress,
                    maxLines: 5,
                    style: FoodlyTextStyles.bodyWhiteSemibold,
                  ),
                ).paddingLeft(8),
              ),
            ],
          ).paddingAll(6),
        ],
      ),
    );
  }
}
