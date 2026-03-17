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
                        context.read<SmartSearchCubit>()
                          ..setVoiceSearchMode()
                          ..startListening();
                      }
                    });
                  },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              padding: WidgetStatePropertyAll(EdgeInsets.all(6)),
            ),
            child: const Icon(Iconsax.microphone_2_outline, size: 24),
          ),
        );
      },
    );
  }
}
