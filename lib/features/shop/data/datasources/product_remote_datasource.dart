import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';
import 'shop_api.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> getProductById(String id);
  Future<List<ProductEntity>> getProductsByStore(String storeId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ShopApi _api;

  ProductRemoteDataSourceImpl(this._api);

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final products = await _api.getProducts();
      return products.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerException('Erro ao buscar produtos');
    }
  }

  @override
  Future<ProductEntity> getProductById(String id) async {
    try {
      final product = await _api.getProductById(id);
      return product.toEntity();
    } catch (e) {
      throw ServerException('Erro ao buscar produto');
    }
  }

  @override
  Future<List<ProductEntity>> getProductsByStore(String storeId) async {
    try {
      final products = await _api.getProductsByStore(storeId);
      return products.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerException('Erro ao buscar produtos da loja');
    }
  }
}
