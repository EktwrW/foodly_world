import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Caché de disco única para TODAS las imágenes remotas de la app.
///
/// Por qué no vale `DefaultCacheManager` (2026-09-03): guarda como mucho 200
/// objetos y los da por viejos a los 7 días. Entre menús, promos, portadas y
/// avatares, 200 se desalojan en un par de sesiones y las fotos se vuelven a
/// bajar. Y como el bucket servía `max-age=3600`, cada hora TODAS las fotos
/// de un menú contaban como caducadas. El bucket sirve ahora las imágenes con
/// caché inmutable de un año (los nombres son aleatorios por subida y nunca
/// cambian de contenido), así que guardar 1000 durante 30 días es seguro:
/// una foto reemplazada llega con URL nueva, nunca con la misma.
///
/// Widget y provider tienen que usar el MISMO gestor: si la precarga escribe
/// en uno y `CachedNetworkImage` lee de otro, se descarga dos veces.
class FoodlyImageCache {
  FoodlyImageCache._();

  static const String key = 'foodlyImages';

  static final CacheManager manager = _FoodlyCacheManager();
}

/// Con `ImageCacheManager`, como `DefaultCacheManager`: sin el mixin,
/// `maxWidthDiskCache` / `maxHeightDiskCache` se ignorarían en silencio en
/// release (solo hay un assert en debug).
class _FoodlyCacheManager extends CacheManager with ImageCacheManager {
  _FoodlyCacheManager()
      : super(
          Config(
            FoodlyImageCache.key,
            stalePeriod: const Duration(days: 30),
            maxNrOfCacheObjects: 1000,
          ),
        );
}
