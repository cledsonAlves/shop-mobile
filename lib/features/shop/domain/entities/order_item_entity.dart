import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_entity.freezed.dart';

/// Entidade de item do pedido
@freezed
class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required String id,
    required String pedidoId,
    required String produtoId,
    required String nomeProduto,
    required int quantidade,
    required double precoUnitario,
    required double subtotal,
    String? observacoes,
  }) = _OrderItemEntity;
}
