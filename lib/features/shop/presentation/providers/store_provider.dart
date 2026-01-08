import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/repositories/store_repository.dart';

// Repository Provider
final storeRepositoryProvider = Provider<StoreRepository>((ref) {
  return getIt<StoreRepository>();
});

// Stores List Provider
final storesProvider = FutureProvider<List<StoreEntity>>((ref) async {
  final repository = ref.watch(storeRepositoryProvider);
  final result = await repository.getStores();
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (stores) => stores,
  );
});

// Store by ID Provider
final storeByIdProvider = FutureProvider.family<StoreEntity, String>((ref, id) async {
  final repository = ref.watch(storeRepositoryProvider);
  final result = await repository.getStoreById(id);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (store) => store,
  );
});
