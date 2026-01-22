// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderItemCreateModel _$OrderItemCreateModelFromJson(Map<String, dynamic> json) {
  return _OrderItemCreateModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemCreateModel {
  @JsonKey(name: 'produto_id')
  String get produtoId => throw _privateConstructorUsedError;
  int get quantidade => throw _privateConstructorUsedError;
  String? get observacoes => throw _privateConstructorUsedError;

  /// Serializes this OrderItemCreateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCreateModelCopyWith<OrderItemCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCreateModelCopyWith<$Res> {
  factory $OrderItemCreateModelCopyWith(OrderItemCreateModel value,
          $Res Function(OrderItemCreateModel) then) =
      _$OrderItemCreateModelCopyWithImpl<$Res, OrderItemCreateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'produto_id') String produtoId,
      int quantidade,
      String? observacoes});
}

/// @nodoc
class _$OrderItemCreateModelCopyWithImpl<$Res,
        $Val extends OrderItemCreateModel>
    implements $OrderItemCreateModelCopyWith<$Res> {
  _$OrderItemCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? produtoId = null,
    Object? quantidade = null,
    Object? observacoes = freezed,
  }) {
    return _then(_value.copyWith(
      produtoId: null == produtoId
          ? _value.produtoId
          : produtoId // ignore: cast_nullable_to_non_nullable
              as String,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemCreateModelImplCopyWith<$Res>
    implements $OrderItemCreateModelCopyWith<$Res> {
  factory _$$OrderItemCreateModelImplCopyWith(_$OrderItemCreateModelImpl value,
          $Res Function(_$OrderItemCreateModelImpl) then) =
      __$$OrderItemCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'produto_id') String produtoId,
      int quantidade,
      String? observacoes});
}

