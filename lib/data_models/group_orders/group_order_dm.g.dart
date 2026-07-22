// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_order_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupOrderItemDM _$GroupOrderItemDMFromJson(Map<String, dynamic> json) =>
    _GroupOrderItemDM(
      uuid: json['uuid'] as String,
      participantUuid: json['participant_uuid'] as String?,
      name: json['name_snapshot'] as String? ?? '',
      unitPriceAtLock: json['unit_price_at_lock'] == null
          ? 0
          : _money(json['unit_price_at_lock']),
      unitPricePreview: json['unit_price_preview'] == null
          ? 0
          : _money(json['unit_price_preview']),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$GroupOrderItemDMToJson(_GroupOrderItemDM instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      if (instance.participantUuid case final value?) 'participant_uuid': value,
      'name_snapshot': instance.name,
      'unit_price_at_lock': instance.unitPriceAtLock,
      'unit_price_preview': instance.unitPricePreview,
      'quantity': instance.quantity,
      if (instance.notes case final value?) 'notes': value,
    };

_GroupOrderParticipantDM _$GroupOrderParticipantDMFromJson(
        Map<String, dynamic> json) =>
    _GroupOrderParticipantDM(
      uuid: json['uuid'] as String,
      displayName: json['display_name'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String?,
      role: $enumDecodeNullable(_$GroupParticipantRoleEnumMap, json['role']) ??
          GroupParticipantRole.member,
      paymentStatus: $enumDecodeNullable(
              _$GroupPaymentStatusEnumMap, json['payment_status']) ??
          GroupPaymentStatus.pending,
      amountDue: json['amount_due'] == null ? 0 : _money(json['amount_due']),
      amountPaid: json['amount_paid'] == null ? 0 : _money(json['amount_paid']),
    );

Map<String, dynamic> _$GroupOrderParticipantDMToJson(
        _GroupOrderParticipantDM instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'display_name': instance.displayName,
      if (instance.avatarUrl case final value?) 'avatar_url': value,
      'role': _$GroupParticipantRoleEnumMap[instance.role]!,
      'payment_status': _$GroupPaymentStatusEnumMap[instance.paymentStatus]!,
      'amount_due': instance.amountDue,
      'amount_paid': instance.amountPaid,
    };

const _$GroupParticipantRoleEnumMap = {
  GroupParticipantRole.host: 'host',
  GroupParticipantRole.member: 'member',
};

const _$GroupPaymentStatusEnumMap = {
  GroupPaymentStatus.pending: 'pending',
  GroupPaymentStatus.processing: 'processing',
  GroupPaymentStatus.paid: 'paid',
  GroupPaymentStatus.refunded: 'refunded',
};

_GroupOrderDM _$GroupOrderDMFromJson(Map<String, dynamic> json) =>
    _GroupOrderDM(
      uuid: json['uuid'] as String,
      status: $enumDecodeNullable(_$GroupOrderStatusEnumMap, json['status']) ??
          GroupOrderStatus.open,
      businessUuid: json['business_uuid'] as String?,
      businessName: json['business_name'] as String? ?? '',
      businessLogo: json['business_logo'] as String?,
      currency: json['currency'] as String? ?? 'EUR',
      subtotal: json['subtotal'] == null ? 0 : _money(json['subtotal']),
      totalAmount:
          json['total_amount'] == null ? 0 : _money(json['total_amount']),
      totalPaid: json['total_paid'] == null ? 0 : _money(json['total_paid']),
      lockExpiresAt: json['lock_expires_at'] == null
          ? null
          : DateTime.parse(json['lock_expires_at'] as String),
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) =>
                  GroupOrderParticipantDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupOrderParticipantDM>[],
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => GroupOrderItemDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupOrderItemDM>[],
    );

Map<String, dynamic> _$GroupOrderDMToJson(_GroupOrderDM instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'status': _$GroupOrderStatusEnumMap[instance.status]!,
      if (instance.businessUuid case final value?) 'business_uuid': value,
      'business_name': instance.businessName,
      if (instance.businessLogo case final value?) 'business_logo': value,
      'currency': instance.currency,
      'subtotal': instance.subtotal,
      'total_amount': instance.totalAmount,
      'total_paid': instance.totalPaid,
      if (instance.lockExpiresAt?.toIso8601String() case final value?)
        'lock_expires_at': value,
      'participants': instance.participants.map((e) => e.toJson()).toList(),
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

const _$GroupOrderStatusEnumMap = {
  GroupOrderStatus.open: 'open',
  GroupOrderStatus.locked: 'locked',
  GroupOrderStatus.paying: 'paying',
  GroupOrderStatus.confirmed: 'confirmed',
  GroupOrderStatus.completed: 'completed',
  GroupOrderStatus.expired: 'expired',
  GroupOrderStatus.cancelled: 'cancelled',
};

_GroupOrderResponseDM _$GroupOrderResponseDMFromJson(
        Map<String, dynamic> json) =>
    _GroupOrderResponseDM(
      success: json['success'] as bool? ?? true,
      groupOrder:
          GroupOrderDM.fromJson(json['group_order'] as Map<String, dynamic>),
      myShare: json['my_share'] == null ? 0 : _money(json['my_share']),
      myParticipantUuid: json['my_participant_uuid'] as String?,
    );

Map<String, dynamic> _$GroupOrderResponseDMToJson(
        _GroupOrderResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'group_order': instance.groupOrder.toJson(),
      'my_share': instance.myShare,
      if (instance.myParticipantUuid case final value?)
        'my_participant_uuid': value,
    };

_GroupOrdersListResponseDM _$GroupOrdersListResponseDMFromJson(
        Map<String, dynamic> json) =>
    _GroupOrdersListResponseDM(
      success: json['success'] as bool? ?? true,
      groupOrders: (json['group_orders'] as List<dynamic>?)
              ?.map((e) => GroupOrderDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupOrderDM>[],
    );

Map<String, dynamic> _$GroupOrdersListResponseDMToJson(
        _GroupOrdersListResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'group_orders': instance.groupOrders.map((e) => e.toJson()).toList(),
    };

_PayIntentResponseDM _$PayIntentResponseDMFromJson(Map<String, dynamic> json) =>
    _PayIntentResponseDM(
      clientSecret: json['client_secret'] as String?,
      transactionUuid: json['transaction_uuid'] as String?,
      amount: json['amount'] == null ? 0 : _money(json['amount']),
      currency: json['currency'] as String? ?? 'EUR',
    );

Map<String, dynamic> _$PayIntentResponseDMToJson(
        _PayIntentResponseDM instance) =>
    <String, dynamic>{
      if (instance.clientSecret case final value?) 'client_secret': value,
      if (instance.transactionUuid case final value?) 'transaction_uuid': value,
      'amount': instance.amount,
      'currency': instance.currency,
    };

_GroupInviteResponseDM _$GroupInviteResponseDMFromJson(
        Map<String, dynamic> json) =>
    _GroupInviteResponseDM(
      success: json['success'] as bool? ?? true,
      inviteToken: json['invite_token'] as String?,
      inviteUrl: json['invite_url'] as String?,
    );

Map<String, dynamic> _$GroupInviteResponseDMToJson(
        _GroupInviteResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      if (instance.inviteToken case final value?) 'invite_token': value,
      if (instance.inviteUrl case final value?) 'invite_url': value,
    };
