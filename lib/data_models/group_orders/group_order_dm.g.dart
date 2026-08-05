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
      shared: json['shared'] as bool? ?? false,
      notes: json['notes'] as String?,
      deliveredAt: json['delivered_at'] == null
          ? null
          : DateTime.parse(json['delivered_at'] as String),
      batchNo: (json['batch_no'] as num?)?.toInt(),
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
    );

Map<String, dynamic> _$GroupOrderItemDMToJson(_GroupOrderItemDM instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      if (instance.participantUuid case final value?) 'participant_uuid': value,
      'name_snapshot': instance.name,
      'unit_price_at_lock': instance.unitPriceAtLock,
      'unit_price_preview': instance.unitPricePreview,
      'quantity': instance.quantity,
      'shared': instance.shared,
      if (instance.notes case final value?) 'notes': value,
      if (instance.deliveredAt?.toIso8601String() case final value?)
        'delivered_at': value,
      if (instance.batchNo case final value?) 'batch_no': value,
      if (instance.sentAt?.toIso8601String() case final value?)
        'sent_at': value,
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
      paidByParticipantUuid: json['paid_by_participant_uuid'] as String?,
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
      if (instance.paidByParticipantUuid case final value?)
        'paid_by_participant_uuid': value,
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
      businessMenuUuid: json['business_menu_uuid'] as String?,
      businessName: json['business_name'] as String? ?? '',
      businessLogo: json['business_logo'] as String?,
      currency: json['currency'] as String? ?? 'EUR',
      splitMode:
          $enumDecodeNullable(_$GroupSplitModeEnumMap, json['split_mode']) ??
              GroupSplitMode.byItems,
      payerFixedFee: json['payer_fixed_fee'] == null
          ? 0.25
          : _money(json['payer_fixed_fee']),
      subtotal: json['subtotal'] == null ? 0 : _money(json['subtotal']),
      totalAmount:
          json['total_amount'] == null ? 0 : _money(json['total_amount']),
      totalPaid: json['total_paid'] == null ? 0 : _money(json['total_paid']),
      confirmedAt: json['confirmed_at'] == null
          ? null
          : DateTime.parse(json['confirmed_at'] as String),
      fulfillmentStatus: $enumDecodeNullable(
          _$GroupFulfillmentStatusEnumMap, json['fulfillment_status'],
          unknownValue: JsonKey.nullForUndefinedEnumValue),
      roundNumber: (json['round_number'] as num?)?.toInt() ?? 1,
      tableLabel: json['table_label'] as String?,
      paymentMode: $enumDecodeNullable(
              _$GroupPaymentModeEnumMap, json['payment_mode'],
              unknownValue: GroupPaymentMode.perRound) ??
          GroupPaymentMode.perRound,
      billRequestedAt: json['bill_requested_at'] == null
          ? null
          : DateTime.parse(json['bill_requested_at'] as String),
      lockExpiresAt: json['lock_expires_at'] == null
          ? null
          : DateTime.parse(json['lock_expires_at'] as String),
      graceEndsAt: json['grace_ends_at'] == null
          ? null
          : DateTime.parse(json['grace_ends_at'] as String),
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
      if (instance.businessMenuUuid case final value?)
        'business_menu_uuid': value,
      'business_name': instance.businessName,
      if (instance.businessLogo case final value?) 'business_logo': value,
      'currency': instance.currency,
      'split_mode': _$GroupSplitModeEnumMap[instance.splitMode]!,
      'payer_fixed_fee': instance.payerFixedFee,
      'subtotal': instance.subtotal,
      'total_amount': instance.totalAmount,
      'total_paid': instance.totalPaid,
      if (instance.confirmedAt?.toIso8601String() case final value?)
        'confirmed_at': value,
      if (_$GroupFulfillmentStatusEnumMap[instance.fulfillmentStatus]
          case final value?)
        'fulfillment_status': value,
      'round_number': instance.roundNumber,
      if (instance.tableLabel case final value?) 'table_label': value,
      'payment_mode': _$GroupPaymentModeEnumMap[instance.paymentMode]!,
      if (instance.billRequestedAt?.toIso8601String() case final value?)
        'bill_requested_at': value,
      if (instance.lockExpiresAt?.toIso8601String() case final value?)
        'lock_expires_at': value,
      if (instance.graceEndsAt?.toIso8601String() case final value?)
        'grace_ends_at': value,
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

const _$GroupSplitModeEnumMap = {
  GroupSplitMode.byItems: 'by_items',
  GroupSplitMode.equalSplit: 'equal_split',
};

const _$GroupFulfillmentStatusEnumMap = {
  GroupFulfillmentStatus.preparing: 'preparing',
  GroupFulfillmentStatus.ready: 'ready',
  GroupFulfillmentStatus.delivered: 'delivered',
};

const _$GroupPaymentModeEnumMap = {
  GroupPaymentMode.perRound: 'per_round',
  GroupPaymentMode.openTab: 'open_tab',
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
      tipAmount: json['tip_amount'] == null ? 0 : _money(json['tip_amount']),
      serviceFeeAmount: json['service_fee_amount'] == null
          ? 0
          : _money(json['service_fee_amount']),
      totalCharged:
          json['total_charged'] == null ? 0 : _money(json['total_charged']),
      currency: json['currency'] as String? ?? 'EUR',
      coveredParticipantUuids:
          (json['covered_participant_uuids'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const <String>[],
    );

Map<String, dynamic> _$PayIntentResponseDMToJson(
        _PayIntentResponseDM instance) =>
    <String, dynamic>{
      if (instance.clientSecret case final value?) 'client_secret': value,
      if (instance.transactionUuid case final value?) 'transaction_uuid': value,
      'amount': instance.amount,
      'tip_amount': instance.tipAmount,
      'service_fee_amount': instance.serviceFeeAmount,
      'total_charged': instance.totalCharged,
      'currency': instance.currency,
      'covered_participant_uuids': instance.coveredParticipantUuids,
    };

_GroupInviteResponseDM _$GroupInviteResponseDMFromJson(
        Map<String, dynamic> json) =>
    _GroupInviteResponseDM(
      success: json['success'] as bool? ?? true,
      inviteToken: json['invite_token'] as String?,
      inviteCode: json['invite_code'] as String?,
      inviteUrl: json['invite_url'] as String?,
    );

Map<String, dynamic> _$GroupInviteResponseDMToJson(
        _GroupInviteResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      if (instance.inviteToken case final value?) 'invite_token': value,
      if (instance.inviteCode case final value?) 'invite_code': value,
      if (instance.inviteUrl case final value?) 'invite_url': value,
    };
