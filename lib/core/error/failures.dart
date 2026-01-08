import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  
  const Failure(this.message);
  
  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Erro no servidor']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Erro de conexão']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Erro ao acessar cache']);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Dados inválidos']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Não autorizado']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Não encontrado']);
}
