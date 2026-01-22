import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/client_entity.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

@freezed
class ClientModel with _$ClientModel {
  const ClientModel._();

  const factory ClientModel({
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
    @JsonKey(name: 'criado_em') DateTime? criadoEm,
    @JsonKey(name: 'atualizado_em') DateTime? atualizadoEm,
  }) = _ClientModel;

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  ClientEntity toEntity() {
    return ClientEntity(
      id: id,
      nome: nome,
      email: email,
      cpf: cpf,
      telefone: telefone,
      endereco: endereco,
      cidade: cidade,
      estado: estado,
      cep: cep,
      ativo: ativo,
      criadoEm: criadoEm,
      atualizadoEm: atualizadoEm,
    );
  }
}
