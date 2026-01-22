import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../providers/order_provider.dart';
import '../providers/mock_providers.dart';
import '../../domain/entities/order_entity.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeOrdersAsync = ref.watch(activeOrdersProvider);
    final completedOrdersAsync = ref.watch(completedOrdersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Meus Pedidos',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                  ),
                ],
              ),
              indicatorPadding: const EdgeInsets.all(4),
              labelColor: AppTheme.primaryColor,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Em andamento'),
                Tab(text: 'Concluídos'),
              ],
            ),
          ),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Em andamento
                activeOrdersAsync.when(
                  data: (orders) => _buildActiveOrdersList(orders),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (_, __) => _buildErrorState(() => ref.invalidate(activeOrdersProvider)),
                ),
                // Concluídos
                completedOrdersAsync.when(
                  data: (orders) => _buildCompletedOrdersList(orders),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (_, __) => _buildErrorState(() => ref.invalidate(completedOrdersProvider)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(VoidCallback onRetry) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.red[300]),
          const SizedBox(height: 16),
          const Text('Erro ao carregar pedidos'),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveOrdersList(List<OrderEntity> orders) {
    if (orders.isEmpty) {
      return _buildEmptyState('Nenhum pedido em andamento');
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: orders.length,
      itemBuilder: (context, index) => _buildActiveOrderCard(orders[index]),
    );
  }

  Widget _buildCompletedOrdersList(List<OrderEntity> orders) {
    if (orders.isEmpty) {
      return _buildEmptyState('Nenhum pedido concluído');
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('ANTERIORES', style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 1)),
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),
        ...orders.map((order) => _buildCompletedOrderCard(order)),
        const SizedBox(height: 40),
        Center(
          child: Column(
            children: [
              Icon(Icons.history, size: 48, color: Colors.grey[300]),
              const SizedBox(height: 8),
              Text('Fim do histórico', style: TextStyle(color: Colors.grey[400])),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildActiveOrderCard(OrderEntity order) {
    final storeNameAsync = ref.watch(storeNameProvider(order.lojistaId));
    final storeName = storeNameAsync.when(
      data: (name) => name,
      loading: () => 'Carregando...',
      error: (_, __) => order.nomeLojista ?? 'Loja',
    );
    final storeLogoUrl = 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(storeName)}&background=f06e42&color=fff';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _getStatusColor(order.status),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    order.status.toDisplayString().toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: _getStatusColor(order.status),
                    ),
                  ),
                ],
              ),
              Text(
                _formatDate(order.criadoEm),
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Info do pedido
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  storeLogoUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(storeName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(order.resumoItens, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                    Text('R\$ ${order.total.toStringAsFixed(2).replaceAll('.', ',')}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Código de entrega
          if (order.codigoConfirmacao != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CÓDIGO DE ENTREGA', style: TextStyle(fontSize: 10, color: Colors.grey[500], letterSpacing: 0.5)),
                      const SizedBox(height: 4),
                      Text(
                        order.codigoConfirmacao!,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.primaryColor, letterSpacing: 4),
                      ),
                    ],
                  ),
                  Icon(Icons.check_circle, color: Colors.green.shade400, size: 28),
                ],
              ),
            ),
          const SizedBox(height: 16),

          // Botão acompanhar
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () => context.push('/delivery-code/${order.id}'),
              icon: const Icon(Icons.map_outlined),
              label: const Text('Acompanhar pedido'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedOrderCard(OrderEntity order) {
    final storeNameAsync = ref.watch(storeNameProvider(order.lojistaId));
    final storeName = storeNameAsync.when(
      data: (name) => name,
      loading: () => 'Carregando...',
      error: (_, __) => order.nomeLojista ?? 'Loja',
    );
    final storeLogoUrl = 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(storeName)}&background=f06e42&color=fff';
    final dateStr = _formatDate(order.criadoEm);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              storeLogoUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(storeName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(order.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        order.status.toDisplayString().toUpperCase(),
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: _getStatusColor(order.status)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text('$dateStr • Pedido #${order.id.substring(0, 8.clamp(0, order.id.length))}', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                const SizedBox(height: 4),
                Text(order.resumoItens, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'R\$ ${order.total.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.refresh, size: 16, color: AppTheme.primaryColor),
                        const SizedBox(width: 4),
                        Text(
                          'Comprar novamente',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(message, style: TextStyle(color: Colors.grey[500], fontSize: 16)),
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
        return AppTheme.primaryColor;
      case OrderStatus.entregue:
        return Colors.green;
      case OrderStatus.cancelado:
        return Colors.red;
    }
  }

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'];
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final orderDate = DateTime(date.year, date.month, date.day);
    
    if (orderDate == today) {
      return 'Hoje, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (orderDate == today.subtract(const Duration(days: 1))) {
      return 'Ontem';
    } else {
      return '${date.day} ${months[date.month - 1]}';
    }
  }
}
