import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/product_image_entity.dart';
import '../../domain/repositories/product_image_repository.dart';
import '../datasources/product_image_remote_datasource.dart';

class ProductImageRepositoryImpl implements ProductImageRepository {
  final ProductImageRemoteDataSource _remoteDataSource;

  ProductImageRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ProductImageEntity>>> getProductImagesByProductId(String productId) async {
    try {
      final images = await _remoteDataSource.getProductImagesByProductId(productId);
      return Right(images);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException {
      return const Left(NetworkFailure('Erro de conexão'));
    } catch (e) {
      return Left(ServerFailure('Erro inesperado: ${e.toString()}'));
    }
  }
}
