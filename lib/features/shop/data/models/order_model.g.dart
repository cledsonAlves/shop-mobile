// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderCreateModelImpl _$$OrderCreateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderCreateModelImpl(
      clienteId: json['cliente_id'] as String,
      lojistaId: json['lojista_id'] as String,
      enderecoEntrega: json['endereco_entrega'] as String?,
      cidadeEntrega: json['cidade_entrega'] as String?,
      estadoEntrega: json['estado_entrega'] as String?,
      cepEntrega: json['cep_entrega'] as String?,
      formaPagamento: json['forma_pagamento'] as String?,
      observacoes: json['observacoes'] as String?,
      taxaEntrega: (json['taxa_entrega'] as num?)?.toDouble() ?? 0,
      desconto: (json['desconto'] as num?)?.toDouble() ?? 0,
      itens: (json['itens'] as List<dynamic>)
          .map((e) => OrderItemCreateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderCreateModelImplToJson(
        _$OrderCreateModelImpl instance) =>
    <String, dynamic>{
      'cliente_id': instance.clienteId,
      'lojista_id': instance.lojistaId,
      'endereco_entrega': instance.enderecoEntrega,
      'cidade_entrega': instance.cidadeEntrega,
      'estado_entrega': instance.estadoEntrega,
      'cep_entrega': instance.cepEntrega,
      'forma_pagamento': instance.formaPagamento,
      'observacoes': instance.observacoes,
      'taxa_entrega': instance.taxaEntrega,
      'desconto': instance.desconto,
      'itens': instance.itens.map((e) => e.toJson()).toList(),
    };

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      clienteId: json['cliente_id'] as String,
      lojistaId: json['lojista_id'] as String,
      nomeLojista: json['nome_lojista'] as String?,
      enderecoEntrega: json['endereco_entrega'] as String?,
      cidadeEntrega: json['cidade_entrega'] as String?,
      estadoEntrega: json['estado_entrega'] as String?,
      cepEntrega: json['cep_entrega'] as String?,
      formaPagamento: json['forma_pagamento'] as String?,
      observacoes: json['observacoes'] as String?,
      subtotal: json['subtotal'] as String,
      taxaEntrega: json['taxa_entrega'] as String? ?? '0',
      desconto: json['desconto'] as String? ?? '0',
      total: json['total'] as String,
      status: json['status'] as String,
      codigoConfirmacao: json['codigo_confirmacao'] as String?,
      itens: (json['itens'] as List<dynamic>?)
              ?.map((e) =>
                  OrderItemResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      criadoEm: DateTime.parse(json['criado_em'] as String),
      atualizadoEm: json['atualizado_em'] == null
          ? null
          : DateTime.parse(json['atualizado_em'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente_id': instance.clienteId,
      'lojista_id': instance.lojistaId,
      'nome_lojista': instance.nomeLojista,
      'endereco_entrega': instance.enderecoEntrega,
      'cidade_entrega': instance.cidadeEntrega,
      'estado_entrega': instance.estadoEntrega,
      'cep_entrega': instance.cepEntrega,
      'forma_pagamento': instance.formaPagamento,
      'observacoes': instance.observacoes,
      'subtotal': instance.subtotal,
      'taxa_entrega': instance.taxaEntrega,
      'desconto': instance.desconto,
      'total': instance.total,
      'status': instance.status,
      'codigo_confirmacao': instance.codigoConfirmacao,
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'criado_em': instance.criadoEm.toIso8601String(),
      'atualizado_em': instance.atualizadoEm?.toIso8601String(),
    };
