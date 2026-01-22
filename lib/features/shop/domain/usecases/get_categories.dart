import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call({
    String? lojistaId,
    int skip = 0,
    int limit = 20,
  }) async {
    return await repository.getCategories();
  }
}
