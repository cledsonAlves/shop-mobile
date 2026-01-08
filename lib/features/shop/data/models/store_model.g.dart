// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreModelImpl _$$StoreModelImplFromJson(Map<String, dynamic> json) =>
    _$StoreModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      imageUrl: json['image_url'] as String,
      rating: (json['rating'] as num).toDouble(),
      deliveryTime: json['delivery_time'] as String,
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      description: json['description'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      isOpen: json['is_open'] as bool? ?? true,
    );

Map<String, dynamic> _$$StoreModelImplToJson(_$StoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'image_url': instance.imageUrl,
      'rating': instance.rating,
      'delivery_time': instance.deliveryTime,
      'delivery_fee': instance.deliveryFee,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'is_open': instance.isOpen,
    };
