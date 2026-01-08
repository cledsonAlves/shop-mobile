class ServerException implements Exception {
  final String message;
  
  ServerException([this.message = 'Erro no servidor']);
  
  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  
  NetworkException([this.message = 'Erro de conexão']);
  
  @override
  String toString() => message;
}

class CacheException implements Exception {
  final String message;
  
  CacheException([this.message = 'Erro ao acessar cache']);
  
  @override
  String toString() => message;
}

class UnauthorizedException implements Exception {
  final String message;
  
  UnauthorizedException([this.message = 'Não autorizado']);
  
  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final String message;
  
  NotFoundException([this.message = 'Não encontrado']);
  
  @override
  String toString() => message;
}
