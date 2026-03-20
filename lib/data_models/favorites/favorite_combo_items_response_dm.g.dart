// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_combo_items_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteComboItemsResponseDM _$FavoriteComboItemsResponseDMFromJson(
        Map<String, dynamic> json) =>
    FavoriteComboItemsResponseDM(
      favoriteCombos: (json['favorite_combos'] as List<dynamic>?)
              ?.map((e) => ItemDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
