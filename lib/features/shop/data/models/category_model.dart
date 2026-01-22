import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const CategoryModel._();
  
  const factory CategoryModel({
    required String id,
    @JsonKey(name: 'lojista_id') required String lojistaId,
    required String nome,
    String? descricao,
    @Default(true) bool ativo,
    @Default(0) int ordem,
    @JsonKey(name: 'criado_em') String? criadoEm,
    @JsonKey(name: 'atualizado_em') String? atualizadoEm,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: nome,
        icon: '',
        description: descricao,
        imageUrl: null,
      );
      
  factory CategoryModel.fromEntity(CategoryEntity entity) => CategoryModel(
        id: entity.id,
        lojistaId: '',
        nome: entity.name,
        descricao: entity.description,
        ativo: true,
        ordem: 0,
      );
}
