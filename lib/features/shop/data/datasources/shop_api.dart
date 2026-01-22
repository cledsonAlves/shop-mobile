import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/product_model.dart';
import '../models/product_image_model.dart';
import '../models/store_model.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';
import '../models/order_item_model.dart';
import '../models/city_model.dart';
import '../models/payment_model.dart';

class ShopApi {
  final Dio _dio;

  ShopApi(this._dio);

  // Cities (Cidades)
  Future<List<CityModel>> getCities({int skip = 0, int limit = 100}) async {
    try {
      final response = await _dio.get(
        ApiConstants.cidades,
        queryParameters: {'skip': skip, 'limit': limit},
      );
      return (response.data as List).map((json) => CityModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar cidades: $e');
      rethrow;
    }
  }

  Future<CityModel> getCityById(String id) async {
    try {
      final response = await _dio.get('${ApiConstants.cidades}/$id');
      return CityModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar cidade: $e');
      rethrow;
    }
  }

  // Products
  Future<List<ProductModel>> getProducts({
    String? lojistaId,
    String? categoriaId,
    int skip = 0,
    int limit = 50,
  }) async {
    try {
      final params = {
        'skip': skip,
        'limit': limit,
        if (lojistaId != null) 'lojista_id': lojistaId,
        if (categoriaId != null) 'categoria_id': categoriaId,
      };
      final response = await _dio.get(ApiConstants.produtos, queryParameters: params);
      return (response.data as List).map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar produtos: $e');
      rethrow;
    }
  }

  Future<ProductModel> getProductById(String id) async {
    try {
      final response = await _dio.get('${ApiConstants.produtos}/$id');
      return ProductModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar produto: $e');
      rethrow;
    }
  }

  Future<List<ProductModel>> getProductsByStore(String storeId) async {
    try {
      return getProducts(lojistaId: storeId);
    } catch (e) {
      print('Erro ao buscar produtos da loja: $e');
      rethrow;
    }
  }

  // Product Images
  Future<List<ProductImageModel>> getProductImages() async {
    try {
      final response = await _dio.get(ApiConstants.produtoImagens);
      return (response.data as List).map((json) => ProductImageModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar imagens dos produtos: $e');
      rethrow;
    }
  }

  Future<List<ProductImageModel>> getProductImagesByProductId(String productId) async {
    try {
      final response = await _dio.get(
        ApiConstants.produtoImagens,
        queryParameters: {'produto_id': productId},
      );
      return (response.data as List).map((json) => ProductImageModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar imagens do produto: $e');
      rethrow;
    }
  }

  // Stores (Lojistas)
  Future<List<StoreModel>> getStores({
    String? cidadeId,
    int skip = 0, 
    int limit = 50,
  }) async {
    try {
      final params = {
        'skip': skip,
        'limit': limit,
        if (cidadeId != null) 'cidade_id': cidadeId,
      };
      final response = await _dio.get(
        ApiConstants.lojistas,
        queryParameters: params,
      );
      return (response.data as List).map((json) => StoreModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar lojas: $e');
      rethrow;
    }
  }

  Future<List<StoreModel>> getStoresByCity(String cidadeId) async {
    return getStores(cidadeId: cidadeId);
  }

  Future<StoreModel> getStoreById(String id) async {
    try {
      final response = await _dio.get('${ApiConstants.lojistas}/$id');
      return StoreModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar loja: $e');
      rethrow;
    }
  }

  // Categories (Categorias)
  Future<List<CategoryModel>> getCategories({
    String? lojistaId,
    int skip = 0,
    int limit = 20,
  }) async {
    try {
      final params = {
        'skip': skip,
        'limit': limit,
        if (lojistaId != null) 'lojista_id': lojistaId,
      };
      final response = await _dio.get(ApiConstants.categorias, queryParameters: params);
      return (response.data as List).map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar categorias: $e');
      rethrow;
    }
  }

  Future<CategoryModel> getCategoryById(String id) async {
    try {
      final response = await _dio.get('${ApiConstants.categorias}/$id');
      return CategoryModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar categoria: $e');
      rethrow;
    }
  }

  // Orders (Pedidos)
  Future<List<OrderModel>> getOrders({
    String? clienteId,
    String? lojistaId,
    String? status,
    int skip = 0, 
    int limit = 50,
  }) async {
    try {
      final params = {
        'skip': skip,
        'limit': limit,
        if (clienteId != null) 'cliente_id': clienteId,
        if (lojistaId != null) 'lojista_id': lojistaId,
        if (status != null) 'status': status,
      };
      final response = await _dio.get(
        ApiConstants.pedidos,
        queryParameters: params,
      );
      return (response.data as List).map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar pedidos: $e');
      rethrow;
    }
  }

  /// Busca pedidos de um cliente específico
  Future<List<OrderModel>> getOrdersByClientId(String clienteId) async {
    try {
      final response = await _dio.get(ApiConstants.pedidosCliente(clienteId));
      return (response.data as List).map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar pedidos do cliente: $e');
      rethrow;
    }
  }

  Future<OrderModel> getOrderById(String id) async {
    try {
      final response = await _dio.get('${ApiConstants.pedidos}/$id');
      return OrderModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar pedido: $e');
      rethrow;
    }
  }

  /// Cria um novo pedido
  Future<OrderModel> createOrder(OrderCreateModel order) async {
    try {
      final jsonData = order.toJson();
      print('Enviando pedido: $jsonData');
      final response = await _dio.post(
        '${ApiConstants.pedidos}/',
        data: jsonData,
      );
      return OrderModel.fromJson(response.data);
    } on DioException catch (e) {
      print('Erro ao criar pedido: $e');
      if (e.response != null) {
        print('Response data: ${e.response?.data}');
        print('Response status: ${e.response?.statusCode}');
      }
      rethrow;
    } catch (e) {
      print('Erro ao criar pedido: $e');
      rethrow;
    }
  }

  /// Atualiza o status de um pedido
  Future<OrderModel> updateOrderStatus(String id, String status) async {
    try {
      final response = await _dio.patch(
        ApiConstants.pedidoStatus(id),
        queryParameters: {'status': status},
      );
      return OrderModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao atualizar status do pedido: $e');
      rethrow;
    }
  }

  /// Cancela um pedido (devolve estoque automaticamente)
  Future<void> cancelOrder(String id) async {
    try {
      await _dio.delete('${ApiConstants.pedidos}/$id');
    } catch (e) {
      print('Erro ao cancelar pedido: $e');
      rethrow;
    }
  }

  // ==================== PAGAMENTOS ====================

  /// Cria uma preferência de pagamento no Mercado Pago
  Future<PaymentPreferenceResponse> createPaymentPreference(String pedidoId) async {
    try {
      final response = await _dio.post(
        ApiConstants.criarPreferencia,
        data: {'pedido_id': pedidoId},
      );
      return PaymentPreferenceResponse.fromJson(response.data);
    } catch (e) {
      print('Erro ao criar preferência de pagamento: $e');
      rethrow;
    }
  }

  /// Consulta o pagamento de um pedido
  Future<PaymentModel?> getPaymentByOrder(String pedidoId) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.pagamentos}/pedido/$pedidoId',
      );
      return PaymentModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar pagamento: $e');
      return null;
    }
  }

  /// Consulta um pagamento pelo ID
  Future<PaymentModel?> getPayment(String pagamentoId) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.pagamentos}/$pagamentoId',
      );
      return PaymentModel.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar pagamento: $e');
      return null;
    }
  }
}
