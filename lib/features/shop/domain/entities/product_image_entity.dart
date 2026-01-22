import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_entity.freezed.dart';

@freezed
class ProductImageEntity with _$ProductImageEntity {
  const factory ProductImageEntity({
    required String id,
    required String produtoId,
    required String url,
    @Default(false) bool principal,
    @Default(0) int ordem,
  }) = _ProductImageEntity;
}
