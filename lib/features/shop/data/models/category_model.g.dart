// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String,
      lojistaId: json['lojista_id'] as String,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String?,
      ativo: json['ativo'] as bool? ?? true,
      ordem: (json['ordem'] as num?)?.toInt() ?? 0,
      criadoEm: json['criado_em'] as String?,
      atualizadoEm: json['atualizado_em'] as String?,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lojista_id': instance.lojistaId,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'ativo': instance.ativo,
      'ordem': instance.ordem,
      'criado_em': instance.criadoEm,
      'atualizado_em': instance.atualizadoEm,
    };
