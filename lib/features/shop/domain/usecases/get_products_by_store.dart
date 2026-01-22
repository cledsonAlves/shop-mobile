import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsByStore {
  final ProductRepository repository;

  GetProductsByStore(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(String storeId) async {
    return await repository.getProductsByStore(storeId);
  }
}
