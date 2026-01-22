import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_item_entity.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

/// Modelo de item do pedido para criação
@freezed
class OrderItemCreateModel with _$OrderItemCreateModel {
  const OrderItemCreateModel._();
  
  const factory OrderItemCreateModel({
    @JsonKey(name: 'produto_id') required String produtoId,
    required int quantidade,
    String? observacoes,
  }) = _OrderItemCreateModel;

  factory OrderItemCreateModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemCreateModelFromJson(json);
}

/// Modelo de item do pedido retornado pela API
@freezed
class OrderItemResponseModel with _$OrderItemResponseModel {
  const OrderItemResponseModel._();
  
  const factory OrderItemResponseModel({
    required String id,
    @JsonKey(name: 'pedido_id') required String pedidoId,
    @JsonKey(name: 'produto_id') required String produtoId,
    @JsonKey(name: 'nome_produto') String? nomeProduto,
    required int quantidade,
    @JsonKey(name: 'preco_unitario') required String precoUnitario,
    @JsonKey(name: 'preco_total') required String precoTotal,
    String? observacoes,
    @JsonKey(name: 'criado_em') DateTime? criadoEm,
  }) = _OrderItemResponseModel;

  factory OrderItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemResponseModelFromJson(json);

  OrderItemEntity toEntity() => OrderItemEntity(
        id: id,
        pedidoId: pedidoId,
        produtoId: produtoId,
        nomeProduto: nomeProduto ?? 'Produto',
        quantidade: quantidade,
        precoUnitario: double.tryParse(precoUnitario) ?? 0,
        subtotal: double.tryParse(precoTotal) ?? 0,
        observacoes: observacoes,
      );
}
