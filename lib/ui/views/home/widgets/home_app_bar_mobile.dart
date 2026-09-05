import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/main.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/greeting_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/main_search_widget.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

class Home369AppBarMobile extends StatelessWidget {
  const Home369AppBarMobile({
    super.key,
  });

  /// Hueco entre el borde inferior del degradado y el final del sliver.
  /// Es lo que la sombra necesita para desvanecerse sin que la recorten.
  static const double _bottomMargin = 16;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 149,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      backgroundColor: Colors.transparent,
      toolbarHeight: 85,
      leadingWidth: 0,
      collapsedHeight: 149,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            expandedTitleScale: 1,
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.zero,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Saludo y pregunta en la misma columna, los dos a la
                    // izquierda. Antes el saludo iba a la izquierda y la
                    // pregunta centrada, así que el eje cambiaba dos veces en
                    // 149 px.
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GreetingWidget(
                            // Invitado (5.1.1.v): no hay nombre → saludamos con
                            // un placeholder localizado ("Invitado"/"Guest"/
                            // "Visitante") para mantener el saludo completo y la
                            // armonía del header.
                            userName: di<AuthSessionService>().isGuest
                                ? S.current.guestUserName
                                : di<AuthSessionService>().userSessionDM?.user.firstName?.split(' ').first,
                          ),
                          Text(
                            S.current.whatAreYouCravingToday,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FoodlyTextStyles.homeGreetingSubtitle,
                          ).paddingTop(2),
                        ],
                      ),
                    ),
                    // Circular, como el otro botón que abre el drawer (el del
                    // avatar en `sliver_app_bar_animations.dart`), pero en
                    // ciruela sólido: es el único control de navegación del
                    // header y sobre el fondo claro un círculo blanco no se
                    // separaba de nada. El icono es el mismo de siempre.
                    const _DrawerButton().paddingHorizontal(6),
                  ],
                ).paddingOnly(left: 12, right: 6, bottom: 2),
                // 26 = `_bottomMargin` (24) menos los 6 de padding interno del
                // propio SearchWidget, más los 8 de aire hasta el borde del
                // degradado. Sube con el margen; ver el comentario del fondo.
                const SearchWidget().paddingBottom(20),
              ],
            ),
            background: Container(
              margin: const EdgeInsets.only(bottom: _bottomMargin),
              decoration: const BoxDecoration(
                gradient: UIDecorations.HOME_APP_BAR_GRADIENT,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(color: Color(0x123B0A2C), blurRadius: 6, offset: Offset(0, 2)),
                  // Alcance hacia abajo: 8 + 22 − 10 = 20, dentro de los 24.
                  BoxShadow(color: Color(0x613B0A2C), blurRadius: 12, spreadRadius: -6, offset: Offset(0, 6)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton();

  static const _diameter = 47.0;

  @override
  Widget build(BuildContext context) {
    // Sin tooltip, como estaba: `S.current.menu` es "Menú" y acá significaría
    // la carta del negocio, no el menú de navegación. No vale la pena una
    // clave nueva por un texto que casi nadie ve.
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        width: _diameter,
        height: _diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: UIDecorations.glassmorphicCenterPurpleGradient,
          boxShadow: [
            const BoxShadow(color: Color(0xB379005D), blurRadius: 16, spreadRadius: -6, offset: Offset(0, 6)),
          ],
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => FoodlyMainScaffold.toggleDrawer(),
          child: const Center(
            child: Icon(Bootstrap.menu_button_wide_fill, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}
