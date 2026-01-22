// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductImageEntity {
  String get id => throw _privateConstructorUsedError;
  String get produtoId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get principal => throw _privateConstructorUsedError;
  int get ordem => throw _privateConstructorUsedError;

  /// Create a copy of ProductImageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductImageEntityCopyWith<ProductImageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageEntityCopyWith<$Res> {
  factory $ProductImageEntityCopyWith(
          ProductImageEntity value, $Res Function(ProductImageEntity) then) =
      _$ProductImageEntityCopyWithImpl<$Res, ProductImageEntity>;
  @useResult
  $Res call(
      {String id, String produtoId, String url, bool principal, int ordem});
}

/// @nodoc
class _$ProductImageEntityCopyWithImpl<$Res, $Val extends ProductImageEntity>
    implements $ProductImageEntityCopyWith<$Res> {
  _$ProductImageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductImageEntity
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
abstract class _$$ProductImageEntityImplCopyWith<$Res>
    implements $ProductImageEntityCopyWith<$Res> {
  factory _$$ProductImageEntityImplCopyWith(_$ProductImageEntityImpl value,
          $Res Function(_$ProductImageEntityImpl) then) =
      __$$ProductImageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String produtoId, String url, bool principal, int ordem});
}

/// @nodoc
class __$$ProductImageEntityImplCopyWithImpl<$Res>
    extends _$ProductImageEntityCopyWithImpl<$Res, _$ProductImageEntityImpl>
    implements _$$ProductImageEntityImplCopyWith<$Res> {
  __$$ProductImageEntityImplCopyWithImpl(_$ProductImageEntityImpl _value,
      $Res Function(_$ProductImageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageEntity
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
    return _then(_$ProductImageEntityImpl(
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

class _$ProductImageEntityImpl implements _ProductImageEntity {
  const _$ProductImageEntityImpl(
      {required this.id,
      required this.produtoId,
      required this.url,
      this.principal = false,
      this.ordem = 0});

  @override
  final String id;
  @override
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
    return 'ProductImageEntity(id: $id, produtoId: $produtoId, url: $url, principal: $principal, ordem: $ordem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImageEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.produtoId, produtoId) ||
                other.produtoId == produtoId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.ordem, ordem) || other.ordem == ordem));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, produtoId, url, principal, ordem);

  /// Create a copy of ProductImageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImageEntityImplCopyWith<_$ProductImageEntityImpl> get copyWith =>
      __$$ProductImageEntityImplCopyWithImpl<_$ProductImageEntityImpl>(
          this, _$identity);
}

abstract class _ProductImageEntity implements ProductImageEntity {
  const factory _ProductImageEntity(
      {required final String id,
      required final String produtoId,
      required final String url,
      final bool principal,
      final int ordem}) = _$ProductImageEntityImpl;

  @override
  String get id;
  @override
  String get produtoId;
  @override
  String get url;
  @override
  bool get principal;
  @override
  int get ordem;

  /// Create a copy of ProductImageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImageEntityImplCopyWith<_$ProductImageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
