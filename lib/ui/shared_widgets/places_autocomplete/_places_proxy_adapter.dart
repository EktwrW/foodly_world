import 'package:foodly_world/data_models/places_proxy/place_address_component_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_geometry_dm.dart';
import 'package:nova_places_api/nova_places_api.dart' as nova;

/// Adapter interno **temporal** `PlaceDM → nova.Place`.
///
/// **Rol quirúrgico:** vive UNICAMENTE para que `PlacesAutocompleteWdg` pueda
/// disparar su callback `onPickedPlaceDetail: ValueChanged<nova.Place>` cuando
/// la ruta proxy está activa. Los consumers (location_service, sign_up_cubit,
/// user_profile_cubit, dashboard_helpers) siguen leyendo `nova.Place` sin
/// cambios — cascada completa a `PlaceDM` se pospone a Fase 6.
///
/// **Por qué no convertir predictions:** la clase
/// `nova.PlaceAutocompletePrediction` tiene campos required complejos
/// (`matchedSubstrings`, `structuredFormatting`, `terms`) cuyos subtypes no
/// valen la pena de fabricar desde un `PlacePredictionDM` que no los trae. En
/// la ruta proxy el overlay renderiza DMs directo y el callback `onPicked`
/// (logger-only en el wrapper foodly) no se dispara — la decisión se
/// documenta en el call-site del widget.
///
/// **Contrato de mapeo (superficie leída por consumers, grep `geometry.location.lat`,
/// `addressComponents`, `formattedAddress`, `name`, `placeId`,
/// `formattedPhoneNumber`):**
///
///   | Campo DM                          | Campo nova.Place                       |
///   |-----------------------------------|-----------------------------------------|
///   | `placeId`                         | `placeId`                               |
///   | `name`                            | `name`                                  |
///   | `formattedAddress`                | `formattedAddress`                      |
///   | `formattedPhoneNumber`            | `formattedPhoneNumber`                  |
///   | `addressComponents` `(List<DM>)`  | `addressComponents` `(List<nova.AC>?)`  |
///   | `geometry` `(DM?)`                | `geometry` `(nova.Geometry?)`           |
///
/// **Detalle crítico — `nova.AddressComponent` requiere TODOS sus campos
/// (longName, shortName, types) como non-null.** Nuestro `PlaceAddressComponentDM`
/// los tiene igual de required con default `[]` para `types`, así que el
/// mapeo es 1:1 trivial — no hay branch defensivo porque el parse previo del
/// DM ya garantiza que esos campos existen.
///
/// **Detalle crítico — `nova.Geometry.viewport` es NON-NULL (required Bounds).**
/// Nuestro `PlaceGeometryDM.viewport` es nullable (Google lo omite en algunos
/// Place Details). Cuando falta, construimos un "viewport degenerado" donde
/// NE == SW == `location` — satisface el contrato de nova sin inventar un
/// bounds que no tenemos. Ningún consumer actual lee `viewport` (grep -r
/// `\.viewport\.` → 0 hits fuera de `nova_places_api` y este adapter), así
/// que el valor degenerado no tiene efecto observable. Si en Fase 6 algún
/// consumer empieza a leerlo, hay que revisar este default.
///
/// **Por qué empty-list → null en `addressComponents`:** nova inicializa
/// `addressComponents` como `null` cuando Google no manda nada; preservamos
/// ese sentinel para que los consumers que hacen `addressComponents?.firstWhereOrNull`
/// sigan con la misma semántica (null-propagate en lugar de empty-list-ops).
/// Una lista vacía en vez de null cambiaría el comportamiento del
/// firstWhereOrNull extension (ambos devuelven null, así que en práctica es
/// equivalente, pero preservamos la forma nova por prolijidad del adapter).
///
/// **Throwaway:** este archivo se borra en Fase 6 junto con `nova_places_api`
/// y la cascada a DMs en los consumers. No expandirlo con features nuevos —
/// si un consumer necesita más campos del Place, que se migre a PlaceDM
/// antes de Fase 6.
nova.Place novaPlaceFromDM(PlaceDM dm) {
  return nova.Place(
    placeId: dm.placeId,
    name: dm.name,
    formattedAddress: dm.formattedAddress,
    formattedPhoneNumber: dm.formattedPhoneNumber,
    addressComponents: _novaAddressComponents(dm.addressComponents),
    geometry: _novaGeometry(dm.geometry),
  );
}

/// Mapea la lista de address components DM a la lista de nova.
///
/// Devuelve `null` si la lista está vacía para preservar la convención nova
/// (ver docblock de clase). Consumers defensivos (`.?firstWhereOrNull`) se
/// comportan igual en ambos casos, pero mantenemos la forma original.
List<nova.AddressComponent>? _novaAddressComponents(
  List<PlaceAddressComponentDM> components,
) {
  if (components.isEmpty) return null;
  return components
      .map((c) => nova.AddressComponent(
            longName: c.longName,
            shortName: c.shortName,
            types: c.types,
          ))
      .toList(growable: false);
}

/// Mapea `PlaceGeometryDM?` a `nova.Geometry?`.
///
/// Devuelve `null` si el DM trae `geometry == null` (caso defensivo: Google
/// siempre manda geometry pero el DM lo deja nullable por legado del bug
/// Fase 1 de coords perdidas).
///
/// Si el DM no trae viewport, construye uno degenerado NE=SW=location. Ver
/// docblock de clase para el porqué de aceptar un default degenerado.
nova.Geometry? _novaGeometry(PlaceGeometryDM? dm) {
  if (dm == null) return null;

  final location = nova.LatLngLiteral(
    lat: dm.location.lat,
    lng: dm.location.lng,
  );

  final viewport = dm.viewport != null
      ? nova.Bounds(
          northeast: nova.LatLngLiteral(
            lat: dm.viewport!.northeast?.lat ?? dm.location.lat,
            lng: dm.viewport!.northeast?.lng ?? dm.location.lng,
          ),
          southwest: nova.LatLngLiteral(
            lat: dm.viewport!.southwest?.lat ?? dm.location.lat,
            lng: dm.viewport!.southwest?.lng ?? dm.location.lng,
          ),
        )
      : nova.Bounds(
          // Viewport degenerado — ver docblock de clase. Consumers actuales
          // no leen viewport; el valor sólo satisface el contrato non-null
          // de nova.Geometry.viewport.
          northeast: location,
          southwest: location,
        );

  final bounds = dm.bounds != null
      ? nova.Bounds(
          northeast: nova.LatLngLiteral(
            lat: dm.bounds!.northeast?.lat ?? dm.location.lat,
            lng: dm.bounds!.northeast?.lng ?? dm.location.lng,
          ),
          southwest: nova.LatLngLiteral(
            lat: dm.bounds!.southwest?.lat ?? dm.location.lat,
            lng: dm.bounds!.southwest?.lng ?? dm.location.lng,
          ),
        )
      : null;

  return nova.Geometry(
    location: location,
    viewport: viewport,
    bounds: bounds,
    locationType: dm.locationType,
  );
}
