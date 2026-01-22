import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/product_image_model.dart';
import '../../data/datasources/shop_api.dart';
import '../../../../core/di/injection_container.dart';

final productImagesProvider = FutureProvider<Map<String, String>>((ref) async {
  final api = getIt<ShopApi>();
  final images = await api.getProductImages();
  
  // Criar um mapa de produto_id -> url da imagem principal
  final imageMap = <String, String>{};
  
  for (final image in images) {
    // Pegar apenas a primeira imagem principal de cada produto
    if (image.principal && !imageMap.containsKey(image.produtoId)) {
      imageMap[image.produtoId] = image.url;
    }
  }
  
  // Se não tiver imagem principal, pegar a primeira imagem disponível
  for (final image in images) {
    if (!imageMap.containsKey(image.produtoId)) {
      imageMap[image.produtoId] = image.url;
    }
  }
  
  return imageMap;
});

final productImagesByIdProvider = FutureProvider.family<List<ProductImageModel>, String>((ref, productId) async {
  final api = getIt<ShopApi>();
  return await api.getProductImagesByProductId(productId);
});
