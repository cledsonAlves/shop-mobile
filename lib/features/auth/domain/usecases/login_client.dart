import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/client_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case para fazer login do cliente por CPF
class LoginClient {
  final AuthRepository repository;

  LoginClient(this.repository);

  Future<Either<Failure, ClientEntity>> call(String cpf) {
    return repository.loginClientByCpf(cpf);
  }
}
