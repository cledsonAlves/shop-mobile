import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/shop_api.dart';
import '../../data/models/order_model.dart';
import '../../data/models/order_item_model.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/product_entity.dart';
import 'mock_providers.dart';

/// Item do carrinho de compras
class CartItem {
  final ProductEntity product;
  int quantity;
  String? observacoes;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.observacoes,
  });

  double get subtotal => product.price * quantity;
}

/// Notifier para gerenciar o carrinho de compras
class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  /// Adiciona um produto ao carrinho
  void addProduct(ProductEntity product, {int quantity = 1, String? observacoes}) {
    final existingIndex = state.indexWhere((item) => item.product.id == product.id);
    
    if (existingIndex >= 0) {
      // Produto já existe, atualiza quantidade
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == existingIndex)
            CartItem(
              product: state[i].product,
              quantity: state[i].quantity + quantity,
              observacoes: observacoes ?? state[i].observacoes,
            )
          else
            state[i],
      ];
    } else {
      // Produto novo
      state = [...state, CartItem(product: product, quantity: quantity, observacoes: observacoes)];
    }
  }

  /// Remove um produto do carrinho
  void removeProduct(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  /// Atualiza a quantidade de um produto
  void updateQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      removeProduct(productId);
      return;
    }
    
    state = [
      for (final item in state)
        if (item.product.id == productId)
          CartItem(product: item.product, quantity: quantity, observacoes: item.observacoes)
        else
          item,
    ];
  }

  /// Limpa o carrinho
  void clear() {
    state = [];
  }

  /// Total do carrinho
  double get total => state.fold(0, (sum, item) => sum + item.subtotal);

  /// Quantidade total de itens
  int get itemCount => state.fold(0, (sum, item) => sum + item.quantity);

  /// Verifica se um produto está no carrinho
  bool hasProduct(String productId) {
    return state.any((item) => item.product.id == productId);
  }

  /// Obtém a quantidade de um produto no carrinho
  int getQuantity(String productId) {
    final item = state.where((item) => item.product.id == productId).firstOrNull;
    return item?.quantity ?? 0;
  }
}

/// Provider do carrinho de compras
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

/// Provider do total do carrinho
final cartTotalProvider = Provider<double>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0, (sum, item) => sum + item.subtotal);
});

/// Provider da quantidade de itens no carrinho
final cartItemCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0, (sum, item) => sum + item.quantity);
});

/// Provider para buscar pedidos do cliente logado
final clientOrdersProvider = FutureProvider<List<OrderEntity>>((ref) async {
  final authState = ref.watch(authProvider);
  
  if (!authState.isAuthenticated || authState.client == null) {
    return [];
  }
  
  final shopApi = getIt<ShopApi>();
  final orders = await shopApi.getOrdersByClientId(authState.client!.id);
  return orders.map((o) => o.toEntity()).toList();
});

/// Provider para buscar pedidos ativos do cliente
final activeOrdersProvider = FutureProvider<List<OrderEntity>>((ref) async {
  final orders = await ref.watch(clientOrdersProvider.future);
  return orders.where((o) => o.isActive).toList();
});

/// Provider para buscar pedidos concluídos do cliente
final completedOrdersProvider = FutureProvider<List<OrderEntity>>((ref) async {
  final orders = await ref.watch(clientOrdersProvider.future);
  return orders.where((o) => !o.isActive).toList();
});

/// Provider para buscar um pedido específico por ID
final orderByIdProvider = FutureProvider.family<OrderEntity?, String>((ref, orderId) async {
  final shopApi = getIt<ShopApi>();
  try {
    final order = await shopApi.getOrderById(orderId);
    return order.toEntity();
  } catch (e) {
    return null;
  }
});

/// Estado de criação de pedido
enum CreateOrderStatus { initial, loading, success, error }

class CreateOrderState {
  final CreateOrderStatus status;
  final OrderEntity? order;
  final String? errorMessage;

  const CreateOrderState({
    this.status = CreateOrderStatus.initial,
    this.order,
    this.errorMessage,
  });

  CreateOrderState copyWith({
    CreateOrderStatus? status,
    OrderEntity? order,
    String? errorMessage,
  }) {
    return CreateOrderState(
      status: status ?? this.status,
      order: order ?? this.order,
      errorMessage: errorMessage,
    );
  }
}

/// Notifier para criar pedidos
class CreateOrderNotifier extends StateNotifier<CreateOrderState> {
  final Ref _ref;

  CreateOrderNotifier(this._ref) : super(const CreateOrderState());

