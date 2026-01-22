import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../../domain/entities/product_entity.dart';
import '../providers/cart_provider.dart';
import 'product_image_widget.dart';

class ProductCard extends ConsumerWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.push('/product/${product.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                width: double.infinity,
                height: 140,
                child: ProductImageWidget(
                  productId: product.id,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Product info
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.category != null)
                    Text(
                      product.category!,
                      style: TextStyle(fontSize: 9, color: Colors.grey[600], fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, height: 1.2),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ref.read(cartProvider.notifier).addProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} adicionado'),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      icon: Icon(Icons.add_shopping_cart, size: 14, color: AppTheme.primaryColor),
                      label: Text('Adicionar', style: TextStyle(fontSize: 11, color: AppTheme.primaryColor)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppTheme.primaryColor, width: 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
