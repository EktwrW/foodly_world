import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// El QR de Foodly: tarjeta blanca, borde y sombra suaves en el morado de
/// marca, y ojos y módulos redondos del mismo color.
///
/// Estaba escrito cuatro veces con tres estilos distintos —invitar a una orden,
/// compartir menú (cliente), compartir menú (manager) y el póster descargable—
/// y solo el de la orden tenía tarjeta; los dos de compartir menú eran el
/// `QrImageView` pelado, en negro cuadrado. Acá vive uno solo.
class FoodlyQrCard extends StatelessWidget {
  const FoodlyQrCard({
    super.key,
    required this.data,
    this.size = 190,
    this.borderRadius = 20,
  });

  /// Lo que codifica el QR, normalmente una URL.
  final String data;

  /// Lado del QR **sin** la tarjeta. El ancho real es `size + chrome`.
  final double size;

  final double borderRadius;

  static const _padding = 14.0;

  /// Lo que la tarjeta suma al lado del QR. Quien tenga que caber en un `Row`
  /// lo resta de su ancho en vez de adivinar y desbordar.
  static const chrome = _padding * 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      // `backgroundColor` explícito: el QR se lee por contraste, y heredar el
      // fondo del tema lo dejaría gris en modo oscuro. El morado sobre blanco
      // da 10.65:1, de sobra para cualquier lector, también impreso.
      child: QrImageView(
        data: data,
        size: size,
        backgroundColor: Colors.white,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.circle,
          color: FoodlyThemes.primaryFoodly,
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle,
          color: FoodlyThemes.primaryFoodly,
        ),
      ),
    );
  }
}
