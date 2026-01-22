import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection_container.dart';
import '../../data/datasources/shop_api.dart';
import '../../data/models/payment_model.dart';

/// Estado do pagamento
enum PaymentStatus { initial, loading, success, error }

class PaymentState {
  final PaymentStatus status;
  final PaymentPreferenceResponse? preference;
  final PaymentModel? payment;
  final String? errorMessage;

  const PaymentState({
    this.status = PaymentStatus.initial,
    this.preference,
    this.payment,
    this.errorMessage,
  });

  PaymentState copyWith({
    PaymentStatus? status,
    PaymentPreferenceResponse? preference,
    PaymentModel? payment,
    String? errorMessage,
  }) {
    return PaymentState(
      status: status ?? this.status,
      preference: preference ?? this.preference,
      payment: payment ?? this.payment,
      errorMessage: errorMessage,
    );
  }
}

/// Notifier para gerenciar pagamentos
class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier() : super(const PaymentState());

  /// Cria preferência de pagamento e abre o checkout do Mercado Pago
  Future<bool> createPaymentAndOpenCheckout(String pedidoId) async {
    state = state.copyWith(status: PaymentStatus.loading);

    try {
      final shopApi = getIt<ShopApi>();
      final preference = await shopApi.createPaymentPreference(pedidoId);

      state = state.copyWith(
        status: PaymentStatus.success,
        preference: preference,
      );

      // Abre o link do Mercado Pago no navegador
      // Em ambiente de teste, usa sandbox_init_point
      // Em produção, usar init_point
      final url = Uri.parse(preference.sandboxInitPoint);
      
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        return true;
      } else {
        state = state.copyWith(
          status: PaymentStatus.error,
          errorMessage: 'Não foi possível abrir o link de pagamento',
        );
        return false;
      }
    } catch (e) {
      print('Erro ao criar preferência de pagamento: $e');
      state = state.copyWith(
        status: PaymentStatus.error,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  /// Consulta o status do pagamento de um pedido
  Future<PaymentModel?> getPaymentStatus(String pedidoId) async {
    try {
      final shopApi = getIt<ShopApi>();
      final payment = await shopApi.getPaymentByOrder(pedidoId);
      
      if (payment != null) {
        state = state.copyWith(payment: payment);
      }
      
      return payment;
    } catch (e) {
      print('Erro ao consultar pagamento: $e');
      return null;
    }
  }

  /// Reseta o estado
  void reset() {
    state = const PaymentState();
  }
}

/// Provider de pagamentos
final paymentProvider = StateNotifierProvider<PaymentNotifier, PaymentState>((ref) {
  return PaymentNotifier();
});
