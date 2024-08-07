import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:icons_plus/icons_plus.dart' show Flag, Flags;
//import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

enum FoodlyCountries {
  @JsonValue('Argentina')
  ARGENTINA('AR', 'Argentina', 'ARS'),
  // @JsonValue('El Salvador')
  // EL_SALVADOR('SV', 'El Salvador'),
  @JsonValue('Spain')
  SPAIN('ES', 'Spain', '€'),
  @JsonValue('Portugal')
  PORTUGAL('PT', 'Portugal', '€'),
  @JsonValue('United States')
  USA('US', 'United States', '\$'),
  @JsonValue('Venezuela')
  VENEZUELA('VE', 'Venezuela', 'Bs');

  final String countryCode;
  final String value;
  final String currencySymbol;
  const FoodlyCountries(this.countryCode, this.value, this.currencySymbol);

  //TODO: define countries final array according region of app release
  static final _countriesMap = {
    FoodlyCountries.ARGENTINA: (S.current.countryArgentina, Flag(Flags.argentina, size: 24)),
    //FoodlyCountries.EL_SALVADOR: (S.current.countryElSalvador, Flag(Flags.el_salvador, size: 24)),
    FoodlyCountries.SPAIN: (S.current.countrySpain, Flag(Flags.spain, size: 24)),
    FoodlyCountries.PORTUGAL: (S.current.countryPortugal, Flag(Flags.portugal, size: 24)),
    FoodlyCountries.USA: (S.current.countryUsa, Flag(Flags.united_states_of_america, size: 24)),
    FoodlyCountries.VENEZUELA: (S.current.countryVenezuela, Flag(Flags.venezuela, size: 24)),
  };

  String get name => _countriesMap[this]?.$1 ?? '';
  Widget? get flag => _countriesMap[this]?.$2;
  List<String> get apiComponents {
    //final lang = Intl.getCurrentLocale().substring(0, 2).toLowerCase();
    final list = List<FoodlyCountries>.from(FoodlyCountries.values);

    // if (lang == FoodlyStrings.EN) {
    //   list.removeWhere((c) => c == FoodlyCountries.VENEZUELA);
    // }
    // if (lang == FoodlyStrings.ES) {
    //   list.removeWhere((c) => c == FoodlyCountries.PORTUGAL);
    // }
    // if (lang == FoodlyStrings.PT) {
    //   list.removeWhere((c) => c == FoodlyCountries.VENEZUELA);
    // }

    return list.map((c) => '${FoodlyStrings.COUNTRY}:${c.countryCode}').toList();
  }
}
