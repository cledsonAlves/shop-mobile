import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_model.freezed.dart';
part 'product_image_model.g.dart';

@freezed
class ProductImageModel with _$ProductImageModel {
  const factory ProductImageModel({
    required String id,
    @JsonKey(name: 'produto_id') required String produtoId,
    required String url,
    @Default(false) bool principal,
    @Default(0) int ordem,
  }) = _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);
}
