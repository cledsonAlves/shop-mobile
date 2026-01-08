import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

// Repository Provider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return getIt<ProductRepository>();
});

// Products List Provider
final productsProvider = FutureProvider<List<ProductEntity>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final result = await repository.getProducts();
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (products) => products,
  );
});

// Product by ID Provider
final productByIdProvider = FutureProvider.family<ProductEntity, String>((ref, id) async {
  final repository = ref.watch(productRepositoryProvider);
  final result = await repository.getProductById(id);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (product) => product,
  );
});

// Products by Store Provider
final productsByStoreProvider = FutureProvider.family<List<ProductEntity>, String>((ref, storeId) async {
  final repository = ref.watch(productRepositoryProvider);
  final result = await repository.getProductsByStore(storeId);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (products) => products,
  );
});
