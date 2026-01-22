import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../auth/domain/entities/client_entity.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final client = authState.client;

    // Se não estiver autenticado, mostrar tela de login
    if (!authState.isAuthenticated || client == null) {
      return _buildNotAuthenticatedView(context);
    }

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
          'Meu Perfil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header com foto e info
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Avatar com borda
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.primaryColor, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            radius: 54,
                            backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                            child: Text(
                              _getInitials(client.nome),
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(client.nome, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined, color: Colors.grey[600], size: 16),
                      const SizedBox(width: 4),
                      Text(client.email, style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  if (client.criadoEm != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Membro desde ${client.criadoEm!.year}',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 24),

                  // Stats
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.shopping_bag_outlined, color: AppTheme.primaryColor),
                              ),
                              const SizedBox(width: 12),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Pedidos\nAtivos', style: TextStyle(fontSize: 11, color: Colors.grey[600], height: 1.2)),
                                    const Text('0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.confirmation_number_outlined, color: AppTheme.primaryColor),
                              ),
                              const SizedBox(width: 12),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Cupons', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                                    const Text('0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // Informações de endereço se disponíveis
                  if (client.endereco != null || client.cidade != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.location_on_outlined, color: AppTheme.primaryColor),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Endereço',
                                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                                ),
                                Text(
                                  _formatAddress(client),
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Minha Conta
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Text('Minha Conta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  _buildMenuItem(Icons.person_outline, 'Dados Pessoais', client.email),
                  _buildMenuItem(Icons.location_on_outlined, 'Meus Endereços', client.cidade),
                  _buildMenuItem(Icons.credit_card_outlined, 'Carteira & Pagamento', null),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Mais
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Text('Mais', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  _buildMenuItem(Icons.headset_mic_outlined, 'Precisa de Ajuda?', null),
                  _buildMenuItem(Icons.settings_outlined, 'Configurações', null),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Sair
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () async {
                        await ref.read(authProvider.notifier).logout();
                        if (context.mounted) {
                          context.go('/');
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red.shade300),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        'SAIR DA CONTA',
                        style: TextStyle(color: Colors.red.shade400, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Jarinu Shop v2.4.0', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildNotAuthenticatedView(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Meu Perfil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_outline,
                  size: 50,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Entre na sua conta',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Faça login para acessar seu perfil, acompanhar pedidos e muito mais!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => context.go('/login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'ENTRAR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.go('/register'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: AppTheme.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'CRIAR CONTA',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts.last[0]}'.toUpperCase();
  }

  String _formatAddress(ClientEntity client) {
    final parts = <String>[];
    if (client.endereco != null) parts.add(client.endereco!);
    if (client.cidade != null) parts.add(client.cidade!);
    if (client.estado != null) parts.add(client.estado!);
    return parts.join(', ');
  }

  Widget _buildMenuItem(IconData icon, String title, String? subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.grey[600]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                if (subtitle != null)
                  Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
