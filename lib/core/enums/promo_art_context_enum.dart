import 'package:foodly_world/core/enums/promo_image_style_enum.dart';

/// Contexto visual de la imagen generada para una promoción.
///
/// Lo elige el manager en el snackbar de creación, junto con el estilo
/// ([PromoImageStyle]) y el permiso de mostrar personas. Antes el backend
/// generaba varias artes distintas y el manager elegía a posteriori, pero cada
/// arte era una request separada contra Replicate y por lo tanto un cupo del
/// rate limit: con la cuenta sin método de pago eso costaba ~10 s de espera
/// por arte. Moviendo la decisión al manager, el backend hace una sola request
/// con dos salidas — un cupo, ~19 s.
///
/// El [value] viaja al BE en `POST /promotions/ai-generate` y tiene que seguir
/// coincidiendo con el `in:evento,producto,escena` de la validación allá.
enum PromoArtContext {
  /// La promoción como ocasión: la mesa en pleno brindis, la energía del lugar.
  evento('evento'),

  /// El producto en primer plano, en pleno servicio. Es el default.
  producto('producto'),

  /// La mesa servida en su entorno, con contexto y profundidad.
  escena('escena');

  const PromoArtContext(this.value);

  final String value;
}

/// Todo lo que el manager configura antes de generar la imagen de una promo.
///
/// Un record con nombres en vez de una tupla posicional: son cuatro campos y
/// `(true, natural, producto, false)` en el call-site no dice nada.
typedef AiPromoImageOptions = ({
  /// Si se genera imagen. En false el BE devuelve sólo el copy.
  bool generate,
  PromoImageStyle style,
  PromoArtContext context,

  /// Si la escena puede mostrar comensales. Cuando está en true el backend
  /// pide siempre gente de espaldas o sin la cara a la vista — nunca un rostro
  /// nítido, que es donde estos modelos fallan (ojos deformes, seis dedos).
  bool people,
});
