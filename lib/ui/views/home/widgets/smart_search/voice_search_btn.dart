part of '../main_search_widget.dart';

class VoiceSearchButton extends StatelessWidget {
  const VoiceSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmartSearchCubit, SmartSearchState>(
      builder: (context, state) {
        return Tooltip(
          message: S.current.askRecommendationsByYourVoice,
          child: ElevatedButton(
            onPressed: state.vm.smartSearchMode.isVoice
                ? null
                : () async {
                    if (state.vm.micPermissionDenied) {
                      if (context.mounted) SmartSearchSnackbars.showMicPermissionDenied(context);
                      return;
                    }

                    if (state.vm.smartSearchMode.isOff) {
                      if (context.mounted) SmartSearchSnackbars.showInputSearchWdg(context);
                    }

                    await Future.microtask(() {
                      if (context.mounted) {
                        context.read<SmartSearchCubit>().setVoiceSearchMode();
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
            child: const Icon(FontAwesome.microphone_lines_solid, size: 23),
          ),
        );
      },
    );
  }
}
