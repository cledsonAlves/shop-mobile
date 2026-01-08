import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/store_entity.dart';

abstract class StoreRepository {
  Future<Either<Failure, List<StoreEntity>>> getStores();
  Future<Either<Failure, StoreEntity>> getStoreById(String id);
}
