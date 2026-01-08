import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/mocks/mock_data.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/entities/product_entity.dart';

// Mock providers that return data directly without API calls
final mockCategoriesProvider = Provider<List<CategoryEntity>>((ref) {
  return MockData.categories;
});

final mockStoresProvider = Provider<List<StoreEntity>>((ref) {
  return MockData.stores;
});

final mockProductsProvider = Provider<List<ProductEntity>>((ref) {
  return MockData.products;
});

final mockOrdersProvider = Provider<List<MockOrderData>>((ref) {
  return MockData.orders;
});

final mockUserProfileProvider = Provider<UserProfile>((ref) {
  return MockData.userProfile;
});

// AsyncValue providers for compatibility with existing code
final categoriesProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return MockData.categories;
});

final storesProvider = FutureProvider<List<StoreEntity>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return MockData.stores;
});

final productsProvider = FutureProvider<List<ProductEntity>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return MockData.products;
});

final productByIdProvider = FutureProvider.family<ProductEntity?, String>((ref, id) async {
  await Future.delayed(const Duration(milliseconds: 200));
  try {
    return MockData.products.firstWhere((p) => p.id == id);
  } catch (e) {
    return null;
  }
});

final storeByIdProvider = FutureProvider.family<StoreEntity?, String>((ref, id) async {
  await Future.delayed(const Duration(milliseconds: 200));
  try {
    return MockData.stores.firstWhere((s) => s.id == id);
  } catch (e) {
    return null;
  }
});

final productsByStoreProvider = FutureProvider.family<List<ProductEntity>, String>((ref, storeId) async {
  await Future.delayed(const Duration(milliseconds: 200));
  return MockData.products.where((p) => p.storeId == storeId).toList();
});
