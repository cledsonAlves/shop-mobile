// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentPreferenceRequest _$PaymentPreferenceRequestFromJson(
    Map<String, dynamic> json) {
  return _PaymentPreferenceRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentPreferenceRequest {
  @JsonKey(name: 'pedido_id')
  String get pedidoId => throw _privateConstructorUsedError;

  /// Serializes this PaymentPreferenceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentPreferenceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentPreferenceRequestCopyWith<PaymentPreferenceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentPreferenceRequestCopyWith<$Res> {
  factory $PaymentPreferenceRequestCopyWith(PaymentPreferenceRequest value,
          $Res Function(PaymentPreferenceRequest) then) =
      _$PaymentPreferenceRequestCopyWithImpl<$Res, PaymentPreferenceRequest>;
  @useResult
  $Res call({@JsonKey(name: 'pedido_id') String pedidoId});
}

/// @nodoc
class _$PaymentPreferenceRequestCopyWithImpl<$Res,
        $Val extends PaymentPreferenceRequest>
    implements $PaymentPreferenceRequestCopyWith<$Res> {
  _$PaymentPreferenceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentPreferenceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pedidoId = null,
  }) {
    return _then(_value.copyWith(
      pedidoId: null == pedidoId
          ? _value.pedidoId
          : pedidoId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentPreferenceRequestImplCopyWith<$Res>
    implements $PaymentPreferenceRequestCopyWith<$Res> {
  factory _$$PaymentPreferenceRequestImplCopyWith(
          _$PaymentPreferenceRequestImpl value,
          $Res Function(_$PaymentPreferenceRequestImpl) then) =
      __$$PaymentPreferenceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pedido_id') String pedidoId});
}

/// @nodoc
class __$$PaymentPreferenceRequestImplCopyWithImpl<$Res>
    extends _$PaymentPreferenceRequestCopyWithImpl<$Res,
        _$PaymentPreferenceRequestImpl>
    implements _$$PaymentPreferenceRequestImplCopyWith<$Res> {
  __$$PaymentPreferenceRequestImplCopyWithImpl(
      _$PaymentPreferenceRequestImpl _value,
      $Res Function(_$PaymentPreferenceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentPreferenceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pedidoId = null,
  }) {
    return _then(_$PaymentPreferenceRequestImpl(
      pedidoId: null == pedidoId
          ? _value.pedidoId
          : pedidoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentPreferenceRequestImpl implements _PaymentPreferenceRequest {
  const _$PaymentPreferenceRequestImpl(
      {@JsonKey(name: 'pedido_id') required this.pedidoId});

  factory _$PaymentPreferenceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentPreferenceRequestImplFromJson(json);

  @override
  @JsonKey(name: 'pedido_id')
  final String pedidoId;

  @override
  String toString() {
    return 'PaymentPreferenceRequest(pedidoId: $pedidoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentPreferenceRequestImpl &&
            (identical(other.pedidoId, pedidoId) ||
                other.pedidoId == pedidoId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pedidoId);

  /// Create a copy of PaymentPreferenceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentPreferenceRequestImplCopyWith<_$PaymentPreferenceRequestImpl>
      get copyWith => __$$PaymentPreferenceRequestImplCopyWithImpl<
          _$PaymentPreferenceRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentPreferenceRequestImplToJson(
      this,
    );
  }
}

abstract class _PaymentPreferenceRequest implements PaymentPreferenceRequest {
  const factory _PaymentPreferenceRequest(
          {@JsonKey(name: 'pedido_id') required final String pedidoId}) =
      _$PaymentPreferenceRequestImpl;

  factory _PaymentPreferenceRequest.fromJson(Map<String, dynamic> json) =
      _$PaymentPreferenceRequestImpl.fromJson;

  @override
  @JsonKey(name: 'pedido_id')
  String get pedidoId;

  /// Create a copy of PaymentPreferenceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentPreferenceRequestImplCopyWith<_$PaymentPreferenceRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentPreferenceResponse _$PaymentPreferenceResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentPreferenceResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentPreferenceResponse {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'init_point')
  String get initPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'sandbox_init_point')
  String get sandboxInitPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'pagamento_id')
  String get pagamentoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pedido_id')
  String get pedidoId => throw _privateConstructorUsedError;

  /// Serializes this PaymentPreferenceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentPreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentPreferenceResponseCopyWith<PaymentPreferenceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentPreferenceResponseCopyWith<$Res> {
  factory $PaymentPreferenceResponseCopyWith(PaymentPreferenceResponse value,
          $Res Function(PaymentPreferenceResponse) then) =
      _$PaymentPreferenceResponseCopyWithImpl<$Res, PaymentPreferenceResponse>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'init_point') String initPoint,
      @JsonKey(name: 'sandbox_init_point') String sandboxInitPoint,
      @JsonKey(name: 'pagamento_id') String pagamentoId,
      @JsonKey(name: 'pedido_id') String pedidoId});
}

/// @nodoc
class _$PaymentPreferenceResponseCopyWithImpl<$Res,
        $Val extends PaymentPreferenceResponse>
    implements $PaymentPreferenceResponseCopyWith<$Res> {
  _$PaymentPreferenceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentPreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? initPoint = null,
    Object? sandboxInitPoint = null,
    Object? pagamentoId = null,
    Object? pedidoId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      initPoint: null == initPoint
          ? _value.initPoint
          : initPoint // ignore: cast_nullable_to_non_nullable
              as String,
      sandboxInitPoint: null == sandboxInitPoint
          ? _value.sandboxInitPoint
          : sandboxInitPoint // ignore: cast_nullable_to_non_nullable
              as String,
      pagamentoId: null == pagamentoId
          ? _value.pagamentoId
          : pagamentoId // ignore: cast_nullable_to_non_nullable
              as String,
      pedidoId: null == pedidoId
          ? _value.pedidoId
          : pedidoId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentPreferenceResponseImplCopyWith<$Res>
    implements $PaymentPreferenceResponseCopyWith<$Res> {
  factory _$$PaymentPreferenceResponseImplCopyWith(
          _$PaymentPreferenceResponseImpl value,
          $Res Function(_$PaymentPreferenceResponseImpl) then) =
      __$$PaymentPreferenceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'init_point') String initPoint,
      @JsonKey(name: 'sandbox_init_point') String sandboxInitPoint,
      @JsonKey(name: 'pagamento_id') String pagamentoId,
      @JsonKey(name: 'pedido_id') String pedidoId});
}

