import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/client_model.dart';

/// Classe responsável por gerenciar autenticação e armazenamento seguro do token
class AuthManager {
  static const String _tokenKey = 'auth_token';
  static const String _clientKey = 'current_client';
  static const String _clientIdKey = 'client_id';

  SharedPreferences? _prefs;

  Future<SharedPreferences> get _preferences async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  /// Salva o token JWT de forma segura
  Future<void> saveToken(String token) async {
    final prefs = await _preferences;
    await prefs.setString(_tokenKey, token);
  }

  /// Recupera o token JWT armazenado
  Future<String?> getToken() async {
    final prefs = await _preferences;
    return prefs.getString(_tokenKey);
  }

  /// Verifica se existe um token válido armazenado
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Salva os dados do cliente logado
  Future<void> saveClient(ClientModel client) async {
    final prefs = await _preferences;
    await prefs.setString(_clientKey, jsonEncode(client.toJson()));
    await prefs.setString(_clientIdKey, client.id);
  }

  /// Recupera os dados do cliente armazenado
  Future<ClientModel?> getClient() async {
    final prefs = await _preferences;
    final clientJson = prefs.getString(_clientKey);
    if (clientJson == null) return null;
    
    try {
      final json = jsonDecode(clientJson) as Map<String, dynamic>;
      return ClientModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  /// Recupera o ID do cliente logado
  Future<String?> getClientId() async {
    final prefs = await _preferences;
    return prefs.getString(_clientIdKey);
  }

  /// Remove todos os dados de autenticação (logout)
  Future<void> clearAuth() async {
    final prefs = await _preferences;
    await prefs.remove(_tokenKey);
    await prefs.remove(_clientKey);
    await prefs.remove(_clientIdKey);
  }

  /// Decodifica o token JWT e extrai o payload
  Map<String, dynamic>? decodeToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));
      return jsonDecode(decoded) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  /// Verifica se o token está expirado
  Future<bool> isTokenExpired() async {
    final token = await getToken();
    if (token == null) return true;

    final payload = decodeToken(token);
    if (payload == null) return true;

    final exp = payload['exp'] as int?;
    if (exp == null) return false;

    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    return DateTime.now().isAfter(expiryDate);
  }

  /// Recupera o ID do cliente a partir do token JWT
  Future<String?> getClientIdFromToken() async {
    final token = await getToken();
    if (token == null) return null;

    final payload = decodeToken(token);
    if (payload == null) return null;

    // O payload pode ter 'sub' (subject) ou 'client_id' ou 'id'
    return payload['sub'] as String? ?? 
           payload['client_id'] as String? ?? 
           payload['id'] as String?;
  }
}
