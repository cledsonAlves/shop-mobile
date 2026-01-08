import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';
import 'order_tracking_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
          bottom: TabBar(
            labelColor: AppTheme.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppTheme.primaryColor,
            tabs: const [
              Tab(text: 'Em andamento'),
              Tab(text: 'Concluídos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList(context, true),
            _buildOrderList(context, false),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, bool isActive) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: isActive ? 1 : 2,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 4),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=100',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isActive ? 'Hamburgueria do Zé' : 'Padaria Central',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '2x X-Bacon, 1x Coca-Cola 2L',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'R\$ 56,90',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isActive)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '4590',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: isActive ? 8 : 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (isActive) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderTrackingScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isActive
                              ? AppTheme.primaryColor
                              : Colors.white,
                          foregroundColor: isActive
                              ? Colors.white
                              : AppTheme.primaryColor,
                          side: isActive
                              ? null
                              : BorderSide(color: AppTheme.primaryColor),
                        ),
                        child: Text(
                          isActive ? 'Acompanhar pedido' : 'Comprar novamente',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