/// @nodoc
class __$$PaymentPreferenceResponseImplCopyWithImpl<$Res>
    extends _$PaymentPreferenceResponseCopyWithImpl<$Res,
        _$PaymentPreferenceResponseImpl>
    implements _$$PaymentPreferenceResponseImplCopyWith<$Res> {
  __$$PaymentPreferenceResponseImplCopyWithImpl(
      _$PaymentPreferenceResponseImpl _value,
      $Res Function(_$PaymentPreferenceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentPreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? initPoint = null,
    Object? sandboxInitPoint = null,
    Object? pagamentoId = null,
    Object? pedidoId = null,
  }) {
    return _then(_$PaymentPreferenceResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      initPoint: null == initPoint
          ? _value.initPoint
          : initPoint // ignore: cast_nullable_to_non_nullable
              as String,
      sandboxInitPoint: null == sandboxInitPoint
          ? _value.sandboxInitPoint
          : sandboxInitPoint // ignore: cast_nullable_to_non_nullable
              as String,
      pagamentoId: null == pagamentoId
          ? _value.pagamentoId
          : pagamentoId // ignore: cast_nullable_to_non_nullable
              as String,
      pedidoId: null == pedidoId
          ? _value.pedidoId
          : pedidoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentPreferenceResponseImpl implements _PaymentPreferenceResponse {
  const _$PaymentPreferenceResponseImpl(
      {required this.id,
      @JsonKey(name: 'init_point') required this.initPoint,
      @JsonKey(name: 'sandbox_init_point') required this.sandboxInitPoint,
      @JsonKey(name: 'pagamento_id') required this.pagamentoId,
      @JsonKey(name: 'pedido_id') required this.pedidoId});

  factory _$PaymentPreferenceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentPreferenceResponseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'init_point')
  final String initPoint;
  @override
  @JsonKey(name: 'sandbox_init_point')
  final String sandboxInitPoint;
  @override
  @JsonKey(name: 'pagamento_id')
  final String pagamentoId;
  @override
  @JsonKey(name: 'pedido_id')
  final String pedidoId;

  @override
  String toString() {
    return 'PaymentPreferenceResponse(id: $id, initPoint: $initPoint, sandboxInitPoint: $sandboxInitPoint, pagamentoId: $pagamentoId, pedidoId: $pedidoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentPreferenceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.initPoint, initPoint) ||
                other.initPoint == initPoint) &&
            (identical(other.sandboxInitPoint, sandboxInitPoint) ||
                other.sandboxInitPoint == sandboxInitPoint) &&
            (identical(other.pagamentoId, pagamentoId) ||
                other.pagamentoId == pagamentoId) &&
            (identical(other.pedidoId, pedidoId) ||
                other.pedidoId == pedidoId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, initPoint, sandboxInitPoint, pagamentoId, pedidoId);

  /// Create a copy of PaymentPreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentPreferenceResponseImplCopyWith<_$PaymentPreferenceResponseImpl>
      get copyWith => __$$PaymentPreferenceResponseImplCopyWithImpl<
          _$PaymentPreferenceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentPreferenceResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentPreferenceResponse implements PaymentPreferenceResponse {
  const factory _PaymentPreferenceResponse(
          {required final String id,
          @JsonKey(name: 'init_point') required final String initPoint,
          @JsonKey(name: 'sandbox_init_point')
          required final String sandboxInitPoint,
          @JsonKey(name: 'pagamento_id') required final String pagamentoId,
          @JsonKey(name: 'pedido_id') required final String pedidoId}) =
      _$PaymentPreferenceResponseImpl;

  factory _PaymentPreferenceResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentPreferenceResponseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'init_point')
  String get initPoint;
  @override
  @JsonKey(name: 'sandbox_init_point')
  String get sandboxInitPoint;
  @override
  @JsonKey(name: 'pagamento_id')
  String get pagamentoId;
  @override
  @JsonKey(name: 'pedido_id')
  String get pedidoId;

  /// Create a copy of PaymentPreferenceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentPreferenceResponseImplCopyWith<_$PaymentPreferenceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'pedido_id')
  String get pedidoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'preference_id')
  String? get preferenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_id')
  String? get paymentId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_detail')
  String? get statusDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String? get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String? get paymentMethod => throw _privateConstructorUsedError;
  double get valor => throw _privateConstructorUsedError;
  @JsonKey(name: 'payer_email')
  String? get payerEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'init_point')
  String? get initPoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'criado_em')
  DateTime? get criadoEm => throw _privateConstructorUsedError;
  @JsonKey(name: 'atualizado_em')
  DateTime? get atualizadoEm => throw _privateConstructorUsedError;

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'pedido_id') String pedidoId,
      @JsonKey(name: 'preference_id') String? preferenceId,
      @JsonKey(name: 'payment_id') String? paymentId,
      String status,
      @JsonKey(name: 'status_detail') String? statusDetail,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      double valor,
      @JsonKey(name: 'payer_email') String? payerEmail,
      @JsonKey(name: 'init_point') String? initPoint,
      @JsonKey(name: 'criado_em') DateTime? criadoEm,
      @JsonKey(name: 'atualizado_em') DateTime? atualizadoEm});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pedidoId = null,
    Object? preferenceId = freezed,
    Object? paymentId = freezed,
    Object? status = null,
    Object? statusDetail = freezed,
    Object? paymentType = freezed,
    Object? paymentMethod = freezed,
    Object? valor = null,
    Object? payerEmail = freezed,
    Object? initPoint = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
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
      preferenceId: freezed == preferenceId
          ? _value.preferenceId
          : preferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusDetail: freezed == statusDetail
          ? _value.statusDetail
          : statusDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as double,
      payerEmail: freezed == payerEmail
          ? _value.payerEmail
          : payerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      initPoint: freezed == initPoint
          ? _value.initPoint
          : initPoint // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: freezed == atualizadoEm
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'pedido_id') String pedidoId,
      @JsonKey(name: 'preference_id') String? preferenceId,
      @JsonKey(name: 'payment_id') String? paymentId,
      String status,
      @JsonKey(name: 'status_detail') String? statusDetail,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'payment_method') String? paymentMethod,
      double valor,
      @JsonKey(name: 'payer_email') String? payerEmail,
      @JsonKey(name: 'init_point') String? initPoint,
      @JsonKey(name: 'criado_em') DateTime? criadoEm,
      @JsonKey(name: 'atualizado_em') DateTime? atualizadoEm});
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pedidoId = null,
    Object? preferenceId = freezed,
    Object? paymentId = freezed,
    Object? status = null,
    Object? statusDetail = freezed,
    Object? paymentType = freezed,
    Object? paymentMethod = freezed,
    Object? valor = null,
    Object? payerEmail = freezed,
    Object? initPoint = freezed,
    Object? criadoEm = freezed,
    Object? atualizadoEm = freezed,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      pedidoId: null == pedidoId
          ? _value.pedidoId
          : pedidoId // ignore: cast_nullable_to_non_nullable
              as String,
      preferenceId: freezed == preferenceId
          ? _value.preferenceId
          : preferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusDetail: freezed == statusDetail
          ? _value.statusDetail
          : statusDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      valor: null == valor
          ? _value.valor
          : valor // ignore: cast_nullable_to_non_nullable
              as double,
      payerEmail: freezed == payerEmail
          ? _value.payerEmail
          : payerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      initPoint: freezed == initPoint
          ? _value.initPoint
          : initPoint // ignore: cast_nullable_to_non_nullable
              as String?,
      criadoEm: freezed == criadoEm
          ? _value.criadoEm
          : criadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      atualizadoEm: freezed == atualizadoEm
          ? _value.atualizadoEm
          : atualizadoEm // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl implements _PaymentModel {
  const _$PaymentModelImpl(
      {required this.id,
      @JsonKey(name: 'pedido_id') required this.pedidoId,
      @JsonKey(name: 'preference_id') this.preferenceId,
      @JsonKey(name: 'payment_id') this.paymentId,
      required this.status,
      @JsonKey(name: 'status_detail') this.statusDetail,
      @JsonKey(name: 'payment_type') this.paymentType,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      required this.valor,
      @JsonKey(name: 'payer_email') this.payerEmail,
      @JsonKey(name: 'init_point') this.initPoint,
      @JsonKey(name: 'criado_em') this.criadoEm,
      @JsonKey(name: 'atualizado_em') this.atualizadoEm});

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'pedido_id')
  final String pedidoId;
  @override
  @JsonKey(name: 'preference_id')
  final String? preferenceId;
  @override
  @JsonKey(name: 'payment_id')
  final String? paymentId;
  @override
  final String status;
  @override
  @JsonKey(name: 'status_detail')
  final String? statusDetail;
  @override
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @override
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @override
  final double valor;
  @override
  @JsonKey(name: 'payer_email')
  final String? payerEmail;
  @override
  @JsonKey(name: 'init_point')
  final String? initPoint;
  @override
  @JsonKey(name: 'criado_em')
  final DateTime? criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  final DateTime? atualizadoEm;

  @override
  String toString() {
    return 'PaymentModel(id: $id, pedidoId: $pedidoId, preferenceId: $preferenceId, paymentId: $paymentId, status: $status, statusDetail: $statusDetail, paymentType: $paymentType, paymentMethod: $paymentMethod, valor: $valor, payerEmail: $payerEmail, initPoint: $initPoint, criadoEm: $criadoEm, atualizadoEm: $atualizadoEm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pedidoId, pedidoId) ||
                other.pedidoId == pedidoId) &&
            (identical(other.preferenceId, preferenceId) ||
                other.preferenceId == preferenceId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusDetail, statusDetail) ||
                other.statusDetail == statusDetail) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.valor, valor) || other.valor == valor) &&
            (identical(other.payerEmail, payerEmail) ||
                other.payerEmail == payerEmail) &&
            (identical(other.initPoint, initPoint) ||
                other.initPoint == initPoint) &&
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
      pedidoId,
      preferenceId,
      paymentId,
      status,
      statusDetail,
      paymentType,
      paymentMethod,
      valor,
      payerEmail,
      initPoint,
      criadoEm,
      atualizadoEm);

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  const factory _PaymentModel(
          {required final String id,
          @JsonKey(name: 'pedido_id') required final String pedidoId,
          @JsonKey(name: 'preference_id') final String? preferenceId,
          @JsonKey(name: 'payment_id') final String? paymentId,
          required final String status,
          @JsonKey(name: 'status_detail') final String? statusDetail,
          @JsonKey(name: 'payment_type') final String? paymentType,
          @JsonKey(name: 'payment_method') final String? paymentMethod,
          required final double valor,
          @JsonKey(name: 'payer_email') final String? payerEmail,
          @JsonKey(name: 'init_point') final String? initPoint,
          @JsonKey(name: 'criado_em') final DateTime? criadoEm,
          @JsonKey(name: 'atualizado_em') final DateTime? atualizadoEm}) =
      _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'pedido_id')
  String get pedidoId;
  @override
  @JsonKey(name: 'preference_id')
  String? get preferenceId;
  @override
  @JsonKey(name: 'payment_id')
  String? get paymentId;
  @override
  String get status;
  @override
  @JsonKey(name: 'status_detail')
  String? get statusDetail;
  @override
  @JsonKey(name: 'payment_type')
  String? get paymentType;
  @override
  @JsonKey(name: 'payment_method')
  String? get paymentMethod;
  @override
  double get valor;
  @override
  @JsonKey(name: 'payer_email')
  String? get payerEmail;
  @override
  @JsonKey(name: 'init_point')
  String? get initPoint;
  @override
  @JsonKey(name: 'criado_em')
  DateTime? get criadoEm;
  @override
  @JsonKey(name: 'atualizado_em')
  DateTime? get atualizadoEm;

  /// Create a copy of PaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
