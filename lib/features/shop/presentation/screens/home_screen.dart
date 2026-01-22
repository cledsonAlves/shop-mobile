import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../providers/city_api_provider.dart';
import '../providers/mock_providers.dart';
import '../providers/order_provider.dart';
import '../widgets/product_card.dart';
import '../../data/models/city_model.dart';
import '../../domain/entities/store_entity.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Inicializa a cidade selecionada se necessário
    ref.watch(initSelectedCityProvider);
    
    final filteredProductsAsync = ref.watch(filteredProductsProvider);
    final storesAsync = ref.watch(storesProvider);
    final selectedStoreId = ref.watch(selectedStoreFilterProvider);
    final selectedCity = ref.watch(selectedCityApiProvider);
    final citiesAsync = ref.watch(citiesApiProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFCF9F8),
      body: SafeArea(
        child: ListView(
          children: [
            // Header simples
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCF9F8).withOpacity(0.95),
                border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
              ),
              child: Column(
                children: [
                  // Localização e notificações
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            citiesAsync.whenData((cities) {
                              _showCityModal(context, ref, cities, selectedCity);
                            });
                          },
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: AppTheme.primaryColor, size: 20),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Você está em',
                                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            selectedCity != null 
                                                ? '${selectedCity.nome} – ${selectedCity.estado}'
                                                : 'Selecione uma cidade',
                                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[600]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Ícone do carrinho
                      _buildCartIcon(context, ref),
                      const SizedBox(width: 8),
                      // Ícone de notificações
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
                        ),
                        child: Stack(
                          children: [
                            const Center(child: Icon(Icons.notifications_outlined, size: 24)),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Search Bar
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Icon(Icons.search, color: Colors.grey[400], size: 24),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Buscar produtos',
                              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Vitrine Local
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Produtos em Destaque',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      if (selectedCity != null)
                        Text(
                          'em ${selectedCity.nome}',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                    ],
                  ),
                  Icon(Icons.tune, color: Colors.grey[600], size: 20),
                ],
              ),
            ),
            
            // Filtro por Lojistas
            storesAsync.when(
              data: (stores) {
                if (stores.isEmpty) return const SizedBox.shrink();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Filtrar por Loja',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 44,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: stores.length + 1, // +1 para "Todos"
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            // Opção "Todos"
                            final isSelected = selectedStoreId == null;
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: ChoiceChip(
                                label: const Text('Todos'),
                                selected: isSelected,
                                onSelected: (_) {
                                  ref.read(selectedStoreFilterProvider.notifier).state = null;
                                },
                                selectedColor: AppTheme.primaryColor,
                                labelStyle: TextStyle(
                                  color: isSelected ? Colors.white : Colors.grey[700],
                                  fontWeight: FontWeight.w500,
                                ),
                                backgroundColor: Colors.white,
                                side: BorderSide(color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300),
                              ),
                            );
                          }
                          
                          final store = stores[index - 1];
                          final isSelected = selectedStoreId == store.id;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ChoiceChip(
                              avatar: isSelected ? null : CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://ui-avatars.com/api/?name=${Uri.encodeComponent(store.name)}&background=f06e42&color=fff&size=32',
                                ),
                                radius: 12,
                              ),
                              label: Text(store.name),
                              selected: isSelected,
                              onSelected: (_) {
                                ref.read(selectedStoreFilterProvider.notifier).state = store.id;
                              },
                              selectedColor: AppTheme.primaryColor,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
            
            // Grid de produtos
            filteredProductsAsync.when(
              data: (products) {
                if (products.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Icon(Icons.storefront_outlined, size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            selectedCity != null
                                ? 'Nenhum produto disponível em ${selectedCity.nome}'
                                : 'Nenhum produto disponível',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: () {
                              citiesAsync.whenData((cities) {
                                _showCityModal(context, ref, cities, selectedCity);
                              });
                            },
                            child: const Text('Alterar cidade'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(product: products[index]),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, s) => Padding(
                padding: const EdgeInsets.all(32),
                child: Text('Erro ao carregar: $e'),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
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

  Widget _buildCartIcon(BuildContext context, WidgetRef ref) {
    final cartItemCount = ref.watch(cartItemCountProvider);
    
    return GestureDetector(
      onTap: () => context.push('/cart'),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
        ),
        child: Stack(
          children: [
            const Center(child: Icon(Icons.shopping_cart_outlined, size: 24)),
            if (cartItemCount > 0)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
