import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(product.imageUrl, width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(product.name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 4),
                  Text('R\$ ${product.price.toStringAsFixed(2)}', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        textStyle: TextStyle(fontSize: 12),
                      ),
                      child: Text('Adicionar'),
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
