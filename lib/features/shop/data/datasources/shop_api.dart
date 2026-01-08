import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/product_model.dart';
import '../models/store_model.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';

class ShopApi {
  final Dio _dio;

  ShopApi(this._dio);

  // Products
  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.products}');
    return (response.data as List).map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<ProductModel> getProductById(String id) async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.products}/$id');
    return ProductModel.fromJson(response.data);
  }

  Future<List<ProductModel>> getProductsByStore(String storeId) async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.products}/store/$storeId');
    return (response.data as List).map((json) => ProductModel.fromJson(json)).toList();
  }

  // Stores
  Future<List<StoreModel>> getStores() async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.stores}');
    return (response.data as List).map((json) => StoreModel.fromJson(json)).toList();
  }

  Future<StoreModel> getStoreById(String id) async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.stores}/$id');
    return StoreModel.fromJson(response.data);
  }

  // Categories
  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.categories}');
    return (response.data as List).map((json) => CategoryModel.fromJson(json)).toList();
  }

  // Orders
  Future<List<OrderModel>> getOrders() async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.orders}');
    return (response.data as List).map((json) => OrderModel.fromJson(json)).toList();
  }

  Future<OrderModel> getOrderById(String id) async {
    final response = await _dio.get('${ApiConstants.baseUrl}${ApiConstants.orders}/$id');
    return OrderModel.fromJson(response.data);
  }

  Future<OrderModel> createOrder(Map<String, dynamic> order) async {
    final response = await _dio.post('${ApiConstants.baseUrl}${ApiConstants.orders}', data: order);
    return OrderModel.fromJson(response.data);
  }

  Future<OrderModel> updateOrderStatus(String id, Map<String, dynamic> status) async {
    final response = await _dio.put('${ApiConstants.baseUrl}${ApiConstants.orders}/$id/status', data: status);
    return OrderModel.fromJson(response.data);
  }
}
