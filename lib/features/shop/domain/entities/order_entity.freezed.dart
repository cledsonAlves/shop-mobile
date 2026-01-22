// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEntity {
  String get id => throw _privateConstructorUsedError;
  String get clienteId => throw _privateConstructorUsedError;
  String get lojistaId => throw _privateConstructorUsedError;
  String? get nomeLojista => throw _privateConstructorUsedError;
  String? get enderecoEntrega => throw _privateConstructorUsedError;
  String? get cidadeEntrega => throw _privateConstructorUsedError;
  String? get estadoEntrega => throw _privateConstructorUsedError;
  String? get cepEntrega => throw _privateConstructorUsedError;
  String? get formaPagamento => throw _privateConstructorUsedError;
  String? get observacoes => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get taxaEntrega => throw _privateConstructorUsedError;
  double get desconto => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  String? get codigoConfirmacao => throw _privateConstructorUsedError;
  List<OrderItemEntity> get itens => throw _privateConstructorUsedError;
  DateTime get criadoEm => throw _privateConstructorUsedError;
  DateTime? get atualizadoEm => throw _privateConstructorUsedError;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderEntityCopyWith<OrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEntityCopyWith<$Res> {
  factory $OrderEntityCopyWith(
          OrderEntity value, $Res Function(OrderEntity) then) =
      _$OrderEntityCopyWithImpl<$Res, OrderEntity>;
  @useResult
  $Res call(
      {String id,
      String clienteId,
      String lojistaId,
      String? nomeLojista,
      String? enderecoEntrega,
      String? cidadeEntrega,
      String? estadoEntrega,
      String? cepEntrega,
      String? formaPagamento,
      String? observacoes,
      double subtotal,
      double taxaEntrega,
      double desconto,
      double total,
      OrderStatus status,
      String? codigoConfirmacao,
      List<OrderItemEntity> itens,
      DateTime criadoEm,
      DateTime? atualizadoEm});
}

/// @nodoc
class _$OrderEntityCopyWithImpl<$Res, $Val extends OrderEntity>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEntity
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
              as double,
      taxaEntrega: null == taxaEntrega
          ? _value.taxaEntrega
          : taxaEntrega // ignore: cast_nullable_to_non_nullable
              as double,
      desconto: null == desconto
          ? _value.desconto
          : desconto // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      codigoConfirmacao: freezed == codigoConfirmacao
          ? _value.codigoConfirmacao
          : codigoConfirmacao // ignore: cast_nullable_to_non_nullable
              as String?,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<OrderItemEntity>,
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
abstract class _$$OrderEntityImplCopyWith<$Res>
    implements $OrderEntityCopyWith<$Res> {
  factory _$$OrderEntityImplCopyWith(
          _$OrderEntityImpl value, $Res Function(_$OrderEntityImpl) then) =
      __$$OrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String clienteId,
      String lojistaId,
      String? nomeLojista,
      String? enderecoEntrega,
      String? cidadeEntrega,
      String? estadoEntrega,
      String? cepEntrega,
      String? formaPagamento,
      String? observacoes,
      double subtotal,
      double taxaEntrega,
      double desconto,
      double total,
      OrderStatus status,
      String? codigoConfirmacao,
      List<OrderItemEntity> itens,
      DateTime criadoEm,
      DateTime? atualizadoEm});
}

