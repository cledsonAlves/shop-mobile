import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../features/shop/domain/usecases/get_stores.dart';
import '../../../../features/shop/domain/usecases/get_products.dart';
import '../../../../features/shop/domain/usecases/get_categories.dart';
import '../../../../features/shop/domain/usecases/get_product_images.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/product_image_entity.dart';
import '../../data/datasources/shop_api.dart';
import 'city_api_provider.dart';

// UserProfile removido - agora usando authProvider para dados do cliente

// Real API providers
final categoriesProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  final getCategories = getIt<GetCategories>();
  final result = await getCategories.call();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (categories) => categories,
  );
});

/// Provider de todas as lojas (sem filtro)
final allStoresProvider = FutureProvider<List<StoreEntity>>((ref) async {
  final getStores = getIt<GetStores>();
  final result = await getStores.call();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (stores) => stores,
  );
});

/// Provider de lojas filtradas pela cidade selecionada
final storesProvider = FutureProvider<List<StoreEntity>>((ref) async {
  final selectedCity = ref.watch(selectedCityApiProvider);
  final allStores = await ref.watch(allStoresProvider.future);
  
  if (selectedCity == null) {
    return allStores;
  }
  
  // Filtra lojas pela cidade selecionada
  return allStores.where((store) => store.cityId == selectedCity.id).toList();
});

/// Provider de lojas por cidade específica
final storesByCityProvider = FutureProvider.family<List<StoreEntity>, String>((ref, cityId) async {
  final allStores = await ref.watch(allStoresProvider.future);
  return allStores.where((store) => store.cityId == cityId).toList();
});

/// Provider de todos os produtos (sem filtro)
final allProductsProvider = FutureProvider<List<ProductEntity>>((ref) async {
  final getProducts = getIt<GetProducts>();
  final result = await getProducts.call();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (products) => products,
  );
});

/// Provider de produtos filtrados pela cidade selecionada
/// Mostra apenas produtos dos lojistas da cidade selecionada
final productsProvider = FutureProvider<List<ProductEntity>>((ref) async {
  final selectedCity = ref.watch(selectedCityApiProvider);
  final allProducts = await ref.watch(allProductsProvider.future);
  
  if (selectedCity == null) {
    return allProducts;
  }
  
  // Busca lojas da cidade selecionada
  final storesInCity = await ref.watch(storesProvider.future);
  final storeIdsInCity = storesInCity.map((s) => s.id).toSet();
  
  // Filtra produtos pelos lojistas da cidade
  return allProducts.where((product) => storeIdsInCity.contains(product.storeId)).toList();
});

final productByIdProvider = FutureProvider.family<ProductEntity?, String>((ref, id) async {
  final products = await ref.watch(allProductsProvider.future);
  try {
    return products.firstWhere((p) => p.id == id);
  } catch (e) {
    return null;
  }
});

/// Provider de loja por ID - busca de todas as lojas (não só da cidade)
final storeByIdProvider = FutureProvider.family<StoreEntity?, String>((ref, id) async {
  final stores = await ref.watch(allStoresProvider.future);
  try {
    return stores.firstWhere((s) => s.id == id);
  } catch (e) {
    return null;
  }
});

/// Provider para buscar o nome do lojista por ID
final storeNameProvider = FutureProvider.family<String, String>((ref, storeId) async {
  final store = await ref.watch(storeByIdProvider(storeId).future);
  return store?.name ?? 'Loja';
});

final productsByStoreProvider = FutureProvider.family<List<ProductEntity>, String>((ref, storeId) async {
  final products = await ref.watch(productsProvider.future);
  return products.where((p) => p.storeId == storeId).toList();
});

final productImagesProvider = FutureProvider.family<List<ProductImageEntity>, String>((ref, productId) async {
  final getProductImages = getIt<GetProductImages>();
  final result = await getProductImages.call(productId);
  return result.fold(
    (failure) => [],
    (images) => images,
  );
});

/// Provider para lojista selecionado no filtro
final selectedStoreFilterProvider = StateProvider<String?>((ref) => null);

/// Provider de produtos filtrados pelo lojista selecionado
final filteredProductsProvider = FutureProvider<List<ProductEntity>>((ref) async {
  final products = await ref.watch(productsProvider.future);
  final selectedStoreId = ref.watch(selectedStoreFilterProvider);
  
  if (selectedStoreId == null) {
    return products;
  }
  
  return products.where((p) => p.storeId == selectedStoreId).toList();
});
