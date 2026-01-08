import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acompanhamento do Pedido'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: Center(child: Icon(Icons.map, size: 100, color: Colors.grey)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Saiu para entrega', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(8)),
                        child: Text('AO VIVO', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Text('Previsão: 14:45 - 15:00', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 24),
                  // Timeline simplificada
                  Row(
                    children: [
                      CircleAvatar(radius: 6, backgroundColor: AppTheme.primaryColor),
                      Expanded(child: Container(height: 2, color: AppTheme.primaryColor)),
                      CircleAvatar(radius: 6, backgroundColor: AppTheme.primaryColor),
                      Expanded(child: Container(height: 2, color: Colors.grey[300])),
                      CircleAvatar(radius: 6, backgroundColor: Colors.grey[300]),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text('Informe este código ao receber:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(height: 8),
                        Text('4829', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 8, color: AppTheme.primaryColor)),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=carlos')),
                    title: Text('Carlos Silva', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Moto Honda CG 160 • ABC-1234'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: Icon(Icons.message, color: AppTheme.primaryColor), onPressed: () {}),
                        IconButton(icon: Icon(Icons.phone, color: AppTheme.primaryColor), onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
