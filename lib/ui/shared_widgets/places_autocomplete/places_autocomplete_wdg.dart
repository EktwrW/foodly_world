import 'package:flutter/material.dart';
import 'package:foodly_world/core/configs/base_config.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:logger/logger.dart';
import 'package:nova_places_autocomplete/nova_places_autocomplete.dart';

class PlacesAutocompleteWdg extends StatelessWidget {
  const PlacesAutocompleteWdg({
    super.key,
    this.onPickedPlaceDetail,
    this.language,
    this.components,
    this.autofocus = false,
  });
  final void Function(Place)? onPickedPlaceDetail;
  final String? language;
  final List<String>? components;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return NovaPlacesAutocomplete(
      language: language,
      apiKey: di<BaseConfig>().googleDefaultApiKey,
      onPicked: (prediction) => di<Logger>().i('$prediction'),
      onSearchFailed: (error) {
        di<Logger>().e(error);
      },
      hintText: S.current.searchBusinessOrAddress,
      components: components,
      prefixIcon: const Icon(Icons.manage_search_sharp),
      cancelIcon: const Icon(Bootstrap.eraser_fill, size: 22),
      autocompleteOnTrailingWhitespace: true,
      detailRequired: true,
      onPickedPlaceDetail: onPickedPlaceDetail,
      autofocus: autofocus,
    );
  }
}
