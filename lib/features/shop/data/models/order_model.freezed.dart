// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderCreateModel _$OrderCreateModelFromJson(Map<String, dynamic> json) {
  return _OrderCreateModel.fromJson(json);
}

/// @nodoc
mixin _$OrderCreateModel {
  @JsonKey(name: 'cliente_id')
  String get clienteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lojista_id')
  String get lojistaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'endereco_entrega')
  String? get enderecoEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'cidade_entrega')
  String? get cidadeEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado_entrega')
  String? get estadoEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'cep_entrega')
  String? get cepEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'forma_pagamento')
  String? get formaPagamento => throw _privateConstructorUsedError;
  String? get observacoes => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxa_entrega')
  double get taxaEntrega => throw _privateConstructorUsedError;
  double get desconto => throw _privateConstructorUsedError;
  List<OrderItemCreateModel> get itens => throw _privateConstructorUsedError;

  /// Serializes this OrderCreateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCreateModelCopyWith<OrderCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCreateModelCopyWith<$Res> {
  factory $OrderCreateModelCopyWith(
          OrderCreateModel value, $Res Function(OrderCreateModel) then) =
      _$OrderCreateModelCopyWithImpl<$Res, OrderCreateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cliente_id') String clienteId,
      @JsonKey(name: 'lojista_id') String lojistaId,
      @JsonKey(name: 'endereco_entrega') String? enderecoEntrega,
      @JsonKey(name: 'cidade_entrega') String? cidadeEntrega,
      @JsonKey(name: 'estado_entrega') String? estadoEntrega,
      @JsonKey(name: 'cep_entrega') String? cepEntrega,
      @JsonKey(name: 'forma_pagamento') String? formaPagamento,
      String? observacoes,
      @JsonKey(name: 'taxa_entrega') double taxaEntrega,
      double desconto,
      List<OrderItemCreateModel> itens});
}

