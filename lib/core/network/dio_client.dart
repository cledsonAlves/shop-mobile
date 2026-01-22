import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_constants.dart';
import '../../features/auth/data/datasources/auth_manager.dart';

class DioClient {
  late final Dio _dio;
  final AuthManager _authManager = AuthManager();

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Interceptor para adicionar token automaticamente
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _authManager.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          // Se receber 401, remove o token e redireciona para login
          if (error.response?.statusCode == 401) {
            await _authManager.clearAuth();
          }
          return handler.next(error);
        },
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  Dio get dio => _dio;

  // Add auth token to requests
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Remove auth token
  void removeAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
