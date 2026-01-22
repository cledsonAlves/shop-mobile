import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=maria')),
                  SizedBox(height: 16),
                  Text('Cledson Alves', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('⭐ 4.9 • Membro desde 2023', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                _buildStatCard('1', 'Pedidos\nAtivos'),
                SizedBox(width: 16),
                _buildStatCard('3', 'Cupons'),
              ],
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange[100]!, Colors.orange[50]!]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.qr_code, color: AppTheme.primaryColor),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Código de Entrega', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Informe ao motoboy para receber seu pedido atual.', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(8)),
                    child: Text('#8392', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            _buildMenuSection('Minha Conta', [
              _buildMenuItem(Icons.person_outline, 'Dados Pessoais'),
              _buildMenuItem(Icons.location_on_outlined, 'Meus Endereços'),
              _buildMenuItem(Icons.account_balance_wallet_outlined, 'Carteira & Pagamento'),
            ]),
            SizedBox(height: 24),
            _buildMenuSection('Mais', [
              _buildMenuItem(Icons.help_outline, 'Precisa de Ajuda?'),
              _buildMenuItem(Icons.settings_outlined, 'Configurações'),
            ]),
            SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              child: Text('SAIR DA CONTA', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
            Text('Jarinu Shop v1.0.0', style: TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ...items,
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: Icon(Icons.chevron_right, size: 20),
      onTap: () {},
    );
  }
}