/// @nodoc
class _$OrderCreateModelCopyWithImpl<$Res, $Val extends OrderCreateModel>
    implements $OrderCreateModelCopyWith<$Res> {
  _$OrderCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clienteId = null,
    Object? lojistaId = null,
    Object? enderecoEntrega = freezed,
    Object? cidadeEntrega = freezed,
    Object? estadoEntrega = freezed,
    Object? cepEntrega = freezed,
    Object? formaPagamento = freezed,
    Object? observacoes = freezed,
    Object? taxaEntrega = null,
    Object? desconto = null,
    Object? itens = null,
  }) {
    return _then(_value.copyWith(
      clienteId: null == clienteId
          ? _value.clienteId
          : clienteId // ignore: cast_nullable_to_non_nullable
              as String,
      lojistaId: null == lojistaId
          ? _value.lojistaId
          : lojistaId // ignore: cast_nullable_to_non_nullable
              as String,
      enderecoEntrega: freezed == enderecoEntrega
          ? _value.enderecoEntrega
          : enderecoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cidadeEntrega: freezed == cidadeEntrega
          ? _value.cidadeEntrega
          : cidadeEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      estadoEntrega: freezed == estadoEntrega
          ? _value.estadoEntrega
          : estadoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cepEntrega: freezed == cepEntrega
          ? _value.cepEntrega
          : cepEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      formaPagamento: freezed == formaPagamento
          ? _value.formaPagamento
          : formaPagamento // ignore: cast_nullable_to_non_nullable
              as String?,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
      taxaEntrega: null == taxaEntrega
          ? _value.taxaEntrega
          : taxaEntrega // ignore: cast_nullable_to_non_nullable
              as double,
      desconto: null == desconto
          ? _value.desconto
          : desconto // ignore: cast_nullable_to_non_nullable
              as double,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<OrderItemCreateModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderCreateModelImplCopyWith<$Res>
    implements $OrderCreateModelCopyWith<$Res> {
  factory _$$OrderCreateModelImplCopyWith(_$OrderCreateModelImpl value,
          $Res Function(_$OrderCreateModelImpl) then) =
      __$$OrderCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cliente_id') String clienteId,
      @JsonKey(name: 'lojista_id') String lojistaId,
      @JsonKey(name: 'endereco_entrega') String? enderecoEntrega,
      @JsonKey(name: 'cidade_entrega') String? cidadeEntrega,
      @JsonKey(name: 'estado_entrega') String? estadoEntrega,
      @JsonKey(name: 'cep_entrega') String? cepEntrega,
      @JsonKey(name: 'forma_pagamento') String? formaPagamento,
      String? observacoes,
      @JsonKey(name: 'taxa_entrega') double taxaEntrega,
      double desconto,
      List<OrderItemCreateModel> itens});
}

/// @nodoc
class __$$OrderCreateModelImplCopyWithImpl<$Res>
    extends _$OrderCreateModelCopyWithImpl<$Res, _$OrderCreateModelImpl>
    implements _$$OrderCreateModelImplCopyWith<$Res> {
  __$$OrderCreateModelImplCopyWithImpl(_$OrderCreateModelImpl _value,
      $Res Function(_$OrderCreateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clienteId = null,
    Object? lojistaId = null,
    Object? enderecoEntrega = freezed,
    Object? cidadeEntrega = freezed,
    Object? estadoEntrega = freezed,
    Object? cepEntrega = freezed,
    Object? formaPagamento = freezed,
    Object? observacoes = freezed,
    Object? taxaEntrega = null,
    Object? desconto = null,
    Object? itens = null,
  }) {
    return _then(_$OrderCreateModelImpl(
      clienteId: null == clienteId
          ? _value.clienteId
          : clienteId // ignore: cast_nullable_to_non_nullable
              as String,
      lojistaId: null == lojistaId
          ? _value.lojistaId
          : lojistaId // ignore: cast_nullable_to_non_nullable
              as String,
      enderecoEntrega: freezed == enderecoEntrega
          ? _value.enderecoEntrega
          : enderecoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cidadeEntrega: freezed == cidadeEntrega
          ? _value.cidadeEntrega
          : cidadeEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      estadoEntrega: freezed == estadoEntrega
          ? _value.estadoEntrega
          : estadoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cepEntrega: freezed == cepEntrega
          ? _value.cepEntrega
          : cepEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      formaPagamento: freezed == formaPagamento
          ? _value.formaPagamento
          : formaPagamento // ignore: cast_nullable_to_non_nullable
              as String?,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
      taxaEntrega: null == taxaEntrega
          ? _value.taxaEntrega
          : taxaEntrega // ignore: cast_nullable_to_non_nullable
              as double,
      desconto: null == desconto
          ? _value.desconto
          : desconto // ignore: cast_nullable_to_non_nullable
              as double,
      itens: null == itens
          ? _value._itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<OrderItemCreateModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCreateModelImpl extends _OrderCreateModel {
  const _$OrderCreateModelImpl(
      {@JsonKey(name: 'cliente_id') required this.clienteId,
      @JsonKey(name: 'lojista_id') required this.lojistaId,
      @JsonKey(name: 'endereco_entrega') this.enderecoEntrega,
      @JsonKey(name: 'cidade_entrega') this.cidadeEntrega,
      @JsonKey(name: 'estado_entrega') this.estadoEntrega,
      @JsonKey(name: 'cep_entrega') this.cepEntrega,
      @JsonKey(name: 'forma_pagamento') this.formaPagamento,
      this.observacoes,
      @JsonKey(name: 'taxa_entrega') this.taxaEntrega = 0,
      this.desconto = 0,
      required final List<OrderItemCreateModel> itens})
      : _itens = itens,
        super._();

  factory _$OrderCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCreateModelImplFromJson(json);

  @override
  @JsonKey(name: 'cliente_id')
  final String clienteId;
  @override
  @JsonKey(name: 'lojista_id')
  final String lojistaId;
  @override
  @JsonKey(name: 'endereco_entrega')
  final String? enderecoEntrega;
  @override
  @JsonKey(name: 'cidade_entrega')
  final String? cidadeEntrega;
  @override
  @JsonKey(name: 'estado_entrega')
  final String? estadoEntrega;
  @override
  @JsonKey(name: 'cep_entrega')
  final String? cepEntrega;
  @override
  @JsonKey(name: 'forma_pagamento')
  final String? formaPagamento;
  @override
  final String? observacoes;
  @override
  @JsonKey(name: 'taxa_entrega')
  final double taxaEntrega;
  @override
  @JsonKey()
  final double desconto;
  final List<OrderItemCreateModel> _itens;
  @override
  List<OrderItemCreateModel> get itens {
    if (_itens is EqualUnmodifiableListView) return _itens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itens);
  }

  @override
  String toString() {
    return 'OrderCreateModel(clienteId: $clienteId, lojistaId: $lojistaId, enderecoEntrega: $enderecoEntrega, cidadeEntrega: $cidadeEntrega, estadoEntrega: $estadoEntrega, cepEntrega: $cepEntrega, formaPagamento: $formaPagamento, observacoes: $observacoes, taxaEntrega: $taxaEntrega, desconto: $desconto, itens: $itens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateModelImpl &&
            (identical(other.clienteId, clienteId) ||
                other.clienteId == clienteId) &&
            (identical(other.lojistaId, lojistaId) ||
                other.lojistaId == lojistaId) &&
            (identical(other.enderecoEntrega, enderecoEntrega) ||
                other.enderecoEntrega == enderecoEntrega) &&
            (identical(other.cidadeEntrega, cidadeEntrega) ||
                other.cidadeEntrega == cidadeEntrega) &&
            (identical(other.estadoEntrega, estadoEntrega) ||
                other.estadoEntrega == estadoEntrega) &&
            (identical(other.cepEntrega, cepEntrega) ||
                other.cepEntrega == cepEntrega) &&
            (identical(other.formaPagamento, formaPagamento) ||
                other.formaPagamento == formaPagamento) &&
            (identical(other.observacoes, observacoes) ||
                other.observacoes == observacoes) &&
            (identical(other.taxaEntrega, taxaEntrega) ||
                other.taxaEntrega == taxaEntrega) &&
            (identical(other.desconto, desconto) ||
                other.desconto == desconto) &&
            const DeepCollectionEquality().equals(other._itens, _itens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clienteId,
      lojistaId,
      enderecoEntrega,
      cidadeEntrega,
      estadoEntrega,
      cepEntrega,
      formaPagamento,
      observacoes,
      taxaEntrega,
      desconto,
      const DeepCollectionEquality().hash(_itens));

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateModelImplCopyWith<_$OrderCreateModelImpl> get copyWith =>
      __$$OrderCreateModelImplCopyWithImpl<_$OrderCreateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCreateModelImplToJson(
      this,
    );
  }
}

abstract class _OrderCreateModel extends OrderCreateModel {
  const factory _OrderCreateModel(
          {@JsonKey(name: 'cliente_id') required final String clienteId,
          @JsonKey(name: 'lojista_id') required final String lojistaId,
          @JsonKey(name: 'endereco_entrega') final String? enderecoEntrega,
          @JsonKey(name: 'cidade_entrega') final String? cidadeEntrega,
          @JsonKey(name: 'estado_entrega') final String? estadoEntrega,
          @JsonKey(name: 'cep_entrega') final String? cepEntrega,
          @JsonKey(name: 'forma_pagamento') final String? formaPagamento,
          final String? observacoes,
          @JsonKey(name: 'taxa_entrega') final double taxaEntrega,
          final double desconto,
          required final List<OrderItemCreateModel> itens}) =
      _$OrderCreateModelImpl;
  const _OrderCreateModel._() : super._();

  factory _OrderCreateModel.fromJson(Map<String, dynamic> json) =
      _$OrderCreateModelImpl.fromJson;

  @override
  @JsonKey(name: 'cliente_id')
  String get clienteId;
  @override
  @JsonKey(name: 'lojista_id')
  String get lojistaId;
  @override
  @JsonKey(name: 'endereco_entrega')
  String? get enderecoEntrega;
  @override
  @JsonKey(name: 'cidade_entrega')
  String? get cidadeEntrega;
  @override
  @JsonKey(name: 'estado_entrega')
  String? get estadoEntrega;
  @override
  @JsonKey(name: 'cep_entrega')
  String? get cepEntrega;
  @override
  @JsonKey(name: 'forma_pagamento')
  String? get formaPagamento;
  @override
  String? get observacoes;
  @override
  @JsonKey(name: 'taxa_entrega')
  double get taxaEntrega;
  @override
  double get desconto;
  @override
  List<OrderItemCreateModel> get itens;

  /// Create a copy of OrderCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateModelImplCopyWith<_$OrderCreateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cliente_id')
  String get clienteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lojista_id')
  String get lojistaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nome_lojista')
  String? get nomeLojista => throw _privateConstructorUsedError;
  @JsonKey(name: 'endereco_entrega')
  String? get enderecoEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'cidade_entrega')
  String? get cidadeEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'estado_entrega')
  String? get estadoEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'cep_entrega')
  String? get cepEntrega => throw _privateConstructorUsedError;
  @JsonKey(name: 'forma_pagamento')
  String? get formaPagamento => throw _privateConstructorUsedError;
  String? get observacoes => throw _privateConstructorUsedError;
  String get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxa_entrega')
  String get taxaEntrega => throw _privateConstructorUsedError;
  String get desconto => throw _privateConstructorUsedError;
  String get total => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'codigo_confirmacao')
  String? get codigoConfirmacao => throw _privateConstructorUsedError;
  List<OrderItemResponseModel> get itens => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  DateTime get criadoEm => throw _privateConstructorUsedError;
  @JsonKey(name: 'atualizado_em')
  DateTime? get atualizadoEm => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cliente_id') String clienteId,
      @JsonKey(name: 'lojista_id') String lojistaId,
      @JsonKey(name: 'nome_lojista') String? nomeLojista,
      @JsonKey(name: 'endereco_entrega') String? enderecoEntrega,
      @JsonKey(name: 'cidade_entrega') String? cidadeEntrega,
      @JsonKey(name: 'estado_entrega') String? estadoEntrega,
      @JsonKey(name: 'cep_entrega') String? cepEntrega,
      @JsonKey(name: 'forma_pagamento') String? formaPagamento,
      String? observacoes,
      String subtotal,
      @JsonKey(name: 'taxa_entrega') String taxaEntrega,
      String desconto,
      String total,
      String status,
      @JsonKey(name: 'codigo_confirmacao') String? codigoConfirmacao,
      List<OrderItemResponseModel> itens,
      @JsonKey(name: 'criado_em') DateTime criadoEm,
      @JsonKey(name: 'atualizado_em') DateTime? atualizadoEm});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clienteId = null,
    Object? lojistaId = null,
    Object? nomeLojista = freezed,
    Object? enderecoEntrega = freezed,
    Object? cidadeEntrega = freezed,
    Object? estadoEntrega = freezed,
    Object? cepEntrega = freezed,
    Object? formaPagamento = freezed,
    Object? observacoes = freezed,
    Object? subtotal = null,
    Object? taxaEntrega = null,
    Object? desconto = null,
    Object? total = null,
    Object? status = null,
    Object? codigoConfirmacao = freezed,
    Object? itens = null,
    Object? criadoEm = null,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clienteId: null == clienteId
          ? _value.clienteId
          : clienteId // ignore: cast_nullable_to_non_nullable
              as String,
      lojistaId: null == lojistaId
          ? _value.lojistaId
          : lojistaId // ignore: cast_nullable_to_non_nullable
              as String,
      nomeLojista: freezed == nomeLojista
          ? _value.nomeLojista
          : nomeLojista // ignore: cast_nullable_to_non_nullable
              as String?,
      enderecoEntrega: freezed == enderecoEntrega
          ? _value.enderecoEntrega
          : enderecoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cidadeEntrega: freezed == cidadeEntrega
          ? _value.cidadeEntrega
          : cidadeEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      estadoEntrega: freezed == estadoEntrega
          ? _value.estadoEntrega
          : estadoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cepEntrega: freezed == cepEntrega
          ? _value.cepEntrega
          : cepEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      formaPagamento: freezed == formaPagamento
          ? _value.formaPagamento
          : formaPagamento // ignore: cast_nullable_to_non_nullable
              as String?,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String,
      taxaEntrega: null == taxaEntrega
          ? _value.taxaEntrega
          : taxaEntrega // ignore: cast_nullable_to_non_nullable
              as String,
      desconto: null == desconto
          ? _value.desconto
          : desconto // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      codigoConfirmacao: freezed == codigoConfirmacao
          ? _value.codigoConfirmacao
          : codigoConfirmacao // ignore: cast_nullable_to_non_nullable
              as String?,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<OrderItemResponseModel>,
      criadoEm: null == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      atualizadoEm: freezed == atualizadoEm
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'cliente_id') String clienteId,
      @JsonKey(name: 'lojista_id') String lojistaId,
      @JsonKey(name: 'nome_lojista') String? nomeLojista,
      @JsonKey(name: 'endereco_entrega') String? enderecoEntrega,
      @JsonKey(name: 'cidade_entrega') String? cidadeEntrega,
      @JsonKey(name: 'estado_entrega') String? estadoEntrega,
      @JsonKey(name: 'cep_entrega') String? cepEntrega,
      @JsonKey(name: 'forma_pagamento') String? formaPagamento,
      String? observacoes,
      String subtotal,
      @JsonKey(name: 'taxa_entrega') String taxaEntrega,
      String desconto,
      String total,
      String status,
      @JsonKey(name: 'codigo_confirmacao') String? codigoConfirmacao,
      List<OrderItemResponseModel> itens,
      @JsonKey(name: 'criado_em') DateTime criadoEm,
      @JsonKey(name: 'atualizado_em') DateTime? atualizadoEm});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clienteId = null,
    Object? lojistaId = null,
    Object? nomeLojista = freezed,
    Object? enderecoEntrega = freezed,
    Object? cidadeEntrega = freezed,
    Object? estadoEntrega = freezed,
    Object? cepEntrega = freezed,
    Object? formaPagamento = freezed,
    Object? observacoes = freezed,
    Object? subtotal = null,
    Object? taxaEntrega = null,
    Object? desconto = null,
    Object? total = null,
    Object? status = null,
    Object? codigoConfirmacao = freezed,
    Object? itens = null,
    Object? criadoEm = null,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clienteId: null == clienteId
          ? _value.clienteId
          : clienteId // ignore: cast_nullable_to_non_nullable
              as String,
      lojistaId: null == lojistaId
          ? _value.lojistaId
          : lojistaId // ignore: cast_nullable_to_non_nullable
              as String,
      nomeLojista: freezed == nomeLojista
          ? _value.nomeLojista
          : nomeLojista // ignore: cast_nullable_to_non_nullable
              as String?,
      enderecoEntrega: freezed == enderecoEntrega
          ? _value.enderecoEntrega
          : enderecoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cidadeEntrega: freezed == cidadeEntrega
          ? _value.cidadeEntrega
          : cidadeEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      estadoEntrega: freezed == estadoEntrega
          ? _value.estadoEntrega
          : estadoEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      cepEntrega: freezed == cepEntrega
          ? _value.cepEntrega
          : cepEntrega // ignore: cast_nullable_to_non_nullable
              as String?,
      formaPagamento: freezed == formaPagamento
          ? _value.formaPagamento
          : formaPagamento // ignore: cast_nullable_to_non_nullable
              as String?,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String,
      taxaEntrega: null == taxaEntrega
          ? _value.taxaEntrega
          : taxaEntrega // ignore: cast_nullable_to_non_nullable
              as String,
      desconto: null == desconto
          ? _value.desconto
          : desconto // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      codigoConfirmacao: freezed == codigoConfirmacao
          ? _value.codigoConfirmacao
          : codigoConfirmacao // ignore: cast_nullable_to_non_nullable
              as String?,
      itens: null == itens
          ? _value._itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<OrderItemResponseModel>,
      criadoEm: null == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime,
      atualizadoEm: freezed == atualizadoEm
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl extends _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      @JsonKey(name: 'cliente_id') required this.clienteId,
      @JsonKey(name: 'lojista_id') required this.lojistaId,
      @JsonKey(name: 'nome_lojista') this.nomeLojista,
      @JsonKey(name: 'endereco_entrega') this.enderecoEntrega,
      @JsonKey(name: 'cidade_entrega') this.cidadeEntrega,
      @JsonKey(name: 'estado_entrega') this.estadoEntrega,
      @JsonKey(name: 'cep_entrega') this.cepEntrega,
      @JsonKey(name: 'forma_pagamento') this.formaPagamento,
      this.observacoes,
      required this.subtotal,
      @JsonKey(name: 'taxa_entrega') this.taxaEntrega = '0',
      this.desconto = '0',
      required this.total,
      required this.status,
      @JsonKey(name: 'codigo_confirmacao') this.codigoConfirmacao,
      final List<OrderItemResponseModel> itens = const [],
      @JsonKey(name: 'criado_em') required this.criadoEm,
      @JsonKey(name: 'atualizado_em') this.atualizadoEm})
      : _itens = itens,
        super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'cliente_id')
  final String clienteId;
  @override
  @JsonKey(name: 'lojista_id')
  final String lojistaId;
  @override
  @JsonKey(name: 'nome_lojista')
  final String? nomeLojista;
  @override
  @JsonKey(name: 'endereco_entrega')
  final String? enderecoEntrega;
  @override
  @JsonKey(name: 'cidade_entrega')
  final String? cidadeEntrega;
  @override
  @JsonKey(name: 'estado_entrega')
  final String? estadoEntrega;
  @override
  @JsonKey(name: 'cep_entrega')
  final String? cepEntrega;
  @override
  @JsonKey(name: 'forma_pagamento')
  final String? formaPagamento;
  @override
  final String? observacoes;
  @override
  final String subtotal;
  @override
  @JsonKey(name: 'taxa_entrega')
  final String taxaEntrega;
  @override
  @JsonKey()
  final String desconto;
  @override
  final String total;
  @override
  final String status;
  @override
  @JsonKey(name: 'codigo_confirmacao')
  final String? codigoConfirmacao;
  final List<OrderItemResponseModel> _itens;
  @override
  @JsonKey()
  List<OrderItemResponseModel> get itens {
    if (_itens is EqualUnmodifiableListView) return _itens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itens);
  }

  @override
  @JsonKey(name: 'criado_em')
  final DateTime criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  final DateTime? atualizadoEm;

  @override
  String toString() {
    return 'OrderModel(id: $id, clienteId: $clienteId, lojistaId: $lojistaId, nomeLojista: $nomeLojista, enderecoEntrega: $enderecoEntrega, cidadeEntrega: $cidadeEntrega, estadoEntrega: $estadoEntrega, cepEntrega: $cepEntrega, formaPagamento: $formaPagamento, observacoes: $observacoes, subtotal: $subtotal, taxaEntrega: $taxaEntrega, desconto: $desconto, total: $total, status: $status, codigoConfirmacao: $codigoConfirmacao, itens: $itens, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clienteId, clienteId) ||
                other.clienteId == clienteId) &&
            (identical(other.lojistaId, lojistaId) ||
                other.lojistaId == lojistaId) &&
            (identical(other.nomeLojista, nomeLojista) ||
                other.nomeLojista == nomeLojista) &&
            (identical(other.enderecoEntrega, enderecoEntrega) ||
                other.enderecoEntrega == enderecoEntrega) &&
            (identical(other.cidadeEntrega, cidadeEntrega) ||
                other.cidadeEntrega == cidadeEntrega) &&
            (identical(other.estadoEntrega, estadoEntrega) ||
                other.estadoEntrega == estadoEntrega) &&
            (identical(other.cepEntrega, cepEntrega) ||
                other.cepEntrega == cepEntrega) &&
            (identical(other.formaPagamento, formaPagamento) ||
                other.formaPagamento == formaPagamento) &&
            (identical(other.observacoes, observacoes) ||
                other.observacoes == observacoes) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.taxaEntrega, taxaEntrega) ||
                other.taxaEntrega == taxaEntrega) &&
            (identical(other.desconto, desconto) ||
                other.desconto == desconto) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.codigoConfirmacao, codigoConfirmacao) ||
                other.codigoConfirmacao == codigoConfirmacao) &&
            const DeepCollectionEquality().equals(other._itens, _itens) &&
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
        clienteId,
        lojistaId,
        nomeLojista,
        enderecoEntrega,
        cidadeEntrega,
        estadoEntrega,
        cepEntrega,
        formaPagamento,
        observacoes,
        subtotal,
        taxaEntrega,
        desconto,
        total,
        status,
        codigoConfirmacao,
        const DeepCollectionEquality().hash(_itens),
        criadoEm,
        atualizadoEm
      ]);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel extends OrderModel {
  const factory _OrderModel(
          {required final String id,
          @JsonKey(name: 'cliente_id') required final String clienteId,
          @JsonKey(name: 'lojista_id') required final String lojistaId,
          @JsonKey(name: 'nome_lojista') final String? nomeLojista,
          @JsonKey(name: 'endereco_entrega') final String? enderecoEntrega,
          @JsonKey(name: 'cidade_entrega') final String? cidadeEntrega,
          @JsonKey(name: 'estado_entrega') final String? estadoEntrega,
          @JsonKey(name: 'cep_entrega') final String? cepEntrega,
          @JsonKey(name: 'forma_pagamento') final String? formaPagamento,
          final String? observacoes,
          required final String subtotal,
          @JsonKey(name: 'taxa_entrega') final String taxaEntrega,
          final String desconto,
          required final String total,
          required final String status,
          @JsonKey(name: 'codigo_confirmacao') final String? codigoConfirmacao,
          final List<OrderItemResponseModel> itens,
          @JsonKey(name: 'criado_em') required final DateTime criadoEm,
          @JsonKey(name: 'atualizado_em') final DateTime? atualizadoEm}) =
      _$OrderModelImpl;
  const _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'cliente_id')
  String get clienteId;
  @override
  @JsonKey(name: 'lojista_id')
  String get lojistaId;
  @override
  @JsonKey(name: 'nome_lojista')
  String? get nomeLojista;
  @override
  @JsonKey(name: 'endereco_entrega')
  String? get enderecoEntrega;
  @override
  @JsonKey(name: 'cidade_entrega')
  String? get cidadeEntrega;
  @override
  @JsonKey(name: 'estado_entrega')
  String? get estadoEntrega;
  @override
  @JsonKey(name: 'cep_entrega')
  String? get cepEntrega;
  @override
  @JsonKey(name: 'forma_pagamento')
  String? get formaPagamento;
  @override
  String? get observacoes;
  @override
  String get subtotal;
  @override
  @JsonKey(name: 'taxa_entrega')
  String get taxaEntrega;
  @override
  String get desconto;
  @override
  String get total;
  @override
  String get status;
  @override
  @JsonKey(name: 'codigo_confirmacao')
  String? get codigoConfirmacao;
  @override
  List<OrderItemResponseModel> get itens;
  @override
  @JsonKey(name: 'criado_em')
  DateTime get criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  DateTime? get atualizadoEm;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
