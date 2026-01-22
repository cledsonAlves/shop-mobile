// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentPreferenceRequestImpl _$$PaymentPreferenceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentPreferenceRequestImpl(
      pedidoId: json['pedido_id'] as String,
    );

Map<String, dynamic> _$$PaymentPreferenceRequestImplToJson(
        _$PaymentPreferenceRequestImpl instance) =>
    <String, dynamic>{
      'pedido_id': instance.pedidoId,
    };

_$PaymentPreferenceResponseImpl _$$PaymentPreferenceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentPreferenceResponseImpl(
      id: json['id'] as String,
      initPoint: json['init_point'] as String,
      sandboxInitPoint: json['sandbox_init_point'] as String,
      pagamentoId: json['pagamento_id'] as String,
      pedidoId: json['pedido_id'] as String,
    );

Map<String, dynamic> _$$PaymentPreferenceResponseImplToJson(
        _$PaymentPreferenceResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'init_point': instance.initPoint,
      'sandbox_init_point': instance.sandboxInitPoint,
      'pagamento_id': instance.pagamentoId,
      'pedido_id': instance.pedidoId,
    };

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: json['id'] as String,
      pedidoId: json['pedido_id'] as String,
      preferenceId: json['preference_id'] as String?,
      paymentId: json['payment_id'] as String?,
      status: json['status'] as String,
      statusDetail: json['status_detail'] as String?,
      paymentType: json['payment_type'] as String?,
      paymentMethod: json['payment_method'] as String?,
      valor: (json['valor'] as num).toDouble(),
      payerEmail: json['payer_email'] as String?,
      initPoint: json['init_point'] as String?,
      criadoEm: json['criado_em'] == null
          ? null
          : DateTime.parse(json['criado_em'] as String),
      atualizadoEm: json['atualizado_em'] == null
          ? null
          : DateTime.parse(json['atualizado_em'] as String),
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pedido_id': instance.pedidoId,
      'preference_id': instance.preferenceId,
      'payment_id': instance.paymentId,
      'status': instance.status,
      'status_detail': instance.statusDetail,
      'payment_type': instance.paymentType,
      'payment_method': instance.paymentMethod,
      'valor': instance.valor,
      'payer_email': instance.payerEmail,
      'init_point': instance.initPoint,
      'criado_em': instance.criadoEm?.toIso8601String(),
      'atualizado_em': instance.atualizadoEm?.toIso8601String(),
    };
