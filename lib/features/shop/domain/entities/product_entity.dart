import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String id,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required String storeId,
    required String storeName,
    String? category,
    @Default(0) int stock,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
  }) = _ProductEntity;
}
