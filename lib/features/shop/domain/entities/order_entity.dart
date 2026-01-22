import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_item_entity.dart';

part 'order_entity.freezed.dart';

/// Status do pedido conforme API
enum OrderStatus {
  pendente,
  confirmado,
  preparando,
  em_entrega,
  entregue,
  cancelado,
}

/// Extensão para converter string para OrderStatus
extension OrderStatusExtension on String {
  OrderStatus toOrderStatus() {
    switch (toLowerCase()) {
      case 'pendente':
        return OrderStatus.pendente;
      case 'confirmado':
        return OrderStatus.confirmado;
      case 'preparando':
        return OrderStatus.preparando;
      case 'em_entrega':
        return OrderStatus.em_entrega;
      case 'entregue':
        return OrderStatus.entregue;
      case 'cancelado':
        return OrderStatus.cancelado;
      default:
        return OrderStatus.pendente;
    }
  }
}

/// Extensão para converter OrderStatus para string
extension OrderStatusStringExtension on OrderStatus {
  String toApiString() {
    switch (this) {
      case OrderStatus.pendente:
        return 'pendente';
      case OrderStatus.confirmado:
        return 'confirmado';
      case OrderStatus.preparando:
        return 'preparando';
      case OrderStatus.em_entrega:
        return 'em_entrega';
      case OrderStatus.entregue:
        return 'entregue';
      case OrderStatus.cancelado:
        return 'cancelado';
    }
  }

  String toDisplayString() {
    switch (this) {
      case OrderStatus.pendente:
        return 'Pendente';
      case OrderStatus.confirmado:
        return 'Confirmado';
      case OrderStatus.preparando:
        return 'Preparando';
      case OrderStatus.em_entrega:
        return 'Saiu para entrega';
      case OrderStatus.entregue:
        return 'Entregue';
      case OrderStatus.cancelado:
        return 'Cancelado';
    }
  }

  bool get isActive {
    return this == OrderStatus.pendente ||
        this == OrderStatus.confirmado ||
        this == OrderStatus.preparando ||
        this == OrderStatus.em_entrega;
  }
}

/// Entidade de Pedido
@freezed
class OrderEntity with _$OrderEntity {
  const OrderEntity._();

  const factory OrderEntity({
    required String id,
    required String clienteId,
    required String lojistaId,
    String? nomeLojista,
    String? enderecoEntrega,
    String? cidadeEntrega,
    String? estadoEntrega,
    String? cepEntrega,
    String? formaPagamento,
    String? observacoes,
    required double subtotal,
    @Default(0) double taxaEntrega,
    @Default(0) double desconto,
    required double total,
    required OrderStatus status,
    String? codigoConfirmacao,
    @Default([]) List<OrderItemEntity> itens,
    required DateTime criadoEm,
    DateTime? atualizadoEm,
  }) = _OrderEntity;

  /// Resumo dos itens para exibição
  String get resumoItens {
    if (itens.isEmpty) return 'Nenhum item';
    if (itens.length == 1) {
      return '${itens.first.quantidade}x ${itens.first.nomeProduto}';
    }
    final first = '${itens.first.quantidade}x ${itens.first.nomeProduto}';
    final remaining = itens.length - 1;
    return '$first +$remaining item${remaining > 1 ? 's' : ''}';
  }

  /// Verifica se o pedido está ativo (em andamento)
  bool get isActive => status.isActive;
}
