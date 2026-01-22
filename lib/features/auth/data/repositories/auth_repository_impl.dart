import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/client_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_manager.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthManager authManager;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.authManager,
  });

  @override
  Future<Either<Failure, ClientEntity>> registerClient({
    required String nome,
    required String email,
    required String cpf,
    String? telefone,
    String? endereco,
    String? cidade,
    String? estado,
    String? cep,
  }) async {
    try {
      final clientModel = await remoteDataSource.registerClient(
        nome: nome,
        email: email,
        cpf: cpf,
        telefone: telefone,
        endereco: endereco,
        cidade: cidade,
        estado: estado,
        cep: cep,
      );
      return Right(clientModel.toEntity());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Left(NetworkFailure('Tempo de conexão esgotado'));
      }
      if (e.response?.statusCode == 400) {
        final detail = e.response?.data['detail'] ?? 'Erro ao cadastrar';
        return Left(ValidationFailure(detail.toString()));
      }
      return Left(ServerFailure(e.message ?? 'Erro ao registrar cliente'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ClientEntity>> loginClientByCpf(String cpf) async {
    try {
      final clientModel = await remoteDataSource.loginClientByCpf(cpf);
      
      // Salva os dados do cliente no cache local
      await authManager.saveClient(clientModel);
      // Salva o ID do cliente como "token" para manter a sessão
      await authManager.saveToken(clientModel.id);

      return Right(clientModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure('CPF não encontrado. Cadastre-se!'));
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Left(NetworkFailure('Tempo de conexão esgotado'));
      }
      return Left(ServerFailure(e.message ?? 'Erro ao fazer login'));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ClientEntity>> getClientProfile(String clientId) async {
    try {
      final clientModel = await remoteDataSource.getClientById(clientId);
      // Atualiza o cache local
      await authManager.saveClient(clientModel);
      return Right(clientModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure('Cliente não encontrado'));
      }
      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure('Sessão expirada'));
      }
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Left(NetworkFailure('Tempo de conexão esgotado'));
      }
      return Left(ServerFailure(e.message ?? 'Erro ao buscar perfil'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ClientEntity>> getClientByEmail(String email) async {
    try {
      final clientModel = await remoteDataSource.getClientByEmail(email);
      return Right(clientModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure('Cliente não encontrado'));
      }
      return Left(ServerFailure(e.message ?? 'Erro ao buscar cliente'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ClientEntity>> getClientByCpf(String cpf) async {
    try {
      final clientModel = await remoteDataSource.getClientByCpf(cpf);
      return Right(clientModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure('CPF não encontrado'));
      }
      return Left(ServerFailure(e.message ?? 'Erro ao buscar cliente'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final hasToken = await authManager.hasToken();
    if (!hasToken) return false;

    // Verifica se ainda há cliente salvo
    final client = await authManager.getClient();
    return client != null;
  }

  @override
  Future<ClientEntity?> getCurrentClient() async {
    final clientModel = await authManager.getClient();
    return clientModel?.toEntity();
  }

  @override
  Future<void> logout() async {
    await authManager.clearAuth();
  }
}
