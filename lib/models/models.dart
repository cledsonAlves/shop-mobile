class Category {
  final String id;
  final String name;
  final String icon;

  Category({required this.id, required this.name, required this.icon});
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String storeId;
  final String storeName;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.storeId,
    required this.storeName,
  });
}

class Store {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double rating;
  final String deliveryTime;
  final double deliveryFee;
  final bool isOpen;

  Store({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    this.isOpen = true,
  });
}

class Order {
  final String id;
  final List<OrderItem> items;
  final double total;
  final String status;
  final DateTime date;
  final String storeName;
  final String securityCode;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.status,
    required this.date,
    required this.storeName,
    this.securityCode = "",
  });
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity});
}
