import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';
import '../features/shop/domain/entities/order_entity.dart';
import '../features/shop/presentation/providers/order_provider.dart';
import '../features/shop/presentation/providers/mock_providers.dart';

class OrderTrackingScreen extends ConsumerWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderAsync = ref.watch(orderByIdProvider(orderId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acompanhamento do Pedido'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: orderAsync.when(
        data: (order) {
          if (order == null) {
            return const Center(child: Text('Pedido não encontrado'));
          }
          return _buildOrderTracking(context, ref, order);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 60, color: Colors.red[300]),
              const SizedBox(height: 16),
              const Text('Erro ao carregar pedido'),
              TextButton.icon(
                onPressed: () => ref.invalidate(orderByIdProvider(orderId)),
                icon: const Icon(Icons.refresh),
                label: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderTracking(BuildContext context, WidgetRef ref, OrderEntity order) {
    final storeNameAsync = ref.watch(storeNameProvider(order.lojistaId));

    return Column(
      children: [
        // Mapa placeholder
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.grey[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 8),
                  Text(
                    'Mapa de rastreamento',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Detalhes do pedido
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status e badge ao vivo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          order.status.toDisplayString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (order.isActive)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'AO VIVO',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  storeNameAsync.when(
                    data: (name) => Text(
                      name,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 24),
                  
                  // Timeline de status
                  _buildStatusTimeline(order.status),
                  
                  const SizedBox(height: 32),
                  
                  // Código de confirmação
                  if (order.codigoConfirmacao != null) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[200]!),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Informe este código ao receber:',
                            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            order.codigoConfirmacao!,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 8,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  
                  // Lista de itens
                  if (order.itens.isNotEmpty) ...[
                    const Text(
                      'Itens do pedido',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...order.itens.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${item.quantidade}x ${item.nomeProduto}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          Text(
                            'R\$ ${item.subtotal.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    )),
                    const Divider(height: 24),
                  ],
                  
                  // Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$ ${order.total.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Endereço de entrega
                  if (order.enderecoEntrega != null) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey[600], size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${order.enderecoEntrega}, ${order.cidadeEntrega ?? ''} - ${order.estadoEntrega ?? ''}',
                              style: TextStyle(color: Colors.grey[700], fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusTimeline(OrderStatus currentStatus) {
    final statuses = [
      OrderStatus.pendente,
      OrderStatus.confirmado,
      OrderStatus.preparando,
      OrderStatus.em_entrega,
      OrderStatus.entregue,
    ];

    final currentIndex = statuses.indexOf(currentStatus);
    final isCancelled = currentStatus == OrderStatus.cancelado;

    if (isCancelled) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.cancel, color: Colors.red[400]),
            const SizedBox(width: 12),
            const Text(
              'Pedido cancelado',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      children: List.generate(statuses.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Linha entre círculos
          final lineIndex = index ~/ 2;
          final isCompleted = lineIndex < currentIndex;
          return Expanded(
            child: Container(
              height: 3,
              color: isCompleted ? AppTheme.primaryColor : Colors.grey[300],
            ),
          );
        } else {
          // Círculo de status
          final statusIndex = index ~/ 2;
          final isCompleted = statusIndex <= currentIndex;
          final isCurrent = statusIndex == currentIndex;
          
          return Column(
            children: [
              Container(
                width: isCurrent ? 16 : 12,
                height: isCurrent ? 16 : 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? AppTheme.primaryColor : Colors.grey[300],
                  border: isCurrent
                      ? Border.all(color: AppTheme.primaryColor, width: 3)
                      : null,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
