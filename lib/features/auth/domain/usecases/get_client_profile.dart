import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/client_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case para buscar o perfil do cliente logado
class GetClientProfile {
  final AuthRepository repository;

  GetClientProfile(this.repository);

  Future<Either<Failure, ClientEntity>> call(String clientId) {
    return repository.getClientProfile(clientId);
  }

  /// Busca o cliente atual do cache local
  Future<ClientEntity?> getCurrentClient() {
    return repository.getCurrentClient();
  }

  /// Verifica se o usuário está logado
  Future<bool> isLoggedIn() {
    return repository.isLoggedIn();
  }
}
