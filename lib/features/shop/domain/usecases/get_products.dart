import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call({
    String? lojistaId,
    String? categoriaId,
    int skip = 0,
    int limit = 50,
  }) async {
    return await repository.getProducts();
  }
}
