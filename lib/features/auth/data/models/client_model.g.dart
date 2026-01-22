// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientModelImpl _$$ClientModelImplFromJson(Map<String, dynamic> json) =>
    _$ClientModelImpl(
      id: json['id'] as String,
      nome: json['nome'] as String,
      email: json['email'] as String,
      cpf: json['cpf'] as String?,
      telefone: json['telefone'] as String?,
      endereco: json['endereco'] as String?,
      cidade: json['cidade'] as String?,
      estado: json['estado'] as String?,
      cep: json['cep'] as String?,
      ativo: json['ativo'] as bool? ?? true,
      criadoEm: json['criado_em'] == null
          ? null
          : DateTime.parse(json['criado_em'] as String),
      atualizadoEm: json['atualizado_em'] == null
          ? null
          : DateTime.parse(json['atualizado_em'] as String),
    );

Map<String, dynamic> _$$ClientModelImplToJson(_$ClientModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'cpf': instance.cpf,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
      'cidade': instance.cidade,
      'estado': instance.estado,
      'cep': instance.cep,
      'ativo': instance.ativo,
      'criado_em': instance.criadoEm?.toIso8601String(),
      'atualizado_em': instance.atualizadoEm?.toIso8601String(),
    };
