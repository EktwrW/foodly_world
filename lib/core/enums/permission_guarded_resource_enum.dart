/// Módulos de la app con guard de permisos por rol.
///
/// El módulo de cada ruta guardada se declara EXPLÍCITO al registrarla en
/// app_router (parámetro `access:` de `_getRedirectors`). No existe lookup
/// por nombre de ruta: el mapa string→módulo anterior permitía registrar una
/// ruta guardada sin mapearla (caía a un `unknown` que negaba todo y mandaba
/// a /no-access — bug e2e de "Órdenes en vivo"), y además matcheaba por
/// substring (una ruta `menu` matcheaba la key `manageMenu`). Con el módulo
/// como parámetro del redirector, ese gap es imposible por construcción.
enum ModuleGuardType {
  accountSettings,
  home,
  menu,
  business,
}
