// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'cidade_id')
  String? get cidadeId => throw _privateConstructorUsedError;
  String? get telefone => throw _privateConstructorUsedError;
  String? get whatsapp => throw _privateConstructorUsedError;
  String? get endereco => throw _privateConstructorUsedError;
  String? get numero => throw _privateConstructorUsedError;
  String? get complemento => throw _privateConstructorUsedError;
  String? get bairro => throw _privateConstructorUsedError;
  String? get cep => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'horario_funcionamento')
  String? get horarioFuncionamento => throw _privateConstructorUsedError;
  bool get ativo => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  String? get criadoEm => throw _privateConstructorUsedError;
  @JsonKey(name: 'atualizado_em')
  String? get atualizadoEm => throw _privateConstructorUsedError;

  /// Serializes this StoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {String id,
      String nome,
      String email,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      String? provider,
      @JsonKey(name: 'cidade_id') String? cidadeId,
      String? telefone,
      String? whatsapp,
      String? endereco,
      String? numero,
      String? complemento,
      String? bairro,
      String? cep,
      String? descricao,
      @JsonKey(name: 'logo_url') String? logoUrl,
      @JsonKey(name: 'horario_funcionamento') String? horarioFuncionamento,
      bool ativo,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? provider = freezed,
    Object? cidadeId = freezed,
    Object? telefone = freezed,
    Object? whatsapp = freezed,
    Object? endereco = freezed,
    Object? numero = freezed,
    Object? complemento = freezed,
    Object? bairro = freezed,
    Object? cep = freezed,
    Object? descricao = freezed,
    Object? logoUrl = freezed,
    Object? horarioFuncionamento = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      cidadeId: freezed == cidadeId
          ? _value.cidadeId
          : cidadeId // ignore: cast_nullable_to_non_nullable
              as String?,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      endereco: freezed == endereco
          ? _value.endereco
          : endereco // ignore: cast_nullable_to_non_nullable
              as String?,
      numero: freezed == numero
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String?,
      complemento: freezed == complemento
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro: freezed == bairro
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String?,
      cep: freezed == cep
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as String?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      horarioFuncionamento: freezed == horarioFuncionamento
          ? _value.horarioFuncionamento
          : horarioFuncionamento // ignore: cast_nullable_to_non_nullable
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
abstract class _$$StoreModelImplCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$StoreModelImplCopyWith(
          _$StoreModelImpl value, $Res Function(_$StoreModelImpl) then) =
      __$$StoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nome,
      String email,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      String? provider,
      @JsonKey(name: 'cidade_id') String? cidadeId,
      String? telefone,
      String? whatsapp,
      String? endereco,
      String? numero,
      String? complemento,
      String? bairro,
      String? cep,
      String? descricao,
      @JsonKey(name: 'logo_url') String? logoUrl,
      @JsonKey(name: 'horario_funcionamento') String? horarioFuncionamento,
      bool ativo,
      @JsonKey(name: 'criado_em') String? criadoEm,
      @JsonKey(name: 'atualizado_em') String? atualizadoEm});
}

