import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/store_entity.dart';
import '../repositories/store_repository.dart';

class GetStores {
  final StoreRepository repository;

  GetStores(this.repository);

  Future<Either<Failure, List<StoreEntity>>> call({
    int skip = 0,
    int limit = 10,
  }) async {
    return await repository.getStores();
  }
}
