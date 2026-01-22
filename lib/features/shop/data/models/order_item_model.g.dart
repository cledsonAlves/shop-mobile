// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemCreateModelImpl _$$OrderItemCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemCreateModelImpl(
      produtoId: json['produto_id'] as String,
      quantidade: (json['quantidade'] as num).toInt(),
      observacoes: json['observacoes'] as String?,
    );

Map<String, dynamic> _$$OrderItemCreateModelImplToJson(
        _$OrderItemCreateModelImpl instance) =>
    <String, dynamic>{
      'produto_id': instance.produtoId,
      'quantidade': instance.quantidade,
      'observacoes': instance.observacoes,
    };

_$OrderItemResponseModelImpl _$$OrderItemResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemResponseModelImpl(
      id: json['id'] as String,
      pedidoId: json['pedido_id'] as String,
      produtoId: json['produto_id'] as String,
      nomeProduto: json['nome_produto'] as String?,
      quantidade: (json['quantidade'] as num).toInt(),
      precoUnitario: json['preco_unitario'] as String,
      precoTotal: json['preco_total'] as String,
      observacoes: json['observacoes'] as String?,
      criadoEm: json['criado_em'] == null
          ? null
          : DateTime.parse(json['criado_em'] as String),
    );

Map<String, dynamic> _$$OrderItemResponseModelImplToJson(
        _$OrderItemResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pedido_id': instance.pedidoId,
      'produto_id': instance.produtoId,
      'nome_produto': instance.nomeProduto,
      'quantidade': instance.quantidade,
      'preco_unitario': instance.precoUnitario,
      'preco_total': instance.precoTotal,
      'observacoes': instance.observacoes,
      'criado_em': instance.criadoEm?.toIso8601String(),
    };
