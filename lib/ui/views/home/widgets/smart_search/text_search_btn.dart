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
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              padding: WidgetStatePropertyAll(EdgeInsets.all(6)),
            ),
            child: const Icon(
              FontAwesome.keyboard,
              size: 23,
            ),
          ),
        );
      },
    );
  }
}
