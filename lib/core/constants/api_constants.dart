class ApiConstants {
  static const String baseUrl = 'https://api.jarinushop.com/v1';
  
  // Endpoints
  static const String products = '/products';
  static const String stores = '/stores';
  static const String categories = '/categories';
  static const String orders = '/orders';
  static const String auth = '/auth';
  
  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
