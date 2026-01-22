import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product_image_entity.dart';
import 'shop_api.dart';

abstract class ProductImageRemoteDataSource {
  Future<List<ProductImageEntity>> getProductImagesByProductId(String productId);
}

class ProductImageRemoteDataSourceImpl implements ProductImageRemoteDataSource {
  final ShopApi _api;

  ProductImageRemoteDataSourceImpl(this._api);

  @override
  Future<List<ProductImageEntity>> getProductImagesByProductId(String productId) async {
    try {
      final images = await _api.getProductImagesByProductId(productId);
      return images
          .map((model) => ProductImageEntity(
                id: model.id,
                produtoId: model.produtoId,
                url: model.url,
                principal: model.principal,
                ordem: model.ordem,
              ))
          .toList();
    } catch (e) {
      throw ServerException('Erro ao buscar imagens do produto: $e');
    }
  }
}
