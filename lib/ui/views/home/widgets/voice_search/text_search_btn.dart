part of '../main_search_widget.dart';

class TextSmartSearchButton extends StatelessWidget {
  const TextSmartSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceSearchCubit, VoiceSearchState>(
      builder: (context, state) {
        return Tooltip(
          message: 'Ask recommendations by text smart',
          child: ElevatedButton(
            onPressed: state.vm.smartSearchMode.isText
                ? null
                : () async {
                    final cubit = context.read<VoiceSearchCubit>();

                    if (state.vm.smartSearchMode.isVoice) {
                      if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      // await Future.delayed(Durations.short3);
                      await cubit.resetToInitial();
                    }

                    await Future.microtask(() async {
                      if (context.mounted) {
                        cubit.setTextSearchMode();
                        // await Future.delayed(Durations.short3);
                      }
                    });

                    if (context.mounted) VoiceSearchSnackbars.showInputSearchWdg(context);
                  },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              padding: WidgetStatePropertyAll(EdgeInsets.all(6)),
            ),
            child: const Icon(Iconsax.text_outline, size: 24),
          ),
        );
      },
    );
  }
}
