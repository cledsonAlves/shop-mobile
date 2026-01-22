import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../../features/shop/data/datasources/shop_api.dart';
import '../../features/shop/data/datasources/product_remote_datasource.dart';
import '../../features/shop/data/datasources/store_remote_datasource.dart';
import '../../features/shop/data/datasources/category_remote_datasource.dart';
import '../../features/shop/data/datasources/product_image_remote_datasource.dart';
import '../../features/shop/data/repositories/product_repository_impl.dart';
import '../../features/shop/data/repositories/store_repository_impl.dart';
import '../../features/shop/data/repositories/category_repository_impl.dart';
import '../../features/shop/data/repositories/product_image_repository_impl.dart';
import '../../features/shop/domain/repositories/product_repository.dart';
import '../../features/shop/domain/repositories/store_repository.dart';
import '../../features/shop/domain/repositories/category_repository.dart';
import '../../features/shop/domain/repositories/product_image_repository.dart';
import '../../features/shop/domain/usecases/get_products.dart';
import '../../features/shop/domain/usecases/get_stores.dart';
import '../../features/shop/domain/usecases/get_categories.dart';
import '../../features/shop/domain/usecases/get_products_by_store.dart';
import '../../features/shop/domain/usecases/get_product_images.dart';
// Auth imports
import '../../features/auth/data/datasources/auth_manager.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/register_client.dart';
import '../../features/auth/domain/usecases/login_client.dart';
import '../../features/auth/domain/usecases/get_client_profile.dart';
import '../../features/auth/domain/usecases/logout_client.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core - Network
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<Dio>(() => getIt<DioClient>().dio);

  // Auth - Manager
  getIt.registerLazySingleton<AuthManager>(() => AuthManager());

  // Data sources - API
  getIt.registerLazySingleton<ShopApi>(
    () => ShopApi(getIt<Dio>()),
  );

  // Auth - Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<Dio>()),
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

  getIt.registerLazySingleton<ProductImageRemoteDataSource>(
    () => ProductImageRemoteDataSourceImpl(getIt<ShopApi>()),
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

  getIt.registerLazySingleton<ProductImageRepository>(
    () => ProductImageRepositoryImpl(getIt<ProductImageRemoteDataSource>()),
  );

  // Auth - Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      authManager: getIt<AuthManager>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<GetProducts>(
    () => GetProducts(getIt<ProductRepository>()),
  );

  getIt.registerLazySingleton<GetStores>(
    () => GetStores(getIt<StoreRepository>()),
  );

  getIt.registerLazySingleton<GetCategories>(
    () => GetCategories(getIt<CategoryRepository>()),
  );

  getIt.registerLazySingleton<GetProductImages>(
    () => GetProductImages(getIt<ProductImageRepository>()),
  );

  getIt.registerLazySingleton<GetProductsByStore>(
    () => GetProductsByStore(getIt<ProductRepository>()),
  );

  // Auth - Use Cases
  getIt.registerLazySingleton<RegisterClient>(
    () => RegisterClient(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<LoginClient>(
    () => LoginClient(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<GetClientProfile>(
    () => GetClientProfile(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<LogoutClient>(
    () => LogoutClient(getIt<AuthRepository>()),
  );
}
