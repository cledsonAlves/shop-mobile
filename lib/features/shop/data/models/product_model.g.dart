// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      lojistaId: json['lojista_id'] as String,
      categoriaId: json['categoria_id'] as String?,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String?,
      preco: json['preco'] as String,
      precoPromocional: json['preco_promocional'] as String?,
      custo: json['custo'] as String?,
      estoque: (json['estoque'] as num?)?.toInt() ?? 0,
      estoqueMinimo: (json['estoque_minimo'] as num?)?.toInt() ?? 1,
      controlaEstoque: json['controla_estoque'] as bool? ?? true,
      sku: json['sku'] as String?,
      codigoBarras: json['codigo_barras'] as String?,
      ativo: json['ativo'] as bool? ?? true,
      ordem: (json['ordem'] as num?)?.toInt() ?? 0,
      criadoEm: json['criado_em'] as String?,
      atualizadoEm: json['atualizado_em'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lojista_id': instance.lojistaId,
      'categoria_id': instance.categoriaId,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'preco': instance.preco,
      'preco_promocional': instance.precoPromocional,
      'custo': instance.custo,
      'estoque': instance.estoque,
      'estoque_minimo': instance.estoqueMinimo,
      'controla_estoque': instance.controlaEstoque,
      'sku': instance.sku,
      'codigo_barras': instance.codigoBarras,
      'ativo': instance.ativo,
      'ordem': instance.ordem,
      'criado_em': instance.criadoEm,
      'atualizado_em': instance.atualizadoEm,
    };