/// @nodoc
class __$$OrderItemCreateModelImplCopyWithImpl<$Res>
    extends _$OrderItemCreateModelCopyWithImpl<$Res, _$OrderItemCreateModelImpl>
    implements _$$OrderItemCreateModelImplCopyWith<$Res> {
  __$$OrderItemCreateModelImplCopyWithImpl(_$OrderItemCreateModelImpl _value,
      $Res Function(_$OrderItemCreateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? produtoId = null,
    Object? quantidade = null,
    Object? observacoes = freezed,
  }) {
    return _then(_$OrderItemCreateModelImpl(
      produtoId: null == produtoId
          ? _value.produtoId
          : produtoId // ignore: cast_nullable_to_non_nullable
              as String,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemCreateModelImpl extends _OrderItemCreateModel {
  const _$OrderItemCreateModelImpl(
      {@JsonKey(name: 'produto_id') required this.produtoId,
      required this.quantidade,
      this.observacoes})
      : super._();

  factory _$OrderItemCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemCreateModelImplFromJson(json);

  @override
  @JsonKey(name: 'produto_id')
  final String produtoId;
  @override
  final int quantidade;
  @override
  final String? observacoes;

  @override
  String toString() {
    return 'OrderItemCreateModel(produtoId: $produtoId, quantidade: $quantidade, observacoes: $observacoes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemCreateModelImpl &&
            (identical(other.produtoId, produtoId) ||
                other.produtoId == produtoId) &&
            (identical(other.quantidade, quantidade) ||
                other.quantidade == quantidade) &&
            (identical(other.observacoes, observacoes) ||
                other.observacoes == observacoes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, produtoId, quantidade, observacoes);

  /// Create a copy of OrderItemCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemCreateModelImplCopyWith<_$OrderItemCreateModelImpl>
      get copyWith =>
          __$$OrderItemCreateModelImplCopyWithImpl<_$OrderItemCreateModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemCreateModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemCreateModel extends OrderItemCreateModel {
  const factory _OrderItemCreateModel(
      {@JsonKey(name: 'produto_id') required final String produtoId,
      required final int quantidade,
      final String? observacoes}) = _$OrderItemCreateModelImpl;
  const _OrderItemCreateModel._() : super._();

  factory _OrderItemCreateModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemCreateModelImpl.fromJson;

  @override
  @JsonKey(name: 'produto_id')
  String get produtoId;
  @override
  int get quantidade;
  @override
  String? get observacoes;

  /// Create a copy of OrderItemCreateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemCreateModelImplCopyWith<_$OrderItemCreateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderItemResponseModel _$OrderItemResponseModelFromJson(
    Map<String, dynamic> json) {
  return _OrderItemResponseModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemResponseModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'pedido_id')
  String get pedidoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'produto_id')
  String get produtoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nome_produto')
  String? get nomeProduto => throw _privateConstructorUsedError;
  int get quantidade => throw _privateConstructorUsedError;
  @JsonKey(name: 'preco_unitario')
  String get precoUnitario => throw _privateConstructorUsedError;
  @JsonKey(name: 'preco_total')
  String get precoTotal => throw _privateConstructorUsedError;
  String? get observacoes => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  DateTime? get criadoEm => throw _privateConstructorUsedError;

  /// Serializes this OrderItemResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemResponseModelCopyWith<OrderItemResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemResponseModelCopyWith<$Res> {
  factory $OrderItemResponseModelCopyWith(OrderItemResponseModel value,
          $Res Function(OrderItemResponseModel) then) =
      _$OrderItemResponseModelCopyWithImpl<$Res, OrderItemResponseModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'pedido_id') String pedidoId,
      @JsonKey(name: 'produto_id') String produtoId,
      @JsonKey(name: 'nome_produto') String? nomeProduto,
      int quantidade,
      @JsonKey(name: 'preco_unitario') String precoUnitario,
      @JsonKey(name: 'preco_total') String precoTotal,
      String? observacoes,
      @JsonKey(name: 'criado_em') DateTime? criadoEm});
}

/// @nodoc
class _$OrderItemResponseModelCopyWithImpl<$Res,
        $Val extends OrderItemResponseModel>
    implements $OrderItemResponseModelCopyWith<$Res> {
  _$OrderItemResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pedidoId = null,
    Object? produtoId = null,
    Object? nomeProduto = freezed,
    Object? quantidade = null,
    Object? precoUnitario = null,
    Object? precoTotal = null,
    Object? observacoes = freezed,
    Object? criadoEm = freezed,
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
      nomeProduto: freezed == nomeProduto
          ? _value.nomeProduto
          : nomeProduto // ignore: cast_nullable_to_non_nullable
              as String?,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      precoUnitario: null == precoUnitario
          ? _value.precoUnitario
          : precoUnitario // ignore: cast_nullable_to_non_nullable
              as String,
      precoTotal: null == precoTotal
          ? _value.precoTotal
          : precoTotal // ignore: cast_nullable_to_non_nullable
              as String,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemResponseModelImplCopyWith<$Res>
    implements $OrderItemResponseModelCopyWith<$Res> {
  factory _$$OrderItemResponseModelImplCopyWith(
          _$OrderItemResponseModelImpl value,
          $Res Function(_$OrderItemResponseModelImpl) then) =
      __$$OrderItemResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'pedido_id') String pedidoId,
      @JsonKey(name: 'produto_id') String produtoId,
      @JsonKey(name: 'nome_produto') String? nomeProduto,
      int quantidade,
      @JsonKey(name: 'preco_unitario') String precoUnitario,
      @JsonKey(name: 'preco_total') String precoTotal,
      String? observacoes,
      @JsonKey(name: 'criado_em') DateTime? criadoEm});
}

