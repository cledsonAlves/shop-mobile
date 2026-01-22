import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_entity.freezed.dart';

@freezed
class ClientEntity with _$ClientEntity {
  const factory ClientEntity({
    required String id,
    required String nome,
    required String email,
    String? cpf,
    String? telefone,
    String? endereco,
    String? cidade,
    String? estado,
    String? cep,
    @Default(true) bool ativo,
    DateTime? criadoEm,
    DateTime? atualizadoEm,
  }) = _ClientEntity;
}
