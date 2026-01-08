import 'package:flutter/material.dart';
import '../models/models.dart';

class ShopProvider with ChangeNotifier {
  List<Category> _categories = [
    Category(id: '1', name: 'Games', icon: '🎮'),
    Category(id: '2', name: 'Construção', icon: '🛠️'),
    Category(id: '3', name: 'Eletro', icon: '🔌'),
    Category(id: '4', name: 'Roupas', icon: '👕'),
  ];

  List<Store> _stores = [
    Store(
      id: '1',
      name: 'Padaria do João',
      category: 'Padaria • Confeitaria • Centro',
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
      rating: 4.8,
      deliveryTime: '30-45 min',
      deliveryFee: 5.00,
    ),
    Store(
      id: '2',
      name: 'Loja do Zé',
      category: 'Construção & Reparos',
      imageUrl: 'https://images.unsplash.com/photo-1530124560676-587cad321376?w=400',
      rating: 4.5,
      deliveryTime: '20-30 min',
      deliveryFee: 8.00,
    ),
  ];

  List<Product> _products = [
    Product(
      id: '1',
      name: 'Hambúrguer Artesanal Jarinu',
      description: 'O verdadeiro sabor de Jarinu! Pão brioche selado na manteiga de garrafa, blend artesanal de 180g de costela bovina, generosa camada de queijo cheddar inglês derretido, bacon crocante, cebola caramelizada no mel e nossa maionese verde da casa. Acompanha fritas rústicas.',
      price: 28.90,
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
      storeId: '1',
      storeName: 'Lanchonete da Praça',
    ),
    Product(
      id: '2',
      name: 'Smartphone XYZ 128GB',
      description: 'Smartphone de última geração com 128GB de armazenamento.',
      price: 1200.00,
      imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400',
      storeId: '2',
      storeName: 'Tech Jarinu',
    ),
  ];

  List<OrderItem> _cart = [];

  List<Category> get categories => _categories;
  List<Store> get stores => _stores;
  List<Product> get products => _products;
  List<OrderItem> get cart => _cart;

  double get cartTotal => _cart.fold(0, (sum, item) => sum + (item.product.price * item.quantity));

  void addToCart(Product product, int quantity) {
    final index = _cart.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cart[index] = OrderItem(product: product, quantity: _cart[index].quantity + quantity);
    } else {
      _cart.add(OrderItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cart.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
