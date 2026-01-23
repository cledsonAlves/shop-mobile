import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../domain/entities/client_entity.dart';
import '../../domain/usecases/login_client.dart';
import '../../domain/usecases/register_client.dart';
import '../../domain/usecases/get_client_profile.dart';
import '../../domain/usecases/logout_client.dart';

/// Estado de autenticação
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

/// Classe que representa o estado de autenticação
class AuthState {
  final AuthStatus status;
  final ClientEntity? client;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.client,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    ClientEntity? client,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      client: client ?? this.client,
      errorMessage: errorMessage,
    );
  }

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading => status == AuthStatus.loading;
}

/// Notifier para gerenciar estado de autenticação
class AuthNotifier extends StateNotifier<AuthState> {
  final LoginClient _loginClient;
  final RegisterClient _registerClient;
  final GetClientProfile _getClientProfile;
  final LogoutClient _logoutClient;

  AuthNotifier({
    required LoginClient loginClient,
    required RegisterClient registerClient,
    required GetClientProfile getClientProfile,
    required LogoutClient logoutClient,
  })  : _loginClient = loginClient,
        _registerClient = registerClient,
        _getClientProfile = getClientProfile,
        _logoutClient = logoutClient,
        super(const AuthState());

  /// Verifica o estado inicial de autenticação
  Future<void> checkAuthStatus() async {
    state = state.copyWith(status: AuthStatus.loading);

    final isLoggedIn = await _getClientProfile.isLoggedIn();
    
    if (isLoggedIn) {
      final client = await _getClientProfile.getCurrentClient();
      if (client != null) {
        state = AuthState(
          status: AuthStatus.authenticated,
          client: client,
        );
        return;
      }
    }

    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  /// Faz login do cliente por CPF
  Future<bool> loginByCpf(String cpf) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    // Remove formatação do CPF (pontos e traços)
    final cleanCpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    final result = await _loginClient(cleanCpf);

    return result.fold(
      (failure) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: failure.message,
        );
        return false;
      },
      (client) {
        state = AuthState(
          status: AuthStatus.authenticated,
          client: client,
        );
        return true;
      },
    );
  }

  /// Registra um novo cliente
  Future<bool> register({
    required String nome,
    required String email,
    required String cpf,
    String? telefone,
    required String endereco,
    required String cidade,
    required String estado,
    required String cep,
  }) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    // Remove formatação do CPF
    final cleanCpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    final result = await _registerClient(
      nome: nome,
      email: email,
      cpf: cleanCpf,
      telefone: telefone,
      endereco: endereco,
      cidade: cidade,
      estado: estado,
      cep: cep,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        );
        return false;
      },
      (client) {
        // Após registro bem-sucedido, retorna para não autenticado
        // O usuário precisa fazer login com o CPF
        state = const AuthState(status: AuthStatus.unauthenticated);
        return true;
      },
    );
  }

  /// Atualiza o perfil do cliente
  Future<void> refreshProfile() async {
    final currentClient = state.client;
    if (currentClient == null) return;

    final result = await _getClientProfile(currentClient.id);

    result.fold(
      (failure) {
        // Ignora erros silenciosamente, mantém dados em cache
      },
      (client) {
        state = state.copyWith(client: client);
      },
    );
  }

  /// Faz logout do cliente
  Future<void> logout() async {
    await _logoutClient();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  /// Limpa mensagem de erro
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

/// Provider do AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    loginClient: getIt<LoginClient>(),
    registerClient: getIt<RegisterClient>(),
    getClientProfile: getIt<GetClientProfile>(),
    logoutClient: getIt<LogoutClient>(),
  );
});

/// Provider para verificar se o usuário está autenticado
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});

/// Provider para obter o cliente atual
final currentClientProvider = Provider<ClientEntity?>((ref) {
  return ref.watch(authProvider).client;
});
