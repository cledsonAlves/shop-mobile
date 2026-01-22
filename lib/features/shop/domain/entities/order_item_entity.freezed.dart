// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get pedidoId => throw _privateConstructorUsedError;
  String get produtoId => throw _privateConstructorUsedError;
  String get nomeProduto => throw _privateConstructorUsedError;
  int get quantidade => throw _privateConstructorUsedError;
  double get precoUnitario => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  String? get observacoes => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemEntityCopyWith<OrderItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemEntityCopyWith<$Res> {
  factory $OrderItemEntityCopyWith(
          OrderItemEntity value, $Res Function(OrderItemEntity) then) =
      _$OrderItemEntityCopyWithImpl<$Res, OrderItemEntity>;
  @useResult
  $Res call(
      {String id,
      String pedidoId,
      String produtoId,
      String nomeProduto,
      int quantidade,
      double precoUnitario,
      double subtotal,
      String? observacoes});
}

/// @nodoc
class _$OrderItemEntityCopyWithImpl<$Res, $Val extends OrderItemEntity>
    implements $OrderItemEntityCopyWith<$Res> {
  _$OrderItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pedidoId = null,
    Object? produtoId = null,
    Object? nomeProduto = null,
    Object? quantidade = null,
    Object? precoUnitario = null,
    Object? subtotal = null,
    Object? observacoes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pedidoId: null == pedidoId
          ? _value.pedidoId
          : pedidoId // ignore: cast_nullable_to_non_nullable
              as String,
      produtoId: null == produtoId
          ? _value.produtoId
          : produtoId // ignore: cast_nullable_to_non_nullable
              as String,
      nomeProduto: null == nomeProduto
          ? _value.nomeProduto
          : nomeProduto // ignore: cast_nullable_to_non_nullable
              as String,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      precoUnitario: null == precoUnitario
          ? _value.precoUnitario
          : precoUnitario // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemEntityImplCopyWith<$Res>
    implements $OrderItemEntityCopyWith<$Res> {
  factory _$$OrderItemEntityImplCopyWith(_$OrderItemEntityImpl value,
          $Res Function(_$OrderItemEntityImpl) then) =
      __$$OrderItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String pedidoId,
      String produtoId,
      String nomeProduto,
      int quantidade,
      double precoUnitario,
      double subtotal,
      String? observacoes});
}

/// @nodoc
class __$$OrderItemEntityImplCopyWithImpl<$Res>
    extends _$OrderItemEntityCopyWithImpl<$Res, _$OrderItemEntityImpl>
    implements _$$OrderItemEntityImplCopyWith<$Res> {
  __$$OrderItemEntityImplCopyWithImpl(
      _$OrderItemEntityImpl _value, $Res Function(_$OrderItemEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pedidoId = null,
    Object? produtoId = null,
    Object? nomeProduto = null,
    Object? quantidade = null,
    Object? precoUnitario = null,
    Object? subtotal = null,
    Object? observacoes = freezed,
  }) {
    return _then(_$OrderItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pedidoId: null == pedidoId
          ? _value.pedidoId
          : pedidoId // ignore: cast_nullable_to_non_nullable
              as String,
      produtoId: null == produtoId
          ? _value.produtoId
          : produtoId // ignore: cast_nullable_to_non_nullable
              as String,
      nomeProduto: null == nomeProduto
          ? _value.nomeProduto
          : nomeProduto // ignore: cast_nullable_to_non_nullable
              as String,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      precoUnitario: null == precoUnitario
          ? _value.precoUnitario
          : precoUnitario // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OrderItemEntityImpl implements _OrderItemEntity {
  const _$OrderItemEntityImpl(
      {required this.id,
      required this.pedidoId,
      required this.produtoId,
      required this.nomeProduto,
      required this.quantidade,
      required this.precoUnitario,
      required this.subtotal,
      this.observacoes});

  @override
  final String id;
  @override
  final String pedidoId;
  @override
  final String produtoId;
  @override
  final String nomeProduto;
  @override
  final int quantidade;
  @override
  final double precoUnitario;
  @override
  final double subtotal;
  @override
  final String? observacoes;

  @override
  String toString() {
    return 'OrderItemEntity(id: $id, pedidoId: $pedidoId, produtoId: $produtoId, nomeProduto: $nomeProduto, quantidade: $quantidade, precoUnitario: $precoUnitario, subtotal: $subtotal, observacoes: $observacoes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pedidoId, pedidoId) ||
                other.pedidoId == pedidoId) &&
            (identical(other.produtoId, produtoId) ||
                other.produtoId == produtoId) &&
            (identical(other.nomeProduto, nomeProduto) ||
                other.nomeProduto == nomeProduto) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade) &&
            (identical(other.precoUnitario, precoUnitario) ||
                other.precoUnitario == precoUnitario) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.observacoes, observacoes) ||
                other.observacoes == observacoes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, pedidoId, produtoId,
      nomeProduto, quantidade, precoUnitario, subtotal, observacoes);

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemEntityImplCopyWith<_$OrderItemEntityImpl> get copyWith =>
      __$$OrderItemEntityImplCopyWithImpl<_$OrderItemEntityImpl>(
          this, _$identity);
}

abstract class _OrderItemEntity implements OrderItemEntity {
  const factory _OrderItemEntity(
      {required final String id,
      required final String pedidoId,
      required final String produtoId,
      required final String nomeProduto,
      required final int quantidade,
      required final double precoUnitario,
      required final double subtotal,
      final String? observacoes}) = _$OrderItemEntityImpl;

  @override
  String get id;
  @override
  String get pedidoId;
  @override
  String get produtoId;
  @override
  String get nomeProduto;
  @override
  int get quantidade;
  @override
  double get precoUnitario;
  @override
  double get subtotal;
  @override
  String? get observacoes;

  /// Create a copy of OrderItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemEntityImplCopyWith<_$OrderItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
