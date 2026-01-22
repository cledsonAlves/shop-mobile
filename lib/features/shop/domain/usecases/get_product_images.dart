import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_image_entity.dart';
import '../repositories/product_image_repository.dart';

class GetProductImages {
  final ProductImageRepository repository;

  GetProductImages(this.repository);

  Future<Either<Failure, List<ProductImageEntity>>> call(String productId) async {
    return await repository.getProductImagesByProductId(productId);
  }
}
