import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/public_menu/public_menu_repo.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/views/public_menu/cubit/public_menu_state.dart';

class PublicMenuCubit extends Cubit<PublicMenuState> {
  final PublicMenuRepo _repo;

  PublicMenuCubit({required PublicMenuRepo repo})
      : _repo = repo,
        super(const PublicMenuState.initial());

  Future<void> load(String businessUuid) async {
    emit(const PublicMenuState.loading());
    final result = await _repo.fetchPublicMenu(businessUuid);
    BusinessDM? business;
    MenuDM? menu;
    String? error;
    result.when(
      success: (data) {
        business = data.business;
        menu = data.menu;
      },
      failure: (e) => error = e.toString(),
    );
    if (error != null) {
      emit(PublicMenuState.error(error!));
      return;
    }
    await _precacheAll(business!, menu!);
    emit(PublicMenuState.loaded(business: business!, menu: menu!));
  }

  Future<void> _precacheAll(BusinessDM business, MenuDM menu) async {
    final urls = <String>[
      business.logo,
      ...business.coverImageUrls,
      for (final cat in menu.foodCategories)
        for (final item in cat.items)
          for (final p in item.foodPhotos ?? [])
            if (p.businessFoodPhotoUrl != null) p.businessFoodPhotoUrl!,
      for (final cat in menu.drinkCategories)
        for (final item in cat.items)
          for (final p in item.drinkPhotos ?? [])
            if (p.businessDrinkPhotoUrl != null) p.businessDrinkPhotoUrl!,
      for (final item in menu.combos)
        for (final p in item.comboPhotos ?? [])
          if (p.businessComboPhotoUrl != null) p.businessComboPhotoUrl!,
    ];

    final futures = urls.map(_precacheUrl).whereType<Future<void>>().toList();
    if (futures.isEmpty) return;
    await Future.wait(futures).timeout(
      const Duration(seconds: 4),
      onTimeout: () => [],
    );
  }

  Future<void>? _precacheUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    final stream = CachedNetworkImageProvider(url).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) { if (!completer.isCompleted) completer.complete(); },
      onError: (_, __) { if (!completer.isCompleted) completer.complete(); },
    ));
    return completer.future;
  }
}
