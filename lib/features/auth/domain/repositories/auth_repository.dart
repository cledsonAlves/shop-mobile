import 'package:dartz/dartz.dart';
import '../entities/client_entity.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  /// Registra um novo cliente
  Future<Either<Failure, ClientEntity>> registerClient({
    required String nome,
    required String email,
    required String cpf,
    String? telefone,
    String? endereco,
    String? cidade,
    String? estado,
    String? cep,
  });

  /// Realiza login por CPF e retorna dados do cliente
  Future<Either<Failure, ClientEntity>> loginClientByCpf(String cpf);

  /// Busca perfil do cliente por ID
  Future<Either<Failure, ClientEntity>> getClientProfile(String clientId);

  /// Busca perfil do cliente por email
  Future<Either<Failure, ClientEntity>> getClientByEmail(String email);

  /// Busca perfil do cliente por CPF
  Future<Either<Failure, ClientEntity>> getClientByCpf(String cpf);

  /// Verifica se o usuário está logado
  Future<bool> isLoggedIn();

  /// Busca o cliente atual do cache
  Future<ClientEntity?> getCurrentClient();

  /// Faz logout do usuário
  Future<void> logout();
}
