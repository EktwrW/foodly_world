part of '../main_search_widget.dart';

class TextSmartSearchButton extends StatelessWidget {
  const TextSmartSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmartSearchCubit, SmartSearchState>(
      builder: (context, state) {
        return Tooltip(
          message: S.current.askRecommendationsByTextSmart,
          child: ElevatedButton(
            onPressed: state.vm.smartSearchMode.isText
                ? null
                : () async {
                    final cubit = context.read<SmartSearchCubit>();

                    if (state.vm.smartSearchMode.isOff) {
                      if (context.mounted) SmartSearchSnackbars.showInputSearchWdg(context);
                    }

                    await Future.microtask(() async {
                      if (context.mounted) {
                        cubit.setTextSearchMode();
                      }
                    });
                  },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white.withValues(alpha: .62)),
              elevation: const WidgetStatePropertyAll(0),
              shadowColor: const WidgetStatePropertyAll(Colors.transparent),
              padding: const WidgetStatePropertyAll(EdgeInsets.zero),
              fixedSize: const WidgetStatePropertyAll(Size(52, 44)),
              minimumSize: const WidgetStatePropertyAll(Size(52, 44)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.white.withValues(alpha: .85)),
                ),
              ),
            ),
            // CORRECCIÓN ÓPTICA, no de layout. El botón ya centra a su hijo
            // —envolverlo en un `Center` no cambia nada, medido—; lo que está
            // descentrado es la TINTA del glifo dentro de su propio cuadro em:
            // renderizado a 10× y midiendo la caja de tinta, `FontAwesome
            // .keyboard` cae 0,7 px a la derecha y 0,5 px abajo del centro, a
            // tamaño 23. El del micrófono mide 0,0 y por eso no lleva nada.
            //
            // El código anterior compensaba esto con padding asimétrico
            // (izq. 6, der. 9), que empujaba 1,5 px: corregía de más y en el
            // sentido contrario. Se hace con `Transform` para no tocar ni el
            // tamaño ni el área táctil.
            child: Transform.translate(
              offset: const Offset(-0.7, -0.5),
              child: const Icon(
                FontAwesome.keyboard,
                size: 23,
              ),
            ),
          ),
        );
      },
    );
  }
}
