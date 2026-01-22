// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImageModelImpl _$$ProductImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductImageModelImpl(
      id: json['id'] as String,
      produtoId: json['produto_id'] as String,
      url: json['url'] as String,
      principal: json['principal'] as bool? ?? false,
      ordem: (json['ordem'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProductImageModelImplToJson(
        _$ProductImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'produto_id': instance.produtoId,
      'url': instance.url,
      'principal': instance.principal,
      'ordem': instance.ordem,
    };
