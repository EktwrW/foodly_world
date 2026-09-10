import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_icons_data.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// ¿Toca rail lateral o la barra de abajo de siempre?
///
/// Solo en tablet o desktop **apaisado**. En vertical la barra inferior sigue
/// siendo lo correcto: un rail cuesta ancho, y en apaisado lo que escasea es el
/// alto. En teléfono no se activa nunca, en ninguna orientación.
///
/// Pura para poder medirla sin levantar la home entera.
bool debeUsarNavigationRail({
  required bool esTablet,
  required bool esDesktop,
  required Orientation orientacion,
}) =>
    (esTablet || esDesktop) && orientacion == Orientation.landscape;

/// La navegación principal en tablet apaisado.
///
/// TRADUCCIÓN DEL SHELL DE MÓVIL (2026-09-06). La barra inferior tiene cuatro
/// iconos (0..3) y un FAB acoplado a la muesca del centro que es el destino 4,
/// la página principal. La traducción canónica de un FAB acoplado a un
/// [NavigationRail] es el hueco [NavigationRail.leading], así que aquí el iso
/// de Foodly va arriba y los cuatro iconos quedan como destinos.
///
/// Por eso [NavigationRail.selectedIndex] es `null` cuando el índice activo es
/// el 4: ese destino no está en la lista, se pinta en el propio FAB, que ya
/// cambia de versión según esté activo o no.
///
/// PRESENTACIONAL A PROPÓSITO: el `hasUnread` de la campana entra por parámetro
/// en vez de leerse aquí con un `BlocSelector` como hace la barra inferior. Así
/// se puede medir sin montar cubits ni inyección de dependencias.
///
/// OJO: la composición de los iconos (la tienda con su corazón, la campana con
/// su globo) está DUPLICADA respecto a `_FoodlyBottomNavBar._buildNavBarItem`.
/// Es deliberado: unificarlas obliga a tocar el camino de móvil, que está en
/// producción y todavía no se ha visto en un dispositivo. Cuando se verifique,
/// se juntan.
class FoodlyNavigationRail extends StatelessWidget {
  /// Índice activo del shell, de 0 a 4.
  final int activeIndex;

  /// Mismo callback que recibe la barra inferior, con los mismos índices.
  final ValueChanged<int> onTap;

  /// Si la campana lleva globo.
  final bool hasUnread;

  /// El FAB del iso de Foodly (destino 4).
  final Widget leading;

  const FoodlyNavigationRail({
    super.key,
    required this.activeIndex,
    required this.onTap,
    required this.leading,
    this.hasUnread = false,
  });

  /// Los cuatro iconos que sí son destinos del rail. El quinto (la página
  /// principal) vive en [leading].
  static int get destinos => UIIconsData.bottomNavigationIcons.length;

  /// El índice de la página principal, que no es un destino del rail.
  static const paginaPrincipal = 4;

  static const _inactivo = Color(0xBF000000); // negro al 75%, como la barra

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: activeIndex >= 0 && activeIndex < destinos ? activeIndex : null,
      onDestinationSelected: onTap,
      labelType: NavigationRailLabelType.none,
      backgroundColor: Colors.white,
      leading: leading.paddingSymmetric(vertical: 14),
      destinations: [
        for (var i = 0; i < destinos; i++)
          NavigationRailDestination(
            icon: _icono(i, activo: false),
            selectedIcon: _icono(i, activo: true),
            label: Text(_etiqueta(i)),
          ),
      ],
    );
  }

  String _etiqueta(int index) => switch (index) {
        0 => S.current.savedPromotions,
        1 => S.current.myFavorites,
        2 => S.current.socials,
        _ => S.current.notifications,
      };

  Widget _icono(int index, {required bool activo}) {
    final color = activo ? FoodlyThemes.primaryFoodly : _inactivo;
    final icono = UIIconsData.bottomNavigationIcons[index];

    // La tienda lleva su corazón encima, igual que en la barra inferior.
    if (icono == Bootstrap.shop_window) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Icon(icono, size: 24, color: color),
          Icon(
            Bootstrap.heart_fill,
            size: 14,
            color: activo ? FoodlyThemes.primaryFoodly : const Color(0xFF313030),
          ).paddingOnly(bottom: 16, left: 12),
        ],
      );
    }

    final base = Icon(icono, size: 24, color: color);

    if (index != 3) return base;

    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -2, end: -2),
      badgeStyle: const badges.BadgeStyle(
        badgeColor: FoodlyThemes.tertiaryFoodly,
        padding: EdgeInsets.all(6),
      ),
      badgeAnimation: const badges.BadgeAnimation.scale(),
      showBadge: hasUnread,
      child: base,
    );
  }
}
