// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
    };

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['created_at'] as String),
      storeId: json['store_id'] as String?,
      storeName: json['store_name'] as String?,
      deliveryAddress: json['delivery_address'] as String?,
      estimatedDelivery: json['estimated_delivery'] == null
          ? null
          : DateTime.parse(json['estimated_delivery'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'store_id': instance.storeId,
      'store_name': instance.storeName,
      'delivery_address': instance.deliveryAddress,
      'estimated_delivery': instance.estimatedDelivery?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.preparing: 'preparing',
  OrderStatus.delivering: 'delivering',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};
