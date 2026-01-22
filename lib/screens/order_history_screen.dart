import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';
import '../features/shop/domain/entities/order_entity.dart';
import '../features/shop/presentation/providers/order_provider.dart';
import '../features/shop/presentation/providers/mock_providers.dart';
import 'order_tracking_screen.dart';

class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
          bottom: const TabBar(
            labelColor: AppTheme.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppTheme.primaryColor,
            tabs: [
              Tab(text: 'Em andamento'),
              Tab(text: 'Concluídos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildActiveOrdersTab(ref),
            _buildCompletedOrdersTab(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveOrdersTab(WidgetRef ref) {
    final activeOrdersAsync = ref.watch(activeOrdersProvider);
    
    return activeOrdersAsync.when(
      data: (orders) {
        if (orders.isEmpty) {
          return _buildEmptyState(
            icon: Icons.local_shipping_outlined,
            title: 'Nenhum pedido em andamento',
            subtitle: 'Seus pedidos ativos aparecerão aqui',
          );
        }
        return _buildOrderList(orders, isActive: true);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _buildErrorState(error.toString(), ref),
    );
  }

  Widget _buildCompletedOrdersTab(WidgetRef ref) {
    final completedOrdersAsync = ref.watch(completedOrdersProvider);
    
    return completedOrdersAsync.when(
      data: (orders) {
        if (orders.isEmpty) {
          return _buildEmptyState(
            icon: Icons.history,
            title: 'Nenhum pedido concluído',
            subtitle: 'Seu histórico de pedidos aparecerá aqui',
          );
        }
        return _buildOrderList(orders, isActive: false);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _buildErrorState(error.toString(), ref),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            'Erro ao carregar pedidos',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () => ref.invalidate(clientOrdersProvider),
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList(List<OrderEntity> orders, {required bool isActive}) {
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh é tratado pelo Riverpod
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return _OrderCard(order: order, isActive: isActive);
        },
      ),
    );
  }
}

class _OrderCard extends ConsumerWidget {
  final OrderEntity order;
  final bool isActive;

  const _OrderCard({required this.order, required this.isActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeNameAsync = ref.watch(storeNameProvider(order.lojistaId));
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://ui-avatars.com/api/?name=${Uri.encodeComponent(order.nomeLojista ?? 'Loja')}&background=f06e42&color=fff',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    storeNameAsync.when(
                      data: (name) => Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      loading: () => const Text('Carregando...'),
                      error: (_, __) => Text(order.nomeLojista ?? 'Loja'),
                    ),
                    Text(
                      order.resumoItens,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text(
                'R\$ ${order.total.toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              // Status badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(order.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  order.status.toDisplayString(),
                  style: TextStyle(
                    color: _getStatusColor(order.status),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (isActive && order.codigoConfirmacao != null) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.codigoConfirmacao!,
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderTrackingScreen(orderId: order.id),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isActive ? AppTheme.primaryColor : Colors.white,
                    foregroundColor: isActive ? Colors.white : AppTheme.primaryColor,
                    side: isActive ? null : const BorderSide(color: AppTheme.primaryColor),
                  ),
                  child: Text(isActive ? 'Acompanhar pedido' : 'Ver detalhes'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pendente:
        return Colors.orange;
      case OrderStatus.confirmado:
        return Colors.blue;
      case OrderStatus.preparando:
        return Colors.purple;
      case OrderStatus.em_entrega:
        return Colors.green;
      case OrderStatus.entregue:
        return Colors.teal;
      case OrderStatus.cancelado:
        return Colors.red;
    }
  }
}
