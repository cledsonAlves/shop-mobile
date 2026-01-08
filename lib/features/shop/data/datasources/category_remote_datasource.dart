import '../../../../core/error/exceptions.dart';
import '../../domain/entities/category_entity.dart';
import 'shop_api.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ShopApi _api;

  CategoryRemoteDataSourceImpl(this._api);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final categories = await _api.getCategories();
      return categories.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerException('Erro ao buscar categorias');
    }
  }
}
