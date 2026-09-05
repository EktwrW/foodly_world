import 'package:flutter/material.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

class GreetingWidget extends StatelessWidget {
  final String? userName;

  const GreetingWidget({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return Text(
      userName != null ? '$_getGreetingMessage, $userName.' : '$_getGreetingMessage!',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: FoodlyTextStyles.homeGreeting,
    );
  }

  String get _getGreetingMessage {
    final hour = DateTime.now().hour;
    if (hour >= 0 && hour < 4) {
      return S.current.hi;
    } else if (hour < 12) {
      return S.current.goodMorning;
    } else if (hour < 18) {
      return S.current.goodAfternoon;
    } else {
      return S.current.goodEvening;
    }
  }
}
