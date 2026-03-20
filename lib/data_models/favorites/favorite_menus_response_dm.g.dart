// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_menus_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMenusResponseDM _$FavoriteMenusResponseDMFromJson(
        Map<String, dynamic> json) =>
    FavoriteMenusResponseDM(
      favoriteMenus: (json['favorite_menus'] as List<dynamic>?)
              ?.map((e) => MenuDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
