import 'package:flutter/material.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';

class SavedPromotionsPage extends StatelessWidget {
  const SavedPromotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryMainAppBar(
        key: Key('promotions-app-bar'),
        actionText: 'Saved Promotions',
      ),
      body: Center(
        child: Text('Saved Promotions'),
      ),
    );
  }
}
