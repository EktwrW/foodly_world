/// Estilo visual de la imagen generada para una promoción.
///
/// Reemplaza al enum que venía del SDK del proveedor de texto anterior. Ese
/// paquete se sacó del `pubspec.yaml` cuando la generación se movió al
/// backend (2026-08-18) y con él desaparecía el enum, que se usa en el
/// `SegmentedButton` del snackbar de creación de promos.
///
/// El [value] es lo que viaja al BE en `POST /promotions/ai-generate` y lo
/// consume `ReplicateImageService::buildPrompt`. Los nombres tienen que
/// seguir coincidiendo con el `in:natural,vivid` de la validación allá.
enum PromoImageStyle {
  natural('natural'),
  vivid('vivid');

  const PromoImageStyle(this.value);

  final String value;
}
