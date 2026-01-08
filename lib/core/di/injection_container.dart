import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../../features/shop/data/datasources/shop_api.dart';
import '../../features/shop/data/datasources/product_remote_datasource.dart';
import '../../features/shop/data/datasources/store_remote_datasource.dart';
import '../../features/shop/data/datasources/category_remote_datasource.dart';
import '../../features/shop/data/repositories/product_repository_impl.dart';
import '../../features/shop/data/repositories/store_repository_impl.dart';
import '../../features/shop/data/repositories/category_repository_impl.dart';
import '../../features/shop/domain/repositories/product_repository.dart';
import '../../features/shop/domain/repositories/store_repository.dart';
import '../../features/shop/domain/repositories/category_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core - Network
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);

  // Data sources - API
  getIt.registerLazySingleton<ShopApi>(
    () => ShopApi(getIt<Dio>()),
  );

  // Data sources - Remote
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt<ShopApi>()),
  );

  getIt.registerLazySingleton<StoreRemoteDataSource>(
    () => StoreRemoteDataSourceImpl(getIt<ShopApi>()),
  );

  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(getIt<ShopApi>()),
  );

  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<ProductRemoteDataSource>()),
  );

  getIt.registerLazySingleton<StoreRepository>(
    () => StoreRepositoryImpl(getIt<StoreRemoteDataSource>()),
  );

  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt<CategoryRemoteDataSource>()),
  );
}
