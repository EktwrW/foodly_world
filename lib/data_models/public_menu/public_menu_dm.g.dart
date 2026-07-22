// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_menu_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicMenuResponseDM _$PublicMenuResponseDMFromJson(
        Map<String, dynamic> json) =>
    _PublicMenuResponseDM(
      business: BusinessDM.fromJson(json['business'] as Map<String, dynamic>),
      menu: MenuDM.fromJson(json['menu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublicMenuResponseDMToJson(
        _PublicMenuResponseDM instance) =>
    <String, dynamic>{
      'business': instance.business.toJson(),
      'menu': instance.menu.toJson(),
    };
