// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      id: json['id'] as String,
      nome: json['nome'] as String,
      estado: json['estado'] as String,
      codigoIbge: json['codigo_ibge'] as String?,
      ativo: json['ativo'] as bool? ?? true,
      criadoEm: json['criado_em'] as String?,
      atualizadoEm: json['atualizado_em'] as String?,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'estado': instance.estado,
      'codigo_ibge': instance.codigoIbge,
      'ativo': instance.ativo,
      'criado_em': instance.criadoEm,
      'atualizado_em': instance.atualizadoEm,
    };
