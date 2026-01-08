import '../../features/shop/domain/entities/category_entity.dart';
import '../../features/shop/domain/entities/store_entity.dart';
import '../../features/shop/domain/entities/product_entity.dart';
import '../../features/shop/domain/entities/order_entity.dart';

class MockData {
  static List<CategoryEntity> get categories => const [
    CategoryEntity(id: '1', name: 'Games', icon: 'sports_esports'),
    CategoryEntity(id: '2', name: 'Construção', icon: 'construction'),
    CategoryEntity(id: '3', name: 'Eletro', icon: 'kitchen'),
    CategoryEntity(id: '4', name: 'Roupas', icon: 'apparel'),
    CategoryEntity(id: '5', name: 'Utilidades', icon: 'cooking'),
  ];

  static List<StoreEntity> get stores => const [
    StoreEntity(
      id: '1',
      name: 'Loja do Zé',
      category: 'Construção & Reparos',
      imageUrl: 'https://images.unsplash.com/photo-1534723452862-4c874018d66d?w=400',
      rating: 4.9,
      deliveryTime: '20-30 min',
      deliveryFee: 5.00,
      isOpen: true,
    ),
    StoreEntity(
      id: '2',
      name: 'Tech Jarinu',
      category: 'Eletrônicos',
      imageUrl: 'https://images.unsplash.com/photo-1531297484001-80022131f5a1?w=400',
      rating: 4.5,
      deliveryTime: '30-45 min',
      deliveryFee: 8.00,
      isOpen: true,
    ),
    StoreEntity(
      id: '3',
      name: 'Padaria do João',
      category: 'Padaria • Confeitaria • Centro',
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400',
      rating: 4.8,
      deliveryTime: '30-45 min',
      deliveryFee: 5.00,
      isOpen: true,
    ),
  ];

  static List<ProductEntity> get products => const [
    ProductEntity(
      id: '1',
      name: 'Smartphone XYZ 128GB',
      description: 'Smartphone de última geração com 128GB de armazenamento, câmera de 48MP e bateria de longa duração.',
      price: 1200.00,
      imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400',
      storeId: '2',
      storeName: 'Tech Jarinu',
      category: 'TECH JARINU',
    ),
    ProductEntity(
      id: '2',
      name: 'Tênis Runner Pro Vermelho',
      description: 'Tênis esportivo de alta performance com amortecimento premium.',
      price: 250.00,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      storeId: '1',
      storeName: 'Sport J',
      category: 'SPORT J',
    ),
    ProductEntity(
      id: '3',
      name: 'Kit Ferramentas Completo 24 Peças',
      description: 'Kit completo com chaves, alicates e ferramentas essenciais.',
      price: 89.90,
      imageUrl: 'https://images.unsplash.com/photo-1581783898377-1c85bf937427?w=400',
      storeId: '1',
      storeName: 'Casa & Construção',
      category: 'CASA & CONSTRUÇÃO',
    ),
    ProductEntity(
      id: '4',
      name: 'Tênis Casual Branco',
      description: 'Tênis casual confortável para o dia a dia.',
      price: 180.00,
      imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=400',
      storeId: '1',
      storeName: 'Sport J',
      category: 'SPORT J',
    ),
    ProductEntity(
      id: '5',
      name: 'Hambúrguer Artesanal Jarinu',
      description: 'O verdadeiro sabor de Jarinu! Pão brioche selado na manteiga de garrafa, blend artesanal de 180g de costela bovina, generosa camada de queijo cheddar inglês derretido, bacon crocante, cebola caramelizada no mel e nossa maionese verde da casa. Acompanha fritas rústicas.',
      price: 28.90,
      imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
      storeId: '3',
      storeName: 'Lanchonete da Praça',
      category: 'LANCHES',
    ),
    ProductEntity(
      id: '6',
      name: 'Pão Francês (Kg)',
      description: 'Pãozinho quentinho saindo do forno a cada hora. Crocante por fora, macio por dentro.',
      price: 14.90,
      imageUrl: 'https://images.unsplash.com/photo-1549931319-a545753c8c5d?w=400',
      storeId: '3',
      storeName: 'Padaria do João',
      category: 'PÃES',
    ),
    ProductEntity(
      id: '7',
      name: 'Donut de Chocolate',
      description: 'Cobertura generosa de chocolate belga e granulado colorido.',
      price: 8.50,
      imageUrl: 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400',
      storeId: '3',
      storeName: 'Padaria do João',
      category: 'DOCES',
    ),
    ProductEntity(
      id: '8',
      name: 'Combo Café da Manhã',
      description: '1 Cappuccino Grande + 1 Pão na Chapa com requeijão.',
      price: 22.90,
      imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400',
      storeId: '3',
      storeName: 'Padaria do João',
      category: 'COMBOS',
    ),
    ProductEntity(
      id: '9',
      name: 'Suco de Laranja 500ml',
      description: 'Natural, feito na hora sem adição de açúcar.',
      price: 12.00,
      imageUrl: 'https://images.unsplash.com/photo-1621506289937-a8e4df240d0b?w=400',
      storeId: '3',
      storeName: 'Padaria do João',
      category: 'BEBIDAS',
    ),
  ];

  static List<MockOrderData> get orders => [
    MockOrderData(
      id: '1',
      storeName: 'Hamburgueria do Zé',
      storeLogoUrl: 'https://ui-avatars.com/api/?name=HZ&background=f06e42&color=fff',
      items: '2x X-Bacon, 1x Coca-Cola 2L',
      total: 56.90,
      status: 'outForDelivery',
      date: DateTime.now(),
      securityCode: '4590',
      orderNumber: '#4821',
    ),
    MockOrderData(
      id: '2',
      storeName: 'Padaria Central',
      storeLogoUrl: 'https://ui-avatars.com/api/?name=PC&background=FF9800&color=fff',
      items: '1kg Pão Francês, 2x Leite, 1x Bolo...',
      total: 22.50,
      status: 'delivered',
      date: DateTime(2024, 10, 12),
      orderNumber: '#9921',
    ),
    MockOrderData(
      id: '3',
      storeName: 'Mercadinho da Esquina',
      storeLogoUrl: 'https://ui-avatars.com/api/?name=ME&background=4CAF50&color=fff',
      items: '5kg Arroz, 2kg Feijão, Óleo...',
      total: 89.00,
      status: 'delivered',
      date: DateTime(2024, 10, 10),
      orderNumber: '#8840',
    ),
  ];

  static UserProfile get userProfile => const UserProfile(
    name: 'Maria Silva',
    avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
    rating: 4.9,
    memberSince: 2023,
    activeOrders: 1,
    coupons: 3,
    currentDeliveryCode: '#8392',
  );
}

class MockOrderData {
  final String id;
  final String storeName;
  final String storeLogoUrl;
  final String items;
  final double total;
  final String status;
  final DateTime date;
  final String? securityCode;
  final String orderNumber;

  MockOrderData({
    required this.id,
    required this.storeName,
    required this.storeLogoUrl,
    required this.items,
    required this.total,
    required this.status,
    required this.date,
    this.securityCode,
    required this.orderNumber,
  });

  bool get isActive => status == 'outForDelivery' || status == 'preparing';
}

class UserProfile {
  final String name;
  final String avatarUrl;
  final double rating;
  final int memberSince;
  final int activeOrders;
  final int coupons;
  final String currentDeliveryCode;

  const UserProfile({
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.memberSince,
    required this.activeOrders,
    required this.coupons,
    required this.currentDeliveryCode,
  });
}
