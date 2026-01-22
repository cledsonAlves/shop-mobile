// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get estado => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_ibge')
  String? get codigoIbge => throw _privateConstructorUsedError;
  bool get ativo => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  String? get criadoEm => throw _privateConstructorUsedError;
  @JsonKey(name: 'atualizado_em')
  String? get atualizadoEm => throw _privateConstructorUsedError;

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res, CityModel>;
  @useResult
  $Res call(
      {String id,
      String nome,
      String estado,
      @JsonKey(name: 'codigo_ibge') String? codigoIbge,
      bool ativo,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res, $Val extends CityModel>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? estado = null,
    Object? codigoIbge = freezed,
    Object? ativo = null,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      codigoIbge: freezed == codigoIbge
          ? _value.codigoIbge
          : codigoIbge // ignore: cast_nullable_to_non_nullable
              as String?,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$CityModelImplCopyWith<$Res>
    implements $CityModelCopyWith<$Res> {
  factory _$$CityModelImplCopyWith(
          _$CityModelImpl value, $Res Function(_$CityModelImpl) then) =
      __$$CityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nome,
      String estado,
      @JsonKey(name: 'codigo_ibge') String? codigoIbge,
      bool ativo,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class __$$CityModelImplCopyWithImpl<$Res>
    extends _$CityModelCopyWithImpl<$Res, _$CityModelImpl>
    implements _$$CityModelImplCopyWith<$Res> {
  __$$CityModelImplCopyWithImpl(
      _$CityModelImpl _value, $Res Function(_$CityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? estado = null,
    Object? codigoIbge = freezed,
    Object? ativo = null,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$CityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      estado: null == estado
          ? _value.estado
          : estado // ignore: cast_nullable_to_non_nullable
              as String,
      codigoIbge: freezed == codigoIbge
          ? _value.codigoIbge
          : codigoIbge // ignore: cast_nullable_to_non_nullable
              as String?,
      ativo: null == ativo
          ? _value.ativo
          : ativo // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$CityModelImpl extends _CityModel {
  const _$CityModelImpl(
      {required this.id,
      required this.nome,
      required this.estado,
      @JsonKey(name: 'codigo_ibge') this.codigoIbge,
      this.ativo = true,
      @JsonKey(name: 'criado_em') this.criadoEm,
      @JsonKey(name: 'atualizado_em') this.atualizadoEm})
      : super._();

  factory _$CityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String estado;
  @override
  @JsonKey(name: 'codigo_ibge')
  final String? codigoIbge;
  @override
  @JsonKey()
  final bool ativo;
  @override
  @JsonKey(name: 'criado_em')
  final String? criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  final String? atualizadoEm;

  @override
  String toString() {
    return 'CityModel(id: $id, nome: $nome, estado: $estado, codigoIbge: $codigoIbge, ativo: $ativo, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.estado, estado) || other.estado == estado) &&
            (identical(other.codigoIbge, codigoIbge) ||
                other.codigoIbge == codigoIbge) &&
            (identical(other.ativo, ativo) || other.ativo == ativo) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                other.atualizadoEm == atualizadoEm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nome, estado, codigoIbge, ativo, criadoEm, atualizadoEm);

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      __$$CityModelImplCopyWithImpl<_$CityModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityModelImplToJson(
      this,
    );
  }
}

abstract class _CityModel extends CityModel {
  const factory _CityModel(
          {required final String id,
          required final String nome,
          required final String estado,
          @JsonKey(name: 'codigo_ibge') final String? codigoIbge,
          final bool ativo,
          @JsonKey(name: 'criado_em') final String? criadoEm,
          @JsonKey(name: 'atualizado_em') final String? atualizadoEm}) =
      _$CityModelImpl;
  const _CityModel._() : super._();

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$CityModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get estado;
  @override
  @JsonKey(name: 'codigo_ibge')
  String? get codigoIbge;
  @override
  bool get ativo;
  @override
  @JsonKey(name: 'criado_em')
  String? get criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  String? get atualizadoEm;

  /// Create a copy of CityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityModelImplCopyWith<_$CityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
