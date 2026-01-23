import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../providers/mock_providers.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_image_widget.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productByIdProvider(widget.productId));

    return Scaffold(
      backgroundColor: Colors.white,
      body: productAsync.when(
        data: (product) {
          if (product == null) {
            return const Center(child: Text('Produto não encontrado'));
          }
          
          // Busca o lojista para pegar o nome
          final storeAsync = ref.watch(storeByIdProvider(product.storeId));
          final storeName = storeAsync.when(
            data: (store) => store?.name ?? 'Loja',
            loading: () => 'Carregando...',
            error: (_, __) => 'Loja',
          );
          
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  // Header com imagem
                  SliverAppBar(
                    expandedHeight: 300,
                    pinned: true,
                    backgroundColor: Colors.white,
                    leading: GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () => context.push('/cart'),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                          ),
                          child: Stack(
                            children: [
                              const Center(child: Icon(Icons.shopping_cart_outlined, color: Colors.black)),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: Consumer(
                                  builder: (context, ref, _) {
                                    final cartItemCount = ref.watch(cartItemCountProvider);
                                    if (cartItemCount == 0) return const SizedBox.shrink();
                                    return Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: AppTheme.primaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                                      child: Text(
                                        cartItemCount > 99 ? '99+' : '$cartItemCount',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: ProductImageWidget(
                        productId: product.id,
                        fallbackUrl: product.imageUrl,
                        fit: BoxFit.cover,
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
                          // Nome e preço
                          Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'R\$ 32,00',
                                style: TextStyle(fontSize: 16, color: Colors.grey[400], decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Card da loja
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      'https://ui-avatars.com/api/?name=${Uri.encodeComponent(storeName)}&background=f06e42&color=fff',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(storeName, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Vendido e entregue por $storeName', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                                    ],
                                  ),
                                ),
                                Icon(Icons.verified, color: Colors.green.shade400, size: 24),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Tags
                          Wrap(
                            spacing: 8,
                            children: [
                              _buildTag(Icons.delivery_dining, 'Entrega via Motoboy', AppTheme.primaryColor.withOpacity(0.1), AppTheme.primaryColor),
                              _buildTag(Icons.lock_outline, 'Código de Segurança', Colors.green.shade50, Colors.green.shade700),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Descrição
                          const Text('Descrição', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Text(
                            product.description,
                            style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.6),
                          ),
                          const SizedBox(height: 8),
                          Text('Ler mais', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 24),

                          // Localização
                          const Text('Localização', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 12),
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey[200],
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    'https://maps.googleapis.com/maps/api/staticmap?center=-23.1015,-46.7285&zoom=14&size=400x200&maptype=roadmap&key=placeholder',
                                    width: double.infinity,
                                    height: 160,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      color: Colors.grey[200],
                                      child: const Center(child: Icon(Icons.map, size: 40, color: Colors.grey)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  left: 12,
                                  right: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on, color: AppTheme.primaryColor, size: 20),
                                        const SizedBox(width: 8),
                                        const Text('Centro, Jarinu - SP', style: TextStyle(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Barra inferior
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -4))],
                  ),
                  child: SafeArea(
                    top: false,
                    child: Row(
                      children: [
                        // Seletor de quantidade
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, size: 20),
                                onPressed: () {
                                  if (quantity > 1) setState(() => quantity--);
                                },
                              ),
                              SizedBox(
                                width: 32,
                                child: Center(
                                  child: Text('$quantity', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, size: 20),
                                onPressed: () => setState(() => quantity++),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Botão adicionar
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              ref.read(cartProvider.notifier).addProduct(product, quantity: quantity);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('$quantity x ${product.name} adicionado'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Adicionar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(width: 8),
                                Text(
                                  'R\$ ${(product.price * quantity).toStringAsFixed(2).replaceAll('.', ',')}',
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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

  Widget _buildTag(IconData icon, String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textColor)),
        ],
      ),
    );
  }
}
