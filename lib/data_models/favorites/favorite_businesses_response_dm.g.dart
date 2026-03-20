// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_businesses_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteBusinessesResponseDM _$FavoriteBusinessesResponseDMFromJson(
        Map<String, dynamic> json) =>
    FavoriteBusinessesResponseDM(
      favoriteBusinesses: (json['favorite_businesses'] as List<dynamic>?)
              ?.map((e) => BusinessDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
