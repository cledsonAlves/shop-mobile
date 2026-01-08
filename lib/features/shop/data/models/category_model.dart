import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const CategoryModel._();
  
  const factory CategoryModel({
    required String id,
    required String name,
    required String icon,
    String? description,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        icon: icon,
        description: description,
        imageUrl: imageUrl,
      );
      
  factory CategoryModel.fromEntity(CategoryEntity entity) => CategoryModel(
        id: entity.id,
        name: entity.name,
        icon: entity.icon,
        description: entity.description,
        imageUrl: entity.imageUrl,
      );
}
