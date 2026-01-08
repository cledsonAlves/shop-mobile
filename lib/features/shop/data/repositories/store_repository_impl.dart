import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/repositories/store_repository.dart';
import '../datasources/store_remote_datasource.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreRemoteDataSource _remoteDataSource;

  StoreRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<StoreEntity>>> getStores() async {
    try {
      final stores = await _remoteDataSource.getStores();
      return Right(stores);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException {
      return const Left(NetworkFailure('Erro de conexão'));
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, StoreEntity>> getStoreById(String id) async {
    try {
      final store = await _remoteDataSource.getStoreById(id);
      return Right(store);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure('Loja não encontrada'));
      }
      return const Left(NetworkFailure('Erro de conexão'));
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }
}
