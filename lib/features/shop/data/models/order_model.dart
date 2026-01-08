import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_entity.dart';
import 'product_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderItemModel with _$OrderItemModel {
  const OrderItemModel._();
  
  const factory OrderItemModel({
    required ProductModel product,
    required int quantity,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  OrderItemEntity toEntity() => OrderItemEntity(
        product: product.toEntity(),
        quantity: quantity,
      );
}

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();
  
  const factory OrderModel({
    required String id,
    required List<OrderItemModel> items,
    required double total,
    required OrderStatus status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'store_id') String? storeId,
    @JsonKey(name: 'store_name') String? storeName,
    @JsonKey(name: 'delivery_address') String? deliveryAddress,
    @JsonKey(name: 'estimated_delivery') DateTime? estimatedDelivery,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  OrderEntity toEntity() => OrderEntity(
        id: id,
        items: items.map((item) => item.toEntity()).toList(),
        total: total,
        status: status,
        createdAt: createdAt,
        storeId: storeId,
        storeName: storeName,
        deliveryAddress: deliveryAddress,
        estimatedDelivery: estimatedDelivery,
      );
}
