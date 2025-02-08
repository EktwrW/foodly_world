import 'package:flutter/material.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryMainAppBar(
        key: Key('notifications-app-bar'),
        actionText: 'Notifications',
      ),
      body: Center(
        child: Text('Notifications Page'),
      ),
    );
  }
}