/// @nodoc
class __$$StoreModelImplCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$StoreModelImpl>
    implements _$$StoreModelImplCopyWith<$Res> {
  __$$StoreModelImplCopyWithImpl(
      _$StoreModelImpl _value, $Res Function(_$StoreModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? provider = freezed,
    Object? cidadeId = freezed,
    Object? telefone = freezed,
    Object? whatsapp = freezed,
    Object? endereco = freezed,
    Object? numero = freezed,
    Object? complemento = freezed,
    Object? bairro = freezed,
    Object? cep = freezed,
    Object? descricao = freezed,
    Object? logoUrl = freezed,
    Object? horarioFuncionamento = freezed,
    Object? ativo = null,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$StoreModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      cidadeId: freezed == cidadeId
          ? _value.cidadeId
          : cidadeId // ignore: cast_nullable_to_non_nullable
              as String?,
      telefone: freezed == telefone
          ? _value.telefone
          : telefone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      endereco: freezed == endereco
          ? _value.endereco
          : endereco // ignore: cast_nullable_to_non_nullable
              as String?,
      numero: freezed == numero
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String?,
      complemento: freezed == complemento
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro: freezed == bairro
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String?,
      cep: freezed == cep
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as String?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      horarioFuncionamento: freezed == horarioFuncionamento
          ? _value.horarioFuncionamento
          : horarioFuncionamento // ignore: cast_nullable_to_non_nullable
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
class _$StoreModelImpl extends _StoreModel {
  const _$StoreModelImpl(
      {required this.id,
      required this.nome,
      required this.email,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      this.provider,
      @JsonKey(name: 'cidade_id') this.cidadeId,
      this.telefone,
      this.whatsapp,
      this.endereco,
      this.numero,
      this.complemento,
      this.bairro,
      this.cep,
      this.descricao,
      @JsonKey(name: 'logo_url') this.logoUrl,
      @JsonKey(name: 'horario_funcionamento') this.horarioFuncionamento,
      this.ativo = true,
      @JsonKey(name: 'criado_em') this.criadoEm,
      @JsonKey(name: 'atualizado_em') this.atualizadoEm})
      : super._();

  factory _$StoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nome;
  @override
  final String email;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final String? provider;
  @override
  @JsonKey(name: 'cidade_id')
  final String? cidadeId;
  @override
  final String? telefone;
  @override
  final String? whatsapp;
  @override
  final String? endereco;
  @override
  final String? numero;
  @override
  final String? complemento;
  @override
  final String? bairro;
  @override
  final String? cep;
  @override
  final String? descricao;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  @JsonKey(name: 'horario_funcionamento')
  final String? horarioFuncionamento;
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
    return 'StoreModel(id: $id, nome: $nome, email: $email, avatarUrl: $avatarUrl, provider: $provider, cidadeId: $cidadeId, telefone: $telefone, whatsapp: $whatsapp, endereco: $endereco, numero: $numero, complemento: $complemento, bairro: $bairro, cep: $cep, descricao: $descricao, logoUrl: $logoUrl, horarioFuncionamento: $horarioFuncionamento, ativo: $ativo, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.cidadeId, cidadeId) ||
                other.cidadeId == cidadeId) &&
            (identical(other.telefone, telefone) ||
                other.telefone == telefone) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.endereco, endereco) ||
                other.endereco == endereco) &&
            (identical(other.numero, numero) || other.numero == numero) &&
            (identical(other.complemento, complemento) ||
                other.complemento == complemento) &&
            (identical(other.bairro, bairro) || other.bairro == bairro) &&
            (identical(other.cep, cep) || other.cep == cep) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.horarioFuncionamento, horarioFuncionamento) ||
                other.horarioFuncionamento == horarioFuncionamento) &&
            (identical(other.ativo, ativo) || other.ativo == ativo) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm) &&
            (identical(other.atualizadoEm, atualizadoEm) ||
                other.atualizadoEm == atualizadoEm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        nome,
        email,
        avatarUrl,
        provider,
        cidadeId,
        telefone,
        whatsapp,
        endereco,
        numero,
        complemento,
        bairro,
        cep,
        descricao,
        logoUrl,
        horarioFuncionamento,
        ativo,
        criadoEm,
        atualizadoEm
      ]);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      __$$StoreModelImplCopyWithImpl<_$StoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreModelImplToJson(
      this,
    );
  }
}

abstract class _StoreModel extends StoreModel {
  const factory _StoreModel(
          {required final String id,
          required final String nome,
          required final String email,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          final String? provider,
          @JsonKey(name: 'cidade_id') final String? cidadeId,
          final String? telefone,
          final String? whatsapp,
          final String? endereco,
          final String? numero,
          final String? complemento,
          final String? bairro,
          final String? cep,
          final String? descricao,
          @JsonKey(name: 'logo_url') final String? logoUrl,
          @JsonKey(name: 'horario_funcionamento')
          final String? horarioFuncionamento,
          final bool ativo,
          @JsonKey(name: 'criado_em') final String? criadoEm,
          @JsonKey(name: 'atualizado_em') final String? atualizadoEm}) =
      _$StoreModelImpl;
  const _StoreModel._() : super._();

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$StoreModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  String get email;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  String? get provider;
  @override
  @JsonKey(name: 'cidade_id')
  String? get cidadeId;
  @override
  String? get telefone;
  @override
  String? get whatsapp;
  @override
  String? get endereco;
  @override
  String? get numero;
  @override
  String? get complemento;
  @override
  String? get bairro;
  @override
  String? get cep;
  @override
  String? get descricao;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(name: 'horario_funcionamento')
  String? get horarioFuncionamento;
  @override
  bool get ativo;
  @override
  @JsonKey(name: 'criado_em')
  String? get criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  String? get atualizadoEm;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
