import 'package:flutter/material.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';

class FavedBusinessPage extends StatelessWidget {
  const FavedBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryMainAppBar(
        key: Key('fav-businesses-app-bar'),
        actionText: 'Favorite Business',
      ),
      body: Center(
        child: Text('Faved Business'),
      ),
    );
  }
}
