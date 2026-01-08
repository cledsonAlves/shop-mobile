import '../../../../core/error/exceptions.dart';
import '../../domain/entities/store_entity.dart';
import 'shop_api.dart';

abstract class StoreRemoteDataSource {
  Future<List<StoreEntity>> getStores();
  Future<StoreEntity> getStoreById(String id);
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final ShopApi _api;

  StoreRemoteDataSourceImpl(this._api);

  @override
  Future<List<StoreEntity>> getStores() async {
    try {
      final stores = await _api.getStores();
      return stores.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw ServerException('Erro ao buscar lojas');
    }
  }

  @override
  Future<StoreEntity> getStoreById(String id) async {
    try {
      final store = await _api.getStoreById(id);
      return store.toEntity();
    } catch (e) {
      throw ServerException('Erro ao buscar loja');
    }
  }
}
