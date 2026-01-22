// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'lojista_id')
  String get lojistaId => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  bool get ativo => throw _privateConstructorUsedError;
  int get ordem => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  String? get criadoEm => throw _privateConstructorUsedError;
  @JsonKey(name: 'atualizado_em')
  String? get atualizadoEm => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'lojista_id') String lojistaId,
      String nome,
      String? descricao,
      bool ativo,
      int ordem,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lojistaId = null,
    Object? nome = null,
    Object? descricao = freezed,
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
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'lojista_id') String lojistaId,
      String nome,
      String? descricao,
      bool ativo,
      int ordem,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lojistaId = null,
    Object? nome = null,
    Object? descricao = freezed,
    Object? ativo = null,
    Object? ordem = null,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lojistaId: null == lojistaId
          ? _value.lojistaId
          : lojistaId // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
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
class _$CategoryModelImpl extends _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id,
      @JsonKey(name: 'lojista_id') required this.lojistaId,
      required this.nome,
      this.descricao,
      this.ativo = true,
      this.ordem = 0,
      @JsonKey(name: 'criado_em') this.criadoEm,
      @JsonKey(name: 'atualizado_em') this.atualizadoEm})
      : super._();

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'lojista_id')
  final String lojistaId;
  @override
  final String nome;
  @override
  final String? descricao;
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
    return 'CategoryModel(id: $id, lojistaId: $lojistaId, nome: $nome, descricao: $descricao, ativo: $ativo, ordem: $ordem, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lojistaId, lojistaId) ||
                other.lojistaId == lojistaId) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.ativo, ativo) || other.ativo == ativo) &&
            (identical(other.ordem, ordem) || other.ordem == ordem) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                other.atualizadoEm == atualizadoEm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lojistaId, nome, descricao,
      ativo, ordem, criadoEm, atualizadoEm);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel extends CategoryModel {
  const factory _CategoryModel(
          {required final String id,
          @JsonKey(name: 'lojista_id') required final String lojistaId,
          required final String nome,
          final String? descricao,
          final bool ativo,
          final int ordem,
          @JsonKey(name: 'criado_em') final String? criadoEm,
          @JsonKey(name: 'atualizado_em') final String? atualizadoEm}) =
      _$CategoryModelImpl;
  const _CategoryModel._() : super._();

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'lojista_id')
  String get lojistaId;
  @override
  String get nome;
  @override
  String? get descricao;
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

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
