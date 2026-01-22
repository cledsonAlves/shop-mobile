import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  
  const factory ProductModel({
    required String id,
    @JsonKey(name: 'lojista_id') required String lojistaId,
    @JsonKey(name: 'categoria_id') String? categoriaId,
    required String nome,
    String? descricao,
    required String preco,
    @JsonKey(name: 'preco_promocional') String? precoPromocional,
    String? custo,
    @Default(0) int estoque,
    @JsonKey(name: 'estoque_minimo') @Default(1) int estoqueMinimo,
    @JsonKey(name: 'controla_estoque') @Default(true) bool controlaEstoque,
    String? sku,
    @JsonKey(name: 'codigo_barras') String? codigoBarras,
    @Default(true) bool ativo,
    @Default(0) int ordem,
    @JsonKey(name: 'criado_em') String? criadoEm,
    @JsonKey(name: 'atualizado_em') String? atualizadoEm,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: nome,
        description: descricao ?? 'Sem descrição',
        price: double.tryParse(preco) ?? 0.0,
        imageUrl: 'https://via.placeholder.com/400x400?text=${Uri.encodeComponent(nome)}&bg=FF6B6B&txtcolor=FFFFFF',
        storeId: lojistaId,
        storeName: 'Loja',
        category: categoriaId,
        stock: estoque,
        rating: 4.5,
        reviewCount: 0,
      );
      
  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(
        id: entity.id,
        lojistaId: entity.storeId,
        categoriaId: entity.category ?? '',
        nome: entity.name,
        descricao: entity.description,
        preco: entity.price.toString(),
        precoPromocional: null,
        custo: '0',
        estoque: entity.stock,
        estoqueMinimo: 1,
        controlaEstoque: true,
        sku: 'SKU-${entity.id}',
        codigoBarras: 'CODE-${entity.id}',
        ativo: true,
        ordem: 0,
        criadoEm: DateTime.now().toIso8601String(),
        atualizadoEm: DateTime.now().toIso8601String(),
      );
}
