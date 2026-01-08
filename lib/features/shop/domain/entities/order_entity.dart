import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_entity.dart';

part 'order_entity.freezed.dart';

enum OrderStatus {
  pending,
  confirmed,
  preparing,
  delivering,
  delivered,
  cancelled,
}

@freezed
class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required ProductEntity product,
    required int quantity,
  }) = _OrderItemEntity;
}

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required List<OrderItemEntity> items,
    required double total,
    required OrderStatus status,
    required DateTime createdAt,
    String? storeId,
    String? storeName,
    String? deliveryAddress,
    DateTime? estimatedDelivery,
  }) = _OrderEntity;
}
