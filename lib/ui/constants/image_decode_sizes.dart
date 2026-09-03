/// Anchos de decodificación (`memCacheWidth`) para imágenes que se pintan
/// pequeñas. Vive en `ui/constants` y no en un cubit: lo usan el menú
/// visitado, la gestión del menú y el menú público (superficie web sin sesión).
///
/// Fotos de las tarjetas de menú: se pintan a ~100 px; 400 cubre pantallas
/// @3x sin decodificar los 1280 px del original (~5 MB por foto).
const int menuCardMemCacheWidth = 400;
