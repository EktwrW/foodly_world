// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_menu_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicMenuResponseDMImpl _$$PublicMenuResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicMenuResponseDMImpl(
      business: BusinessDM.fromJson(json['business'] as Map<String, dynamic>),
      menu: MenuDM.fromJson(json['menu'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PublicMenuResponseDMImplToJson(
        _$PublicMenuResponseDMImpl instance) =>
    <String, dynamic>{
      'business': instance.business.toJson(),
      'menu': instance.menu.toJson(),
    };
