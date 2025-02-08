part of '../main_search_widget.dart';

class VoiceSearchButton extends StatelessWidget {
  const VoiceSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceSearchCubit, VoiceSearchState>(
      builder: (context, state) {
        return Tooltip(
          message: S.current.askRecommendationsByYourVoice,
          child: ElevatedButton(
            onPressed: state.vm.smartSearchMode.isVoice
                ? null
                : () async {
                    if (state.vm.smartSearchMode.isText) {
                      if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }

                    await Future.microtask(() {
                      if (context.mounted) {
                        context.read<VoiceSearchCubit>()
                          ..setVoiceSearchMode()
                          ..startListening();
                      }
                    });

                    if (context.mounted) VoiceSearchSnackbars.showInputSearchWdg(context);
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