/// @nodoc
class __$$OrderEntityImplCopyWithImpl<$Res>
    extends _$OrderEntityCopyWithImpl<$Res, _$OrderEntityImpl>
    implements _$$OrderEntityImplCopyWith<$Res> {
  __$$OrderEntityImplCopyWithImpl(
      _$OrderEntityImpl _value, $Res Function(_$OrderEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEntity
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
    return _then(_$OrderEntityImpl(
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
              as double,
      taxaEntrega: null == taxaEntrega
          ? _value.taxaEntrega
          : taxaEntrega // ignore: cast_nullable_to_non_nullable
              as double,
      desconto: null == desconto
          ? _value.desconto
          : desconto // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      codigoConfirmacao: freezed == codigoConfirmacao
          ? _value.codigoConfirmacao
          : codigoConfirmacao // ignore: cast_nullable_to_non_nullable
              as String?,
      itens: null == itens
          ? _value._itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<OrderItemEntity>,
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

class _$OrderEntityImpl extends _OrderEntity {
  const _$OrderEntityImpl(
      {required this.id,
      required this.clienteId,
      required this.lojistaId,
      this.nomeLojista,
      this.enderecoEntrega,
      this.cidadeEntrega,
      this.estadoEntrega,
      this.cepEntrega,
      this.formaPagamento,
      this.observacoes,
      required this.subtotal,
      this.taxaEntrega = 0,
      this.desconto = 0,
      required this.total,
      required this.status,
      this.codigoConfirmacao,
      final List<OrderItemEntity> itens = const [],
      required this.criadoEm,
      this.atualizadoEm})
      : _itens = itens,
        super._();

  @override
  final String id;
  @override
  final String clienteId;
  @override
  final String lojistaId;
  @override
  final String? nomeLojista;
  @override
  final String? enderecoEntrega;
  @override
  final String? cidadeEntrega;
  @override
  final String? estadoEntrega;
  @override
  final String? cepEntrega;
  @override
  final String? formaPagamento;
  @override
  final String? observacoes;
  @override
  final double subtotal;
  @override
  @JsonKey()
  final double taxaEntrega;
  @override
  @JsonKey()
  final double desconto;
  @override
  final double total;
  @override
  final OrderStatus status;
  @override
  final String? codigoConfirmacao;
  final List<OrderItemEntity> _itens;
  @override
  @JsonKey()
  List<OrderItemEntity> get itens {
    if (_itens is EqualUnmodifiableListView) return _itens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itens);
  }

  @override
  final DateTime criadoEm;
  @override
  final DateTime? atualizadoEm;

  @override
  String toString() {
    return 'OrderEntity(id: $id, clienteId: $clienteId, lojistaId: $lojistaId, nomeLojista: $nomeLojista, enderecoEntrega: $enderecoEntrega, cidadeEntrega: $cidadeEntrega, estadoEntrega: $estadoEntrega, cepEntrega: $cepEntrega, formaPagamento: $formaPagamento, observacoes: $observacoes, subtotal: $subtotal, taxaEntrega: $taxaEntrega, desconto: $desconto, total: $total, status: $status, codigoConfirmacao: $codigoConfirmacao, itens: $itens, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderEntityImpl &&
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

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      __$$OrderEntityImplCopyWithImpl<_$OrderEntityImpl>(this, _$identity);
}

abstract class _OrderEntity extends OrderEntity {
  const factory _OrderEntity(
      {required final String id,
      required final String clienteId,
      required final String lojistaId,
      final String? nomeLojista,
      final String? enderecoEntrega,
      final String? cidadeEntrega,
      final String? estadoEntrega,
      final String? cepEntrega,
      final String? formaPagamento,
      final String? observacoes,
      required final double subtotal,
      final double taxaEntrega,
      final double desconto,
      required final double total,
      required final OrderStatus status,
      final String? codigoConfirmacao,
      final List<OrderItemEntity> itens,
      required final DateTime criadoEm,
      final DateTime? atualizadoEm}) = _$OrderEntityImpl;
  const _OrderEntity._() : super._();

  @override
  String get id;
  @override
  String get clienteId;
  @override
  String get lojistaId;
  @override
  String? get nomeLojista;
  @override
  String? get enderecoEntrega;
  @override
  String? get cidadeEntrega;
  @override
  String? get estadoEntrega;
  @override
  String? get cepEntrega;
  @override
  String? get formaPagamento;
  @override
  String? get observacoes;
  @override
  double get subtotal;
  @override
  double get taxaEntrega;
  @override
  double get desconto;
  @override
  double get total;
  @override
  OrderStatus get status;
  @override
  String? get codigoConfirmacao;
  @override
  List<OrderItemEntity> get itens;
  @override
  DateTime get criadoEm;
  @override
  DateTime? get atualizadoEm;

  /// Create a copy of OrderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
