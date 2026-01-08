import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/product_entity.dart';

// Cart State Provider
class CartNotifier extends StateNotifier<List<OrderItemEntity>> {
  CartNotifier() : super([]);

  void addToCart(ProductEntity product, int quantity) {
    final existingIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex >= 0) {
      final updatedItem = OrderItemEntity(
        product: product,
        quantity: state[existingIndex].quantity + quantity,
      );
      state = [
        ...state.sublist(0, existingIndex),
        updatedItem,
        ...state.sublist(existingIndex + 1),
      ];
    } else {
      state = [...state, OrderItemEntity(product: product, quantity: quantity)];
    }
  }

  void removeFromCart(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void updateQuantity(String productId, int quantity) {
    final index = state.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        removeFromCart(productId);
      } else {
        final updatedItem = OrderItemEntity(
          product: state[index].product,
          quantity: quantity,
        );
        state = [
          ...state.sublist(0, index),
          updatedItem,
          ...state.sublist(index + 1),
        ];
      }
    }
  }

  void clearCart() {
    state = [];
  }

  double get total {
    return state.fold(
      0.0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }
}

// Cart Provider
final cartProvider = StateNotifierProvider<CartNotifier, List<OrderItemEntity>>((ref) {
  return CartNotifier();
});

// Cart Total Provider
final cartTotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(
    0.0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );
});

// Cart Item Count Provider
final cartItemCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(
    0,
    (sum, item) => sum + item.quantity,
  );
});