/// @nodoc
class __$$OrderItemResponseModelImplCopyWithImpl<$Res>
    extends _$OrderItemResponseModelCopyWithImpl<$Res,
        _$OrderItemResponseModelImpl>
    implements _$$OrderItemResponseModelImplCopyWith<$Res> {
  __$$OrderItemResponseModelImplCopyWithImpl(
      _$OrderItemResponseModelImpl _value,
      $Res Function(_$OrderItemResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pedidoId = null,
    Object? produtoId = null,
    Object? nomeProduto = freezed,
    Object? quantidade = null,
    Object? precoUnitario = null,
    Object? precoTotal = null,
    Object? observacoes = freezed,
    Object? criadoEm = freezed,
  }) {
    return _then(_$OrderItemResponseModelImpl(
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
      nomeProduto: freezed == nomeProduto
          ? _value.nomeProduto
          : nomeProduto // ignore: cast_nullable_to_non_nullable
              as String?,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      precoUnitario: null == precoUnitario
          ? _value.precoUnitario
          : precoUnitario // ignore: cast_nullable_to_non_nullable
              as String,
      precoTotal: null == precoTotal
          ? _value.precoTotal
          : precoTotal // ignore: cast_nullable_to_non_nullable
              as String,
      observacoes: freezed == observacoes
          ? _value.observacoes
          : observacoes // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemResponseModelImpl extends _OrderItemResponseModel {
  const _$OrderItemResponseModelImpl(
      {required this.id,
      @JsonKey(name: 'pedido_id') required this.pedidoId,
      @JsonKey(name: 'produto_id') required this.produtoId,
      @JsonKey(name: 'nome_produto') this.nomeProduto,
      required this.quantidade,
      @JsonKey(name: 'preco_unitario') required this.precoUnitario,
      @JsonKey(name: 'preco_total') required this.precoTotal,
      this.observacoes,
      @JsonKey(name: 'criado_em') this.criadoEm})
      : super._();

  factory _$OrderItemResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemResponseModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'pedido_id')
  final String pedidoId;
  @override
  @JsonKey(name: 'produto_id')
  final String produtoId;
  @override
  @JsonKey(name: 'nome_produto')
  final String? nomeProduto;
  @override
  final int quantidade;
  @override
  @JsonKey(name: 'preco_unitario')
  final String precoUnitario;
  @override
  @JsonKey(name: 'preco_total')
  final String precoTotal;
  @override
  final String? observacoes;
  @override
  @JsonKey(name: 'criado_em')
  final DateTime? criadoEm;

  @override
  String toString() {
    return 'OrderItemResponseModel(id: $id, pedidoId: $pedidoId, produtoId: $produtoId, nomeProduto: $nomeProduto, quantidade: $quantidade, precoUnitario: $precoUnitario, precoTotal: $precoTotal, observacoes: $observacoes, criadoEm: $criadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemResponseModelImpl &&
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
            (identical(other.precoTotal, precoTotal) ||
                other.precoTotal == precoTotal) &&
            (identical(other.observacoes, observacoes) ||
                other.observacoes == observacoes) &&
            (identical(other.criadoEm, criadoEm) ||
                other.criadoEm == criadoEm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      pedidoId,
      produtoId,
      nomeProduto,
      quantidade,
      precoUnitario,
      precoTotal,
      observacoes,
      criadoEm);

  /// Create a copy of OrderItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemResponseModelImplCopyWith<_$OrderItemResponseModelImpl>
      get copyWith => __$$OrderItemResponseModelImplCopyWithImpl<
          _$OrderItemResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemResponseModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemResponseModel extends OrderItemResponseModel {
  const factory _OrderItemResponseModel(
          {required final String id,
          @JsonKey(name: 'pedido_id') required final String pedidoId,
          @JsonKey(name: 'produto_id') required final String produtoId,
          @JsonKey(name: 'nome_produto') final String? nomeProduto,
          required final int quantidade,
          @JsonKey(name: 'preco_unitario') required final String precoUnitario,
          @JsonKey(name: 'preco_total') required final String precoTotal,
          final String? observacoes,
          @JsonKey(name: 'criado_em') final DateTime? criadoEm}) =
      _$OrderItemResponseModelImpl;
  const _OrderItemResponseModel._() : super._();

  factory _OrderItemResponseModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemResponseModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'pedido_id')
  String get pedidoId;
  @override
  @JsonKey(name: 'produto_id')
  String get produtoId;
  @override
  @JsonKey(name: 'nome_produto')
  String? get nomeProduto;
  @override
  int get quantidade;
  @override
  @JsonKey(name: 'preco_unitario')
  String get precoUnitario;
  @override
  @JsonKey(name: 'preco_total')
  String get precoTotal;
  @override
  String? get observacoes;
  @override
  @JsonKey(name: 'criado_em')
  DateTime? get criadoEm;

  /// Create a copy of OrderItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemResponseModelImplCopyWith<_$OrderItemResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
