import 'package:flutter/widgets.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:icons_plus/icons_plus.dart' show Flag, Flags;
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

enum FoodlyCountries {
  @JsonValue('Argentina')
  ARGENTINA('AR', 'Argentina'),
  @JsonValue('El Salvador')
  EL_SALVADOR('SV', 'El Salvador'),
  @JsonValue('Spain')
  ESPANA('ES', 'Spain'),
  @JsonValue('Portugal')
  PORTUGAL('PT', 'Portugal'),
  @JsonValue('United States')
  USA('US', 'United States'),
  @JsonValue('Venezuela')
  VENEZUELA('VE', 'Venezuela');

  final String countryCode;
  final String value;
  const FoodlyCountries(this.countryCode, this.value);

  static final _countriesMap = {
    FoodlyCountries.ARGENTINA: (S.current.countryArgentina, Flag(Flags.argentina, size: 24)),
    FoodlyCountries.EL_SALVADOR: (S.current.countryElSalvador, Flag(Flags.el_salvador, size: 24)),
    FoodlyCountries.ESPANA: (S.current.countryEspana, Flag(Flags.spain, size: 24)),
    FoodlyCountries.PORTUGAL: (S.current.countryPortugal, Flag(Flags.portugal, size: 24)),
    FoodlyCountries.USA: (S.current.countryUsa, Flag(Flags.united_states_of_america, size: 24)),
    FoodlyCountries.VENEZUELA: (S.current.countryVenezuela, Flag(Flags.venezuela, size: 24)),
  };

  String get name => _countriesMap[this]?.$1 ?? '';
  Widget? get flag => _countriesMap[this]?.$2;
  List<String> get apiComponents {
    final lang = Intl.getCurrentLocale().substring(0, 2).toLowerCase();
    final list = List<FoodlyCountries>.from(FoodlyCountries.values);

    if (lang == 'en') {
      list.removeWhere((c) => c == FoodlyCountries.VENEZUELA);
    }
    if (lang == 'es') {
      list.removeWhere((c) => c == FoodlyCountries.PORTUGAL);
    }
    if (lang == 'pt') {
      list.removeWhere((c) => c == FoodlyCountries.VENEZUELA);
    }

    return list.map((c) => 'country:${c.countryCode}').toList();
  }
}
