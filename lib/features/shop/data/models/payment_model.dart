import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

/// Modelo para criar preferência de pagamento
@freezed
class PaymentPreferenceRequest with _$PaymentPreferenceRequest {
  const factory PaymentPreferenceRequest({
    @JsonKey(name: 'pedido_id') required String pedidoId,
  }) = _PaymentPreferenceRequest;

  factory PaymentPreferenceRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentPreferenceRequestFromJson(json);
}

/// Resposta da criação de preferência
@freezed
class PaymentPreferenceResponse with _$PaymentPreferenceResponse {
  const factory PaymentPreferenceResponse({
    required String id,
    @JsonKey(name: 'init_point') required String initPoint,
    @JsonKey(name: 'sandbox_init_point') required String sandboxInitPoint,
    @JsonKey(name: 'pagamento_id') required String pagamentoId,
    @JsonKey(name: 'pedido_id') required String pedidoId,
  }) = _PaymentPreferenceResponse;

  factory PaymentPreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentPreferenceResponseFromJson(json);
}

/// Modelo de pagamento
@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String id,
    @JsonKey(name: 'pedido_id') required String pedidoId,
    @JsonKey(name: 'preference_id') String? preferenceId,
    @JsonKey(name: 'payment_id') String? paymentId,
    required String status,
    @JsonKey(name: 'status_detail') String? statusDetail,
    @JsonKey(name: 'payment_type') String? paymentType,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    required double valor,
    @JsonKey(name: 'payer_email') String? payerEmail,
    @JsonKey(name: 'init_point') String? initPoint,
    @JsonKey(name: 'criado_em') DateTime? criadoEm,
    @JsonKey(name: 'atualizado_em') DateTime? atualizadoEm,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
