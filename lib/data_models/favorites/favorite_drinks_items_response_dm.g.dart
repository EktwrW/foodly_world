// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_drinks_items_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteDrinkItemsResponseDM _$FavoriteDrinkItemsResponseDMFromJson(
        Map<String, dynamic> json) =>
    FavoriteDrinkItemsResponseDM(
      favoriteDrinkItems: (json['favorite_drink_items'] as List<dynamic>?)
              ?.map((e) => ItemDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
