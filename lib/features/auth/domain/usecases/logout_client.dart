import '../repositories/auth_repository.dart';

/// Use case para fazer logout do cliente
class LogoutClient {
  final AuthRepository repository;

  LogoutClient(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}