  /// Cria um pedido a partir do carrinho
  Future<OrderEntity?> createOrderFromCart({
    String? observacoes,
    double taxaEntrega = 0,
    double desconto = 0,
    String? formaPagamento,
    String? enderecoEntrega,
    String? cidadeEntrega,
    String? estadoEntrega,
    String? cepEntrega,
  }) async {
    final authState = _ref.read(authProvider);
    final cart = _ref.read(cartProvider);

    if (!authState.isAuthenticated || authState.client == null) {
      state = state.copyWith(
        status: CreateOrderStatus.error,
        errorMessage: 'Usuário não autenticado',
      );
      return null;
    }

    if (cart.isEmpty) {
      state = state.copyWith(
        status: CreateOrderStatus.error,
        errorMessage: 'Carrinho vazio',
      );
      return null;
    }

    // Valida campos de endereço obrigatórios
    final endereco = enderecoEntrega ?? authState.client!.endereco;
    final cidade = cidadeEntrega ?? authState.client!.cidade;
    final estado = estadoEntrega ?? authState.client!.estado;
    final cep = cepEntrega ?? authState.client!.cep;

    if (endereco == null || endereco.isEmpty ||
        cidade == null || cidade.isEmpty ||
        estado == null || estado.isEmpty ||
        cep == null || cep.isEmpty) {
      state = state.copyWith(
        status: CreateOrderStatus.error,
        errorMessage: 'Preencha o endereço de entrega completo',
      );
      return null;
    }

    // Verifica se todos os itens são do mesmo lojista
    final lojistaIds = cart.map((item) => item.product.storeId).toSet();
    if (lojistaIds.length > 1) {
      state = state.copyWith(
        status: CreateOrderStatus.error,
        errorMessage: 'Itens de lojistas diferentes. Finalize um pedido por vez.',
      );
      return null;
    }

    state = state.copyWith(status: CreateOrderStatus.loading);

    try {
      final client = authState.client!;
      final lojistaId = cart.first.product.storeId;

      final orderCreate = OrderCreateModel(
        clienteId: client.id,
        lojistaId: lojistaId,
        enderecoEntrega: endereco,
        cidadeEntrega: cidade,
        estadoEntrega: estado,
        cepEntrega: cep,
        formaPagamento: formaPagamento ?? 'pix',
        observacoes: observacoes,
        taxaEntrega: taxaEntrega,
        desconto: desconto,
        itens: cart.map((item) => OrderItemCreateModel(
          produtoId: item.product.id,
          quantidade: item.quantity,
          observacoes: item.observacoes,
        )).toList(),
      );

      final shopApi = getIt<ShopApi>();
      final orderModel = await shopApi.createOrder(orderCreate);
      final order = orderModel.toEntity();

      // Limpa o carrinho após sucesso
      _ref.read(cartProvider.notifier).clear();

      // Invalida o cache de pedidos
      _ref.invalidate(clientOrdersProvider);

      state = state.copyWith(
        status: CreateOrderStatus.success,
        order: order,
      );

      return order;
    } on DioException catch (e) {
      String errorMessage = 'Erro ao criar pedido';
      
      if (e.response?.statusCode == 400) {
        // Estoque insuficiente ou dados inválidos
        final detail = e.response?.data['detail'];
        if (detail is String) {
          errorMessage = detail;
        } else if (detail is List && detail.isNotEmpty) {
          errorMessage = detail.map((d) => d['msg'] ?? d.toString()).join(', ');
        } else {
          errorMessage = 'Estoque insuficiente ou dados inválidos';
        }
      } else if (e.response?.statusCode == 422) {
        errorMessage = 'Campos obrigatórios faltando';
      } else if (e.response?.statusCode == 404) {
        errorMessage = 'Produto ou cliente não encontrado';
      }
      
      print('Erro ao criar pedido: $errorMessage');
      print('Response: ${e.response?.data}');
      
      state = state.copyWith(
        status: CreateOrderStatus.error,
        errorMessage: errorMessage,
      );
      return null;
    } catch (e) {
      state = state.copyWith(
        status: CreateOrderStatus.error,
        errorMessage: e.toString(),
      );
      return null;
    }
  }

  /// Reseta o estado
  void reset() {
    state = const CreateOrderState();
  }
}

/// Provider para criar pedidos
final createOrderProvider = StateNotifierProvider<CreateOrderNotifier, CreateOrderState>((ref) {
  return CreateOrderNotifier(ref);
});

/// Provider para cancelar um pedido
final cancelOrderProvider = FutureProvider.family<void, String>((ref, orderId) async {
  final shopApi = getIt<ShopApi>();
  await shopApi.cancelOrder(orderId);
  // Invalida o cache de pedidos
  ref.invalidate(clientOrdersProvider);
});
