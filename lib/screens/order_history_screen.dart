import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'order_tracking_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meus Pedidos'),
          bottom: TabBar(
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
            _buildOrderList(context, true),
            _buildOrderList(context, false),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(BuildContext context, bool isActive) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: isActive ? 1 : 2,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.bottom(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1509440159596-0249088772ff?w=100')),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(isActive ? 'Hamburgueria do Zé' : 'Padaria Central', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('2x X-Bacon, 1x Coca-Cola 2L', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Text('R\$ 56,90', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isActive)
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.orange[50], borderRadius: BorderRadius.circular(8)),
                      child: Text('4590', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                    ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (isActive) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderTrackingScreen()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isActive ? AppTheme.primaryColor : Colors.white,
                        foregroundColor: isActive ? Colors.white : AppTheme.primaryColor,
                        side: isActive ? null : BorderSide(color: AppTheme.primaryColor),
                      ),
                      child: Text(isActive ? 'Acompanhar pedido' : 'Comprar novamente'),
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
