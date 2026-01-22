import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_entity.dart';
import 'order_item_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

/// Modelo para criação de pedido (POST /pedidos/)
@freezed
class OrderCreateModel with _$OrderCreateModel {
  const OrderCreateModel._();
  
  const factory OrderCreateModel({
    @JsonKey(name: 'cliente_id') required String clienteId,
    @JsonKey(name: 'lojista_id') required String lojistaId,
    @JsonKey(name: 'endereco_entrega') String? enderecoEntrega,
    @JsonKey(name: 'cidade_entrega') String? cidadeEntrega,
    @JsonKey(name: 'estado_entrega') String? estadoEntrega,
    @JsonKey(name: 'cep_entrega') String? cepEntrega,
    @JsonKey(name: 'forma_pagamento') String? formaPagamento,
    String? observacoes,
    @JsonKey(name: 'taxa_entrega') @Default(0) double taxaEntrega,
    @Default(0) double desconto,
    required List<OrderItemCreateModel> itens,
  }) = _OrderCreateModel;

  factory OrderCreateModel.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateModelFromJson(json);
}

/// Modelo de resposta do pedido (GET /pedidos/{id})
@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();
  
  const factory OrderModel({
    required String id,
    @JsonKey(name: 'cliente_id') required String clienteId,
    @JsonKey(name: 'lojista_id') required String lojistaId,
    @JsonKey(name: 'nome_lojista') String? nomeLojista,
    @JsonKey(name: 'endereco_entrega') String? enderecoEntrega,
    @JsonKey(name: 'cidade_entrega') String? cidadeEntrega,
    @JsonKey(name: 'estado_entrega') String? estadoEntrega,
    @JsonKey(name: 'cep_entrega') String? cepEntrega,
    @JsonKey(name: 'forma_pagamento') String? formaPagamento,
    String? observacoes,
    required String subtotal,
    @JsonKey(name: 'taxa_entrega') @Default('0') String taxaEntrega,
    @Default('0') String desconto,
    required String total,
    required String status,
    @JsonKey(name: 'codigo_confirmacao') String? codigoConfirmacao,
    @Default([]) List<OrderItemResponseModel> itens,
    @JsonKey(name: 'criado_em') required DateTime criadoEm,
    @JsonKey(name: 'atualizado_em') DateTime? atualizadoEm,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  OrderEntity toEntity() => OrderEntity(
        id: id,
        clienteId: clienteId,
        lojistaId: lojistaId,
        nomeLojista: nomeLojista,
        enderecoEntrega: enderecoEntrega,
        cidadeEntrega: cidadeEntrega,
        estadoEntrega: estadoEntrega,
        cepEntrega: cepEntrega,
        formaPagamento: formaPagamento,
        observacoes: observacoes,
        subtotal: double.tryParse(subtotal) ?? 0,
        taxaEntrega: double.tryParse(taxaEntrega) ?? 0,
        desconto: double.tryParse(desconto) ?? 0,
        total: double.tryParse(total) ?? 0,
        status: status.toOrderStatus(),
        codigoConfirmacao: codigoConfirmacao,
        itens: itens.map((item) => item.toEntity()).toList(),
        criadoEm: criadoEm,
        atualizadoEm: atualizadoEm,
      );
}
