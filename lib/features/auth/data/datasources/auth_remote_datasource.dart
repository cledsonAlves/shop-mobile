import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/client_model.dart';

abstract class AuthRemoteDataSource {
  /// Registra um novo cliente
  Future<ClientModel> registerClient({
    required String nome,
    required String email,
    required String cpf,
    String? telefone,
    String? endereco,
    String? cidade,
    String? estado,
    String? cep,
  });

  /// Realiza login do cliente por CPF (sem senha)
  Future<ClientModel> loginClientByCpf(String cpf);

  /// Busca os dados do cliente por ID
  Future<ClientModel> getClientById(String clientId);

  /// Busca os dados do cliente por email
  Future<ClientModel> getClientByEmail(String email);

  /// Busca os dados do cliente por CPF
  Future<ClientModel> getClientByCpf(String cpf);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<ClientModel> registerClient({
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
      // Nota: Adiciona barra final para evitar redirect 307
      final response = await _dio.post(
        '${ApiConstants.clientes}/',
        data: {
          'nome': nome,
          'email': email,
          'cpf': cpf,
          if (telefone != null) 'telefone': telefone,
          if (endereco != null) 'endereco': endereco,
          if (cidade != null) 'cidade': cidade,
          if (estado != null) 'estado': estado,
          if (cep != null) 'cep': cep,
        },
      );
      return ClientModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final detail = e.response?.data['detail'] ?? 'Erro ao cadastrar cliente';
        throw Exception(detail);
      }
      rethrow;
    }
  }

  @override
  Future<ClientModel> loginClientByCpf(String cpf) async {
    try {
      final response = await _dio.get('${ApiConstants.clientes}/cpf/$cpf');
      return ClientModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('CPF não encontrado. Cadastre-se!');
      }
      rethrow;
    }
  }

  @override
  Future<ClientModel> getClientById(String clientId) async {
    try {
      final response = await _dio.get('${ApiConstants.clientes}/$clientId');
      return ClientModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Cliente não encontrado');
      }
      rethrow;
    }
  }

  @override
  Future<ClientModel> getClientByEmail(String email) async {
    try {
      final response = await _dio.get('${ApiConstants.clientes}/email/$email');
      return ClientModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Cliente não encontrado');
      }
      rethrow;
    }
  }

  @override
  Future<ClientModel> getClientByCpf(String cpf) async {
    try {
      final response = await _dio.get('${ApiConstants.clientes}/cpf/$cpf');
      return ClientModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('CPF não encontrado');
      }
      rethrow;
    }
  }
}
