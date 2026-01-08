import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository.dart';

// Repository Provider
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return getIt<CategoryRepository>();
});

// Categories Provider
final categoriesProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  final repository = ref.watch(categoryRepositoryProvider);
  final result = await repository.getCategories();
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (categories) => categories,
  );
});
