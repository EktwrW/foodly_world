// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_food_items_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteFoodItemsResponseDM _$FavoriteFoodItemsResponseDMFromJson(
        Map<String, dynamic> json) =>
    FavoriteFoodItemsResponseDM(
      favoriteFoodItems: (json['favorite_food_items'] as List<dynamic>?)
              ?.map((e) => ItemDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
