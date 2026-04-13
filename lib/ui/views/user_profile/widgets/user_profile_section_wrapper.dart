part of '../user_profile_page.dart';

class _UserProfileSectionWdg extends StatelessWidget {
  const _UserProfileSectionWdg({
    super.key,
    required this.editingWidget,
    required this.readOnlyWidget,
    required this.editing,
    required this.titleFirstText,
    required this.titleSecondText,
    this.footerText,
    this.onEditBtnPressed,
  });

  final Widget editingWidget;
  final Widget readOnlyWidget;
  final bool editing;
  final String titleFirstText;
  final String titleSecondText;
  final String? footerText;
  final void Function()? onEditBtnPressed;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topLeft,
      duration: Durations.medium4,
      child: SizedBox(
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodlySectionsTitle(
              firstText: titleFirstText,
              secondText: titleSecondText,
              onPressed: onEditBtnPressed,
            ),
            !editing ? readOnlyWidget : editingWidget,
            if ((footerText?.isNotEmpty ?? false) && !editing) FoodlySectionsFooterText(footerText: footerText!),
          ],
        ),
      ).paddingBottom(48),
    );
  }
}
