import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../../../../core/mocks/mock_data.dart';
import '../providers/mock_providers.dart';
import '../../domain/entities/product_entity.dart';

class StoreScreen extends ConsumerStatefulWidget {
  final String storeId;

  const StoreScreen({super.key, required this.storeId});

  @override
  ConsumerState<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends ConsumerState<StoreScreen> {
  int selectedFilter = 0;
  final filters = ['Destaques', 'Pães Frescos', 'Doces', 'Bebidas'];
  int cartItemCount = 1;
  double cartTotal = 14.90;

  @override
  Widget build(BuildContext context) {
    final storeAsync = ref.watch(storeByIdProvider(widget.storeId));
    final productsAsync = ref.watch(productsByStoreProvider(widget.storeId));

    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F8),
      body: storeAsync.when(
        data: (store) {
          if (store == null) {
            return const Center(child: Text('Loja não encontrada'));
          }
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  // Header com imagem
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    backgroundColor: Colors.white,
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
                    actions: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.favorite_border, color: Colors.black),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.share, color: Colors.black),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        store.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Info da loja
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Logo
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: Colors.grey.shade200),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    'https://ui-avatars.com/api/?name=${Uri.encodeComponent(store.name)}&background=f06e42&color=fff&size=128',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(store.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade50,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text('Aberto', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.green.shade700)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(store.category, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        const SizedBox(width: 4),
                                        Text('${store.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                        Text(' (120 avaliações)', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Info chips
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildInfoChip(Icons.schedule, store.deliveryTime, 'Entrega'),
                              _buildInfoChip(Icons.attach_money, 'R\$ ${store.deliveryFee.toStringAsFixed(2).replaceAll('.', ',')}', 'Taxa'),
                              _buildInfoChip(Icons.verified_user_outlined, 'Seguro', 'Entrega'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Busca na loja
                          Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 16),
                                Icon(Icons.search, color: Colors.grey[400]),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Buscar na loja...',
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Filtros
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: filters.length,
                              itemBuilder: (context, index) {
                                final isSelected = index == selectedFilter;
                                return GestureDetector(
                                  onTap: () => setState(() => selectedFilter = index),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: isSelected ? AppTheme.primaryColor : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300),
                                    ),
                                    child: Center(
                                      child: Text(
                                        filters[index],
                                        style: TextStyle(
                                          color: isSelected ? Colors.white : Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Seção Mais Pedidos
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                      child: Row(
                        children: [
                          const Text('Mais Pedidos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          const Text('🔥', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),

                  // Lista de produtos
                  productsAsync.when(
                    data: (products) {
                      final displayProducts = products.isNotEmpty ? products : [];
                      return displayProducts.isEmpty
                          ? const SliverToBoxAdapter(
                              child: Center(child: Text('Nenhum produto disponível')),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => _buildProductItem(displayProducts[index]),
                                childCount: displayProducts.length,
                              ),
                            );
                    },
                    loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
                    error: (e, s) => SliverToBoxAdapter(child: Center(child: Text('Erro: $e'))),
                  ),

                  // Seção Bebidas
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                      child: Row(
                        children: [
                          const Text('Bebidas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          const Text('🥤', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              ),

              // Barra flutuante do carrinho
              Positioned(
                left: 16,
                right: 16,
                bottom: 24,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text('$cartItemCount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Total R\$${cartTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text('Ver Sacola', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_forward, color: AppTheme.primaryColor, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Erro: $e')),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 24),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
        ],
      ),
    );
  }

  Widget _buildProductItem(ProductEntity product) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
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
              product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                ),
              ],
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
