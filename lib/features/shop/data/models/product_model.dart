import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  
  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'store_id') required String storeId,
    @JsonKey(name: 'store_name') required String storeName,
    String? category,
    @Default(0) int stock,
    @Default(0.0) double rating,
    @JsonKey(name: 'review_count') @Default(0) int reviewCount,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: name,
        description: description,
        price: price,
        imageUrl: imageUrl,
        storeId: storeId,
        storeName: storeName,
        category: category,
        stock: stock,
        rating: rating,
        reviewCount: reviewCount,
      );
      
  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        price: entity.price,
        imageUrl: entity.imageUrl,
        storeId: entity.storeId,
        storeName: entity.storeName,
        category: entity.category,
        stock: entity.stock,
        rating: entity.rating,
        reviewCount: entity.reviewCount,
      );
}
