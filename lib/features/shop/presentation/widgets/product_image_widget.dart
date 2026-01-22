import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/providers/mock_providers.dart';

class ProductImageWidget extends ConsumerWidget {
  final String productId;
  final double width;
  final double height;
  final BoxFit fit;
  final String fallbackUrl;

  const ProductImageWidget({
    super.key,
    required this.productId,
    this.width = 400,
    this.height = 400,
    this.fit = BoxFit.cover,
    this.fallbackUrl = 'https://via.placeholder.com/400x400?text=Produto&bg=FF6B6B&txtcolor=FFFFFF',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesAsync = ref.watch(productImagesProvider(productId));

    return imagesAsync.when(
      data: (images) {
        // Buscar a imagem principal ou primeira imagem
        final mainImage = images.isNotEmpty
            ? images.firstWhere(
                (img) => img.principal,
                orElse: () => images.first,
              )
            : null;

        final imageUrl = mainImage?.url ?? fallbackUrl;

        return Image.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              fallbackUrl,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: height,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                );
              },
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: width,
              height: height,
              color: Colors.grey[300],
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
      loading: () {
        return Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (e, s) {
        return Image.network(
          fallbackUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: width,
              height: height,
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported),
            );
          },
        );
      },
    );
  }
}
