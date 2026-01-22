// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreModelImpl _$$StoreModelImplFromJson(Map<String, dynamic> json) =>
    _$StoreModelImpl(
      id: json['id'] as String,
      nome: json['nome'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String?,
      provider: json['provider'] as String?,
      cidadeId: json['cidade_id'] as String?,
      telefone: json['telefone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      endereco: json['endereco'] as String?,
      numero: json['numero'] as String?,
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String?,
      cep: json['cep'] as String?,
      descricao: json['descricao'] as String?,
      logoUrl: json['logo_url'] as String?,
      horarioFuncionamento: json['horario_funcionamento'] as String?,
      ativo: json['ativo'] as bool? ?? true,
      criadoEm: json['criado_em'] as String?,
      atualizadoEm: json['atualizado_em'] as String?,
    );

Map<String, dynamic> _$$StoreModelImplToJson(_$StoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'provider': instance.provider,
      'cidade_id': instance.cidadeId,
      'telefone': instance.telefone,
      'whatsapp': instance.whatsapp,
      'endereco': instance.endereco,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'cep': instance.cep,
      'descricao': instance.descricao,
      'logo_url': instance.logoUrl,
      'horario_funcionamento': instance.horarioFuncionamento,
      'ativo': instance.ativo,
      'criado_em': instance.criadoEm,
      'atualizado_em': instance.atualizadoEm,
    };
