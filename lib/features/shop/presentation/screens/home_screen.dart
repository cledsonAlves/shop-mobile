import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../../../../models/models.dart';
import '../providers/city_api_provider.dart';
import '../providers/mock_providers.dart';
import '../providers/order_provider.dart';
import '../widgets/product_card.dart';
import '../../data/models/city_model.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../../../widgets/common/headline_text.dart';
import '../../../../widgets/common/category_selector.dart';
import '../../../../widgets/common/loading_product_card.dart';
import '../../../../widgets/store_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Inicializa a cidade selecionada se necessário
    ref.watch(initSelectedCityProvider);
    
    final filteredProductsAsync = ref.watch(productsProvider);
    final storesAsync = ref.watch(storesProvider);
    final selectedStoreId = ref.watch(selectedStoreFilterProvider);
    final selectedCity = ref.watch(selectedCityApiProvider);
    final citiesAsync = ref.watch(citiesApiProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Location header at the top
            SliverToBoxAdapter(
              child: _buildLocationHeader(context, ref, citiesAsync, selectedCity),
            ),
            
            // Main content
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 16),
                
                const SizedBox(height: 24),
                
                // Categories carousel
                _buildCategoriesCarousel(context, ref),
                
                const SizedBox(height: 24),
                
                // Products section
                _buildSectionHeader('Produtos', 'Ver todos'),
                _buildProductsGrid(filteredProductsAsync, context),
                
                const SizedBox(height: 32),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildLocationHeader(BuildContext context, WidgetRef ref, AsyncValue<List<CityModel>> citiesAsync, CityModel? selectedCity) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth < 400;
    
    // Tamanhos responsivos
    final iconSize = isSmallScreen ? 18.0 : 20.0;
    final buttonSize = isSmallScreen ? 36.0 : (isMediumScreen ? 40.0 : 44.0);
    final horizontalPadding = isSmallScreen ? 16.0 : 20.0;
    final iconSpacing = isSmallScreen ? 8.0 : 12.0;
    
    return Container(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 12, horizontalPadding, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Linha superior: Saudação + Ícones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Saudação
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getGreeting(),
                    style: TextStyle(
                      fontSize: isSmallScreen ? 13 : 14,
                      color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'O que deseja hoje?',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
              
              // Ícones de carrinho e notificação
              Row(
                children: [
                  _buildCartIcon(context, ref, buttonSize: buttonSize, iconSize: iconSize),
                  SizedBox(width: iconSpacing),
                  _buildNotificationIcon(buttonSize: buttonSize, iconSize: iconSize),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Linha de localização - design minimalista
          GestureDetector(
            onTap: () {
              citiesAsync.whenData((cities) {
                _showCityModal(context, ref, cities, selectedCity);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 12 : 16,
                vertical: isSmallScreen ? 10 : 12,
              ),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.location_on_rounded,
                      color: AppTheme.primaryColor,
                      size: isSmallScreen ? 18 : 20,
                    ),
                  ),
                  SizedBox(width: isSmallScreen ? 10 : 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selecione sua cidade',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 11 : 12,
                            color: AppTheme.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          selectedCity != null 
                              ? '${selectedCity.nome}, ${selectedCity.estado}'
                              : 'Selecione sua cidade',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 14 : 15,
                            fontWeight: FontWeight.w600,
                            color: selectedCity != null 
                                ? AppTheme.textPrimary 
                                : AppTheme.primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                      size: isSmallScreen ? 16 : 18,
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
  
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Bom dia! ☀️';
    if (hour < 18) return 'Boa tarde! 🌤️';
    return 'Boa noite! 🌙';
  }
  
  Widget _buildNotificationIcon({required double buttonSize, required double iconSize}) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              Icons.notifications_outlined,
              size: iconSize,
              color: AppTheme.textPrimary,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade100, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCategoriesCarousel(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    
    return SizedBox(
      height: 80,
      child: categoriesAsync.when(
        data: (categories) {
          if (categories.isEmpty) {
            return const Center(
              child: Text('Nenhuma categoria encontrada'),
            );
          }
          
          // Adiciona "Todos" como primeira opção
          final allCategories = [
            CategoryEntity(id: '', name: 'Todos', icon: ''),
            ...categories,
          ];
          
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: allCategories.length,
            itemBuilder: (context, index) {
              final category = allCategories[index];
              final isSelected = (selectedCategoryId == null && category.id.isEmpty) ||
                  (selectedCategoryId == category.id);
              
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CategorySelector(
                  title: category.name,
                  icon: category.id.isEmpty ? Icons.apps : _getCategoryIcon(category.name),
                  isSelected: isSelected,
                  onTap: () {
                    // Seleciona categoria ou limpa seleção se clicar em "Todos"
                    if (category.id.isEmpty) {
                      ref.read(selectedCategoryProvider.notifier).state = null;
                    } else {
                      ref.read(selectedCategoryProvider.notifier).state = category.id;
                    }
                  },
                ),
              );
            },
          );
        },
        loading: () {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stack) {
          return const Center(
            child: Text('Erro ao carregar categorias'),
          );
        },
      ),
    );
  }
  
  IconData _getCategoryIcon(String categoryName) {
    final name = categoryName.toLowerCase();
    if (name.contains('restaurante') || name.contains('comida')) return Icons.restaurant;
    if (name.contains('mercado')) return Icons.local_grocery_store;
    if (name.contains('farmácia') || name.contains('farmacia')) return Icons.local_pharmacy;
    if (name.contains('padaria')) return Icons.bakery_dining;
    if (name.contains('pet')) return Icons.pets;
    if (name.contains('eletrônico') || name.contains('eletronico')) return Icons.devices_other;
    if (name.contains('vestuário') || name.contains('vestuario') || name.contains('roupa')) return Icons.checkroom;
    if (name.contains('cortina')) return Icons.blinds;
    if (name.contains('lençol') || name.contains('lencol') || name.contains('cama')) return Icons.bed;
    if (name.contains('bebida')) return Icons.local_drink;
    if (name.contains('doce')) return Icons.cake;
    return Icons.category;
  }
  
  Widget _buildSectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeadlineText(title),
          TextButton(
            onPressed: () {
              // Navigate to section
            },
            child: Text(
              actionText,
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllStoresGrid(AsyncValue<List<dynamic>> storesAsync, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: storesAsync.when(
        data: (stores) {
          if (stores.isEmpty) {
            return const Center(
              child: Text('Nenhuma loja encontrada'),
            );
          }
          
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];
              return GestureDetector(
                onTap: () => context.push('/store/${store.id}'),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Store image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Image.network(
                            store.imageUrl ?? '',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[200],
                              child: Icon(Icons.store, size: 40, color: Colors.grey[400]),
                            ),
                          ),
                        ),
                      ),
                      // Store info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                store.name ?? 'Loja',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, size: 14, color: Colors.amber[600]),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${store.rating?.toStringAsFixed(1) ?? '0.0'}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: (store.isOpen ?? false) ? Colors.green[50] : Colors.red[50],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      (store.isOpen ?? false) ? 'Aberto' : 'Fechado',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: (store.isOpen ?? false) ? Colors.green[700] : Colors.red[700],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 14,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        error: (error, stack) {
          return const Center(
            child: Text('Erro ao carregar lojas'),
          );
        },
      ),
    );
  }
  
  Widget _buildStoresHorizontalList(AsyncValue<List<dynamic>> storesAsync, BuildContext context, {bool deliveryFreeOnly = false, bool showNewStores = false}) {
    return SizedBox(
      height: 200,
      child: storesAsync.when(
        data: (stores) {
          // Filter stores based on params
          var filteredStores = stores;
          if (deliveryFreeOnly) {
            filteredStores = stores.where((store) => (store.deliveryFee ?? 0.0) == 0).toList();
          } else if (showNewStores) {
            // Simply take the last few stores as "new" - would have a real "new" field in production
            filteredStores = stores.take(3).toList(); 
          }
          
          if (filteredStores.isEmpty) {
            return const Center(
              child: Text('Nenhuma loja encontrada'),
            );
          }
          
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredStores.length,
            itemBuilder: (context, index) {
              final store = filteredStores[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: StoreCard(
                  store: store,
                  onTap: () {
                    context.push('/store/${store.id}');
                  },
                ),
              );
            },
          );
        },
        loading: () {
          // Show loading placeholders
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 80,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Container(
                                          width: 40,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        error: (error, stack) {
          return const Center(
            child: Text('Erro ao carregar lojas'),
          );
        },
      ),
    );
  }
  
  Widget _buildProductsGrid(AsyncValue<List<dynamic>> productsAsync, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: productsAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(
              child: Text('Nenhum produto encontrado'),
            );
          }
          
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
        },
        loading: () {
          // Show shimmer loading placeholders
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: 6, // Show 6 loading placeholders
            itemBuilder: (context, index) {
              return LoadingProductCard(key: ValueKey('loading-$index'));
            },
          );
        },
        error: (error, stack) {
          return const Center(
            child: Text('Erro ao carregar produtos'),
          );
        },
      ),
    );
  }
  
  void _showCityModal(BuildContext context, WidgetRef ref, List<CityModel> cities, CityModel? selectedCity) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.3,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Selecione sua cidade',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Mostraremos apenas produtos de lojas da sua região',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    final isSelected = selectedCity?.id == city.id;
                    return ListTile(
                      onTap: () {
                        ref.read(selectedCityApiProvider.notifier).state = city;
                        Navigator.pop(context);
                      },
                      leading: Icon(
                        Icons.location_city,
                        color: isSelected ? AppTheme.primaryColor : Colors.grey[400],
                      ),
                      title: Text(
                        city.nome,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? AppTheme.primaryColor : Colors.black,
                        ),
                      ),
                      subtitle: Text(city.estado),
                      trailing: isSelected
                          ? Icon(Icons.check_circle, color: AppTheme.primaryColor)
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartIcon(BuildContext context, WidgetRef ref, {double buttonSize = 40.0, double iconSize = 20.0}) {
    final cartItemCount = ref.watch(cartItemCountProvider);
    final badgeSize = 18.0;
    final badgeFontSize = 10.0;
    
    return GestureDetector(
      onTap: () => context.push('/cart'),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: iconSize,
                color: AppTheme.textPrimary,
              ),
            ),
            if (cartItemCount > 0)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade100, width: 1.5),
                  ),
                  constraints: BoxConstraints(minWidth: badgeSize, minHeight: badgeSize),
                  child: Text(
                    cartItemCount > 99 ? '99+' : '$cartItemCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: badgeFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
