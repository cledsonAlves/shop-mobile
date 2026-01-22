import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../../domain/entities/product_entity.dart';
import '../providers/mock_providers.dart';
import '../providers/cart_provider.dart';

class DiscoverProductsScreen extends ConsumerStatefulWidget {
  const DiscoverProductsScreen({super.key});

  @override
  ConsumerState<DiscoverProductsScreen> createState() => _DiscoverProductsScreenState();
}

class _DiscoverProductsScreenState extends ConsumerState<DiscoverProductsScreen>
    with SingleTickerProviderStateMixin {
  final List<ProductEntity> _likedProducts = [];
  int _currentIndex = 0;
  Offset _dragOffset = Offset.zero;
  bool _isDragging = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details, List<ProductEntity> products) {
    setState(() {
      _dragOffset += details.delta;
      _isDragging = true;
    });
  }

  void _onDragEnd(DragEndDetails details, List<ProductEntity> products) {
    if (_dragOffset.dx.abs() > 100) {
      // Swipe detectado
      if (_dragOffset.dx > 0) {
        _onLike(products[_currentIndex]);
      } else {
        _onDislike();
      }
    } else {
      // Retornar à posição original
      setState(() {
        _dragOffset = Offset.zero;
        _isDragging = false;
      });
    }
  }

  void _onLike(ProductEntity product) {
    setState(() {
      _likedProducts.add(product);
      _moveToNext();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❤️ ${product.name} adicionado aos favoritos!'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onDislike() {
    setState(() {
      _moveToNext();
    });
  }

  void _moveToNext() {
    _animationController.forward().then((_) {
      setState(() {
        _currentIndex++;
        _dragOffset = Offset.zero;
        _isDragging = false;
      });
      _animationController.reset();
    });
  }

  void _onBuy(ProductEntity product) {
    ref.read(cartProvider.notifier).addProduct(product);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🛒 ${product.name} adicionado ao carrinho!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Ver Carrinho',
          onPressed: () => context.go('/orders'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider);
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Descobrir Produtos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${_likedProducts.length}'),
              isLabelVisible: _likedProducts.isNotEmpty,
              child: const Icon(Icons.favorite),
            ),
            onPressed: () {
              _showLikedProducts();
            },
          ),
        ],
      ),
      body: productsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erro: $error')),
        data: (products) {
          if (products.isEmpty) {
            return const Center(child: Text('Nenhum produto disponível'));
          }

          if (_currentIndex >= products.length) {
            return _buildNoMoreProducts();
          }

          return Stack(
            children: [
              // Próximo card (background)
              if (_currentIndex + 1 < products.length)
                _buildProductCard(
                  products[_currentIndex + 1],
                  isBackground: true,
                ),
              
              // Card atual
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final scale = 1.0 - (_animationController.value * 0.1);
                  final opacity = 1.0 - _animationController.value;
                  
                  return Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity,
                      child: child,
                    ),
                  );
                },
                child: Transform.translate(
                  offset: _dragOffset,
                  child: Transform.rotate(
                    angle: _dragOffset.dx / 1000,
                    child: GestureDetector(
                      onPanUpdate: (details) => _onDragUpdate(details, products),
                      onPanEnd: (details) => _onDragEnd(details, products),
                      child: _buildProductCard(products[_currentIndex]),
                    ),
                  ),
                ),
              ),
              
              // Indicadores de swipe
              if (_isDragging) _buildSwipeIndicators(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductCard(ProductEntity product, {bool isBackground = false}) {
    // Busca imagens do produto
    final imagesAsync = ref.watch(productImagesProvider(product.id));
    final imageUrl = imagesAsync.when(
      data: (images) => images.isNotEmpty ? images.first.url : product.imageUrl,
      loading: () => product.imageUrl,
      error: (_, __) => product.imageUrl,
    );
    
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Imagem do produto
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              ),
              
              // Gradiente overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
              
              if (!isBackground) ...[
                // Informações do produto
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        if (product.category != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              product.category!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        const SizedBox(height: 12),
                        Text(
                          'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Consumer(
                          builder: (context, ref, _) {
                            final storeNameAsync = ref.watch(storeNameProvider(product.storeId));
                            return Text(
                              storeNameAsync.when(
                                data: (name) => 'Vendido por $name',
                                loading: () => 'Carregando...',
                                error: (_, __) => 'Loja parceira',
                              ),
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.8),
                                fontSize: 14,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        
                        // Botões de ação
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Botão Dislike
                            _buildActionButton(
                              icon: Icons.close,
                              color: Colors.red,
                              onTap: _onDislike,
                            ),
                            
                            // Botão Ver Detalhes
                            _buildActionButton(
                              icon: Icons.info_outline,
                              color: Colors.blue,
                              size: 50,
                              iconSize: 28,
                              onTap: () => context.push('/product/${product.id}'),
                            ),
                            
                            // Botão Comprar
                            _buildActionButton(
                              icon: Icons.shopping_cart,
                              color: Colors.green,
                              size: 60,
                              iconSize: 32,
                              onTap: () => _onBuy(product),
                            ),
                            
                            // Botão Like
                            _buildActionButton(
                              icon: Icons.favorite,
                              color: Colors.pink,
                              onTap: () => _onLike(product),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    double size = 55,
    double iconSize = 26,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(icon, color: color, size: iconSize),
      ),
    );
  }

  Widget _buildSwipeIndicators() {
    final isLike = _dragOffset.dx > 0;
    final opacity = (_dragOffset.dx.abs() / 100).clamp(0.0, 1.0);
    
    return Positioned.fill(
      child: Align(
        alignment: isLike ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Opacity(
            opacity: opacity,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isLike ? Colors.pink : Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isLike ? Icons.favorite : Icons.close,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoMoreProducts() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 100,
            color: AppTheme.primaryColor,
          ),
          const SizedBox(height: 24),
          const Text(
            'Você viu todos os produtos!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${_likedProducts.length} produtos favoritados',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Ver Novamente'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }

  void _showLikedProducts() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Produtos Favoritados',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_likedProducts.length}',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _likedProducts.isEmpty
                  ? const Center(child: Text('Nenhum produto favoritado ainda'))
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: _likedProducts.length,
                      itemBuilder: (context, index) {
                        final product = _likedProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            context.push('/product/${product.id}');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(product.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.7),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'R\$ ${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
    );
  }
}
