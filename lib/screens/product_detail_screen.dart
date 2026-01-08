import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            actions: [
              IconButton(icon: Icon(Icons.shopping_basket_outlined), onPressed: () {}),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('R\$ ${product.price.toStringAsFixed(2)}', 
                    style: TextStyle(fontSize: 20, color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.green[100], radius: 12, child: Icon(Icons.store, size: 14, color: Colors.green)),
                      SizedBox(width: 8),
                      Text(product.storeName, style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text('Descrição', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(product.description, style: TextStyle(color: Colors.grey[700], height: 1.5)),
                  SizedBox(height: 24),
                  Text('Localização', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Icon(Icons.map, size: 40, color: Colors.grey)),
                  ),
                  SizedBox(height: 100), // Espaço para o botão inferior
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                  Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(icon: Icon(Icons.add), onPressed: () {}),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Adicionar R\$ ${product.price.toStringAsFixed(2)}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
