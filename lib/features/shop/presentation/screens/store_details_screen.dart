import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../theme/app_theme.dart';
import '../../domain/entities/store_entity.dart';
import '../providers/mock_providers.dart';

class StoreDetailsScreen extends ConsumerWidget {
  final String storeId;

  const StoreDetailsScreen({super.key, required this.storeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeAsync = ref.watch(storeByIdProvider(storeId));

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: storeAsync.when(
        data: (store) {
          if (store == null) {
            return const Center(child: Text('Loja não encontrada'));
          }
          return _buildContent(context, store);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Erro: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(storeByIdProvider(storeId)),
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, StoreEntity store) {
    final isCurrentlyOpen = _isStoreOpen(store.horarioFuncionamento);
    
    return CustomScrollView(
      slivers: [
        // Header com imagem
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: AppTheme.primaryColor,
          leading: GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  store.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    child: const Icon(Icons.store, size: 80, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        // Conteúdo
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome e status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        store.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ),
                    _buildStatusBadge(isCurrentlyOpen),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Categoria
                Text(
                  store.category,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Rating
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber[600], size: 20),
                    const SizedBox(width: 4),
                    Text(
                      store.rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                
                const Divider(height: 32),
                
                // Descrição
                if (store.description != null && store.description!.isNotEmpty) ...[
                  _buildSectionTitle('Sobre'),
                  const SizedBox(height: 8),
                  Text(
                    store.description!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                
                // Horário de funcionamento
                _buildSectionTitle('Horário de Funcionamento'),
                const SizedBox(height: 12),
                _buildHorarioWidget(store.horarioFuncionamento, isCurrentlyOpen),
                
                const SizedBox(height: 24),
                
                // Endereço
                _buildSectionTitle('Endereço'),
                const SizedBox(height: 12),
                _buildInfoCard(
                  icon: Icons.location_on,
                  title: 'Localização',
                  content: _buildFullAddress(store),
                  onTap: store.address != null ? () => _openMaps(store) : null,
                ),
                
                const SizedBox(height: 24),
                
                // Contato
                _buildSectionTitle('Contato'),
                const SizedBox(height: 12),
                
                if (store.phone != null) ...[
                  _buildInfoCard(
                    icon: Icons.phone,
                    title: 'Telefone',
                    content: store.phone!,
                    onTap: () => _makePhoneCall(store.phone!),
                  ),
                  const SizedBox(height: 12),
                ],
                
                if (store.whatsapp != null) ...[
                  _buildInfoCard(
                    icon: Icons.message,
                    title: 'WhatsApp',
                    content: store.whatsapp!,
                    onTap: () => _openWhatsApp(store.whatsapp!),
                    iconColor: Colors.green,
                  ),
                  const SizedBox(height: 12),
                ],
                
                if (store.email != null) ...[
                  _buildInfoCard(
                    icon: Icons.email,
                    title: 'E-mail',
                    content: store.email!,
                    onTap: () => _sendEmail(store.email!),
                  ),
                  const SizedBox(height: 12),
                ],
                
                if (store.phone == null && store.whatsapp == null && store.email == null)
                  _buildInfoCard(
                    icon: Icons.info_outline,
                    title: 'Contato',
                    content: 'Informação não disponível',
                  ),
                
                const SizedBox(height: 32),
                
                // Botão ver produtos
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.push('/store/${store.id}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Ver Produtos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppTheme.textPrimary,
      ),
    );
  }

  Widget _buildStatusBadge(bool isOpen) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isOpen ? Colors.green[50] : Colors.red[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isOpen ? Colors.green : Colors.red,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isOpen ? Colors.green : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            isOpen ? 'Aberto agora' : 'Fechado',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isOpen ? Colors.green[700] : Colors.red[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorarioWidget(String? horarioFuncionamento, bool isCurrentlyOpen) {
    if (horarioFuncionamento == null || horarioFuncionamento.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.schedule, color: Colors.grey[600]),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Horário não informado',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      );
    }

    // Parse horário - formato esperado: "08:00-18:00" ou "Seg-Sex: 08:00-18:00, Sab: 08:00-12:00"
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrentlyOpen ? Colors.green[50] : Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrentlyOpen ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.schedule,
                color: isCurrentlyOpen ? Colors.green[700] : Colors.red[700],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  horarioFuncionamento,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isCurrentlyOpen ? Colors.green[800] : Colors.red[800],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            isCurrentlyOpen 
                ? 'A loja está aberta no momento' 
                : 'A loja está fechada no momento',
            style: TextStyle(
              fontSize: 12,
              color: isCurrentlyOpen ? Colors.green[600] : Colors.red[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (iconColor ?? AppTheme.primaryColor).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor ?? AppTheme.primaryColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  String _buildFullAddress(StoreEntity store) {
    final parts = <String>[];
    if (store.address != null) parts.add(store.address!);
    if (store.bairro != null) parts.add(store.bairro!);
    if (store.cep != null) parts.add('CEP: ${store.cep}');
    
    if (parts.isEmpty) return 'Endereço não informado';
    return parts.join('\n');
  }

  /// Verifica se a loja está aberta baseado no horário de funcionamento
  /// Formato esperado: "08:00-18:00" ou "HH:MM-HH:MM"
  bool _isStoreOpen(String? horarioFuncionamento) {
    if (horarioFuncionamento == null || horarioFuncionamento.isEmpty) {
      return false;
    }

    try {
      final now = DateTime.now();
      final currentTime = now.hour * 60 + now.minute; // Minutos desde meia-noite
      
      // Tenta extrair horário no formato "HH:MM-HH:MM"
      final regex = RegExp(r'(\d{1,2}):(\d{2})\s*[-–]\s*(\d{1,2}):(\d{2})');
      final match = regex.firstMatch(horarioFuncionamento);
      
      if (match != null) {
        final openHour = int.parse(match.group(1)!);
        final openMinute = int.parse(match.group(2)!);
        final closeHour = int.parse(match.group(3)!);
        final closeMinute = int.parse(match.group(4)!);
        
        final openTime = openHour * 60 + openMinute;
        final closeTime = closeHour * 60 + closeMinute;
        
        // Verifica se o horário atual está dentro do intervalo
        if (closeTime > openTime) {
          // Horário normal (ex: 08:00-18:00)
          return currentTime >= openTime && currentTime <= closeTime;
        } else {
          // Horário que cruza meia-noite (ex: 18:00-02:00)
          return currentTime >= openTime || currentTime <= closeTime;
        }
      }
      
      // Se não conseguiu parsear, retorna true (assume aberto)
      return true;
    } catch (e) {
      // Em caso de erro, retorna true
      return true;
    }
  }

  Future<void> _openMaps(StoreEntity store) async {
    final address = Uri.encodeComponent(store.address ?? store.name);
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$address');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _makePhoneCall(String phone) async {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');
    final url = Uri.parse('tel:$cleanPhone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> _openWhatsApp(String whatsapp) async {
    final cleanPhone = whatsapp.replaceAll(RegExp(r'[^\d]'), '');
    final url = Uri.parse('https://wa.me/55$cleanPhone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _sendEmail(String email) async {
    final url = Uri.parse('mailto:$email');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
