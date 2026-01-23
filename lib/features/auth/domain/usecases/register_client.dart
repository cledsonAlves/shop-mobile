import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/client_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case para registrar um novo cliente
class RegisterClient {
  final AuthRepository repository;

  RegisterClient(this.repository);

  Future<Either<Failure, ClientEntity>> call({
    required String nome,
    required String email,
    required String cpf,
    String? telefone,
    required String endereco,
    required String cidade,
    required String estado,
    required String cep,
  }) {
    return repository.registerClient(
      nome: nome,
      email: email,
      cpf: cpf,
      telefone: telefone,
      endereco: endereco,
      cidade: cidade,
      estado: estado,
      cep: cep,
    );
  }
}
