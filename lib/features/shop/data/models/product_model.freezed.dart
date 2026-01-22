// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'lojista_id')
  String get lojistaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoria_id')
  String? get categoriaId => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  String get preco => throw _privateConstructorUsedError;
  @JsonKey(name: 'preco_promocional')
  String? get precoPromocional => throw _privateConstructorUsedError;
  String? get custo => throw _privateConstructorUsedError;
  int get estoque => throw _privateConstructorUsedError;
  @JsonKey(name: 'estoque_minimo')
  int get estoqueMinimo => throw _privateConstructorUsedError;
  @JsonKey(name: 'controla_estoque')
  bool get controlaEstoque => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_barras')
  String? get codigoBarras => throw _privateConstructorUsedError;
  bool get ativo => throw _privateConstructorUsedError;
  int get ordem => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  String? get criadoEm => throw _privateConstructorUsedError;
  @JsonKey(name: 'atualizado_em')
  String? get atualizadoEm => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'lojista_id') String lojistaId,
      @JsonKey(name: 'categoria_id') String? categoriaId,
      String nome,
      String? descricao,
      String preco,
      @JsonKey(name: 'preco_promocional') String? precoPromocional,
      String? custo,
      int estoque,
      @JsonKey(name: 'estoque_minimo') int estoqueMinimo,
      @JsonKey(name: 'controla_estoque') bool controlaEstoque,
      String? sku,
      @JsonKey(name: 'codigo_barras') String? codigoBarras,
      bool ativo,
      int ordem,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lojistaId = null,
    Object? categoriaId = freezed,
    Object? nome = null,
    Object? descricao = freezed,
    Object? preco = null,
    Object? precoPromocional = freezed,
    Object? custo = freezed,
    Object? estoque = null,
    Object? estoqueMinimo = null,
    Object? controlaEstoque = null,
    Object? sku = freezed,
    Object? codigoBarras = freezed,
    Object? ativo = null,
    Object? ordem = null,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lojistaId: null == lojistaId
          ? _value.lojistaId
          : lojistaId // ignore: cast_nullable_to_non_nullable
              as String,
      categoriaId: freezed == categoriaId
          ? _value.categoriaId
          : categoriaId // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      preco: null == preco
          ? _value.preco
          : preco // ignore: cast_nullable_to_non_nullable
              as String,
      precoPromocional: freezed == precoPromocional
          ? _value.precoPromocional
          : precoPromocional // ignore: cast_nullable_to_non_nullable
              as String?,
      custo: freezed == custo
          ? _value.custo
          : custo // ignore: cast_nullable_to_non_nullable
              as String?,
      estoque: null == estoque
          ? _value.estoque
          : estoque // ignore: cast_nullable_to_non_nullable
              as int,
      estoqueMinimo: null == estoqueMinimo
          ? _value.estoqueMinimo
          : estoqueMinimo // ignore: cast_nullable_to_non_nullable
              as int,
      controlaEstoque: null == controlaEstoque
          ? _value.controlaEstoque
          : controlaEstoque // ignore: cast_nullable_to_non_nullable
              as bool,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      codigoBarras: freezed == codigoBarras
          ? _value.codigoBarras
          : codigoBarras // ignore: cast_nullable_to_non_nullable
              as String?,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      ordem: null == ordem
          ? _value.ordem
          : ordem // ignore: cast_nullable_to_non_nullable
              as int,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as String?,
      atualizadoEm: freezed == atualizadoEm
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'lojista_id') String lojistaId,
      @JsonKey(name: 'categoria_id') String? categoriaId,
      String nome,
      String? descricao,
      String preco,
      @JsonKey(name: 'preco_promocional') String? precoPromocional,
      String? custo,
      int estoque,
      @JsonKey(name: 'estoque_minimo') int estoqueMinimo,
      @JsonKey(name: 'controla_estoque') bool controlaEstoque,
      String? sku,
      @JsonKey(name: 'codigo_barras') String? codigoBarras,
      bool ativo,
      int ordem,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lojistaId = null,
    Object? categoriaId = freezed,
    Object? nome = null,
    Object? descricao = freezed,
    Object? preco = null,
    Object? precoPromocional = freezed,
    Object? custo = freezed,
    Object? estoque = null,
    Object? estoqueMinimo = null,
    Object? controlaEstoque = null,
    Object? sku = freezed,
    Object? codigoBarras = freezed,
    Object? ativo = null,
    Object? ordem = null,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lojistaId: null == lojistaId
          ? _value.lojistaId
          : lojistaId // ignore: cast_nullable_to_non_nullable
              as String,
      categoriaId: freezed == categoriaId
          ? _value.categoriaId
          : categoriaId // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      preco: null == preco
          ? _value.preco
          : preco // ignore: cast_nullable_to_non_nullable
              as String,
      precoPromocional: freezed == precoPromocional
          ? _value.precoPromocional
          : precoPromocional // ignore: cast_nullable_to_non_nullable
              as String?,
      custo: freezed == custo
          ? _value.custo
          : custo // ignore: cast_nullable_to_non_nullable
              as String?,
      estoque: null == estoque
          ? _value.estoque
          : estoque // ignore: cast_nullable_to_non_nullable
              as int,
      estoqueMinimo: null == estoqueMinimo
          ? _value.estoqueMinimo
          : estoqueMinimo // ignore: cast_nullable_to_non_nullable
              as int,
      controlaEstoque: null == controlaEstoque
          ? _value.controlaEstoque
          : controlaEstoque // ignore: cast_nullable_to_non_nullable
              as bool,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      codigoBarras: freezed == codigoBarras
          ? _value.codigoBarras
          : codigoBarras // ignore: cast_nullable_to_non_nullable
              as String?,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
      ordem: null == ordem
          ? _value.ordem
          : ordem // ignore: cast_nullable_to_non_nullable
              as int,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as String?,
      atualizadoEm: freezed == atualizadoEm
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl extends _ProductModel {
  const _$ProductModelImpl(
      {required this.id,
      @JsonKey(name: 'lojista_id') required this.lojistaId,
      @JsonKey(name: 'categoria_id') this.categoriaId,
      required this.nome,
      this.descricao,
      required this.preco,
      @JsonKey(name: 'preco_promocional') this.precoPromocional,
      this.custo,
      this.estoque = 0,
      @JsonKey(name: 'estoque_minimo') this.estoqueMinimo = 1,
      @JsonKey(name: 'controla_estoque') this.controlaEstoque = true,
      this.sku,
      @JsonKey(name: 'codigo_barras') this.codigoBarras,
      this.ativo = true,
      this.ordem = 0,
      @JsonKey(name: 'criado_em') this.criadoEm,
      @JsonKey(name: 'atualizado_em') this.atualizadoEm})
      : super._();

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'lojista_id')
  final String lojistaId;
  @override
  @JsonKey(name: 'categoria_id')
  final String? categoriaId;
  @override
  final String nome;
  @override
  final String? descricao;
  @override
  final String preco;
  @override
  @JsonKey(name: 'preco_promocional')
  final String? precoPromocional;
  @override
  final String? custo;
  @override
  @JsonKey()
  final int estoque;
  @override
  @JsonKey(name: 'estoque_minimo')
  final int estoqueMinimo;
  @override
  @JsonKey(name: 'controla_estoque')
  final bool controlaEstoque;
  @override
  final String? sku;
  @override
  @JsonKey(name: 'codigo_barras')
  final String? codigoBarras;
  @override
  @JsonKey()
  final bool ativo;
  @override
  @JsonKey()
  final int ordem;
  @override
  @JsonKey(name: 'criado_em')
  final String? criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  final String? atualizadoEm;

  @override
  String toString() {
    return 'ProductModel(id: $id, lojistaId: $lojistaId, categoriaId: $categoriaId, nome: $nome, descricao: $descricao, preco: $preco, precoPromocional: $precoPromocional, custo: $custo, estoque: $estoque, estoqueMinimo: $estoqueMinimo, controlaEstoque: $controlaEstoque, sku: $sku, codigoBarras: $codigoBarras, ativo: $ativo, ordem: $ordem, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lojistaId, lojistaId) ||
                other.lojistaId == lojistaId) &&
            (identical(other.categoriaId, categoriaId) ||
                other.categoriaId == categoriaId) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.preco, preco) || other.preco == preco) &&
            (identical(other.precoPromocional, precoPromocional) ||
                other.precoPromocional == precoPromocional) &&
            (identical(other.custo, custo) || other.custo == custo) &&
            (identical(other.estoque, estoque) || other.estoque == estoque) &&
            (identical(other.estoqueMinimo, estoqueMinimo) ||
                other.estoqueMinimo == estoqueMinimo) &&
            (identical(other.controlaEstoque, controlaEstoque) ||
                other.controlaEstoque == controlaEstoque) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.codigoBarras, codigoBarras) ||
                other.codigoBarras == codigoBarras) &&
            (identical(other.ativo, ativo) || other.ativo == ativo) &&
            (identical(other.ordem, ordem) || other.ordem == ordem) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                other.atualizadoEm == atualizadoEm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      lojistaId,
      categoriaId,
      nome,
      descricao,
      preco,
      precoPromocional,
      custo,
      estoque,
      estoqueMinimo,
      controlaEstoque,
      sku,
      codigoBarras,
      ativo,
      ordem,
      criadoEm,
      atualizadoEm);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
          {required final String id,
          @JsonKey(name: 'lojista_id') required final String lojistaId,
          @JsonKey(name: 'categoria_id') final String? categoriaId,
          required final String nome,
          final String? descricao,
          required final String preco,
          @JsonKey(name: 'preco_promocional') final String? precoPromocional,
          final String? custo,
          final int estoque,
          @JsonKey(name: 'estoque_minimo') final int estoqueMinimo,
          @JsonKey(name: 'controla_estoque') final bool controlaEstoque,
          final String? sku,
          @JsonKey(name: 'codigo_barras') final String? codigoBarras,
          final bool ativo,
          final int ordem,
          @JsonKey(name: 'criado_em') final String? criadoEm,
          @JsonKey(name: 'atualizado_em') final String? atualizadoEm}) =
      _$ProductModelImpl;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'lojista_id')
  String get lojistaId;
  @override
  @JsonKey(name: 'categoria_id')
  String? get categoriaId;
  @override
  String get nome;
  @override
  String? get descricao;
  @override
  String get preco;
  @override
  @JsonKey(name: 'preco_promocional')
  String? get precoPromocional;
  @override
  String? get custo;
  @override
  int get estoque;
  @override
  @JsonKey(name: 'estoque_minimo')
  int get estoqueMinimo;
  @override
  @JsonKey(name: 'controla_estoque')
  bool get controlaEstoque;
  @override
  String? get sku;
  @override
  @JsonKey(name: 'codigo_barras')
  String? get codigoBarras;
  @override
  bool get ativo;
  @override
  int get ordem;
  @override
  @JsonKey(name: 'criado_em')
  String? get criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  String? get atualizadoEm;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
