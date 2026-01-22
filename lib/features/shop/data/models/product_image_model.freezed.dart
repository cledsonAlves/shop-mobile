// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductImageModel _$ProductImageModelFromJson(Map<String, dynamic> json) {
  return _ProductImageModel.fromJson(json);
}

/// @nodoc
mixin _$ProductImageModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'produto_id')
  String get produtoId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get principal => throw _privateConstructorUsedError;
  int get ordem => throw _privateConstructorUsedError;

  /// Serializes this ProductImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductImageModelCopyWith<ProductImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageModelCopyWith<$Res> {
  factory $ProductImageModelCopyWith(
          ProductImageModel value, $Res Function(ProductImageModel) then) =
      _$ProductImageModelCopyWithImpl<$Res, ProductImageModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'produto_id') String produtoId,
      String url,
      bool principal,
      int ordem});
}

/// @nodoc
class _$ProductImageModelCopyWithImpl<$Res, $Val extends ProductImageModel>
    implements $ProductImageModelCopyWith<$Res> {
  _$ProductImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? produtoId = null,
    Object? url = null,
    Object? principal = null,
    Object? ordem = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      produtoId: null == produtoId
          ? _value.produtoId
          : produtoId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as bool,
      ordem: null == ordem
          ? _value.ordem
          : ordem // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImageModelImplCopyWith<$Res>
    implements $ProductImageModelCopyWith<$Res> {
  factory _$$ProductImageModelImplCopyWith(_$ProductImageModelImpl value,
          $Res Function(_$ProductImageModelImpl) then) =
      __$$ProductImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'produto_id') String produtoId,
      String url,
      bool principal,
      int ordem});
}

/// @nodoc
class __$$ProductImageModelImplCopyWithImpl<$Res>
    extends _$ProductImageModelCopyWithImpl<$Res, _$ProductImageModelImpl>
    implements _$$ProductImageModelImplCopyWith<$Res> {
  __$$ProductImageModelImplCopyWithImpl(_$ProductImageModelImpl _value,
      $Res Function(_$ProductImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? produtoId = null,
    Object? url = null,
    Object? principal = null,
    Object? ordem = null,
  }) {
    return _then(_$ProductImageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      produtoId: null == produtoId
          ? _value.produtoId
          : produtoId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as bool,
      ordem: null == ordem
          ? _value.ordem
          : ordem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImageModelImpl implements _ProductImageModel {
  const _$ProductImageModelImpl(
      {required this.id,
      @JsonKey(name: 'produto_id') required this.produtoId,
      required this.url,
      this.principal = false,
      this.ordem = 0});

  factory _$ProductImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImageModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'produto_id')
  final String produtoId;
  @override
  final String url;
  @override
  @JsonKey()
  final bool principal;
  @override
  @JsonKey()
  final int ordem;

  @override
  String toString() {
    return 'ProductImageModel(id: $id, produtoId: $produtoId, url: $url, principal: $principal, ordem: $ordem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.produtoId, produtoId) ||
                other.produtoId == produtoId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.ordem, ordem) || other.ordem == ordem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, produtoId, url, principal, ordem);

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImageModelImplCopyWith<_$ProductImageModelImpl> get copyWith =>
      __$$ProductImageModelImplCopyWithImpl<_$ProductImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImageModelImplToJson(
      this,
    );
  }
}

abstract class _ProductImageModel implements ProductImageModel {
  const factory _ProductImageModel(
      {required final String id,
      @JsonKey(name: 'produto_id') required final String produtoId,
      required final String url,
      final bool principal,
      final int ordem}) = _$ProductImageModelImpl;

  factory _ProductImageModel.fromJson(Map<String, dynamic> json) =
      _$ProductImageModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'produto_id')
  String get produtoId;
  @override
  String get url;
  @override
  bool get principal;
  @override
  int get ordem;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImageModelImplCopyWith<_$ProductImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
