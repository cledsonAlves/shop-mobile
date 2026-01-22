import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/shop/domain/entities/store_entity.dart';
import '../features/shop/domain/entities/product_entity.dart';
import '../features/shop/domain/entities/category_entity.dart';
import '../core/di/injection_container.dart';
import '../features/shop/domain/usecases/get_stores.dart';
import '../features/shop/domain/usecases/get_products.dart';
import '../features/shop/domain/usecases/get_categories.dart';
import '../features/shop/domain/usecases/get_products_by_store.dart';

// States
class StoresState {
  final List<StoreEntity> stores;
  final bool isLoading;
  final String? error;

  StoresState({
    required this.stores,
    required this.isLoading,
    this.error,
  });

  factory StoresState.initial() => StoresState(
    stores: [],
    isLoading: false,
  );

  StoresState copyWith({
    List<StoreEntity>? stores,
    bool? isLoading,
    String? error,
  }) {
    return StoresState(
      stores: stores ?? this.stores,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ProductsState {
  final List<ProductEntity> products;
  final bool isLoading;
  final String? error;

  ProductsState({
    required this.products,
    required this.isLoading,
    this.error,
  });

  factory ProductsState.initial() => ProductsState(
    products: [],
    isLoading: false,
  );

  ProductsState copyWith({
    List<ProductEntity>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductsState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class CategoriesState {
  final List<CategoryEntity> categories;
  final bool isLoading;
  final String? error;

  CategoriesState({
    required this.categories,
    required this.isLoading,
    this.error,
  });

  factory CategoriesState.initial() => CategoriesState(
    categories: [],
    isLoading: false,
  );

  CategoriesState copyWith({
    List<CategoryEntity>? categories,
    bool? isLoading,
    String? error,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// NotifierProviders
class StoresNotifier extends StateNotifier<StoresState> {
  final GetStores _getStores;

  StoresNotifier(this._getStores) : super(StoresState.initial()) {
    _loadStores();
  }

  Future<void> _loadStores() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _getStores.call();
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (stores) {
        state = state.copyWith(
          isLoading: false,
          stores: stores,
        );
      },
    );
  }

  Future<void> refresh() => _loadStores();
}

class ProductsNotifier extends StateNotifier<ProductsState> {
  final GetProducts _getProducts;

  ProductsNotifier(this._getProducts) : super(ProductsState.initial()) {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _getProducts.call();
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (products) {
        state = state.copyWith(
          isLoading: false,
          products: products,
        );
      },
    );
  }

  Future<void> refresh() => _loadProducts();

  Future<void> loadProductsByStore(String storeId) async {
    state = state.copyWith(isLoading: true, error: null);
    final useCase = getIt<GetProductsByStore>();
    final result = await useCase.call(storeId);
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (products) {
        state = state.copyWith(
          isLoading: false,
          products: products,
        );
      },
    );
  }
}

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  final GetCategories _getCategories;

  CategoriesNotifier(this._getCategories) : super(CategoriesState.initial()) {
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _getCategories.call();
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (categories) {
        state = state.copyWith(
          isLoading: false,
          categories: categories,
        );
      },
    );
  }

  Future<void> refresh() => _loadCategories();
}

// Providers
final storesProvider = StateNotifierProvider<StoresNotifier, StoresState>((ref) {
  return StoresNotifier(getIt<GetStores>());
});

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  return ProductsNotifier(getIt<GetProducts>());
});

final categoriesProvider = StateNotifierProvider<CategoriesNotifier, CategoriesState>((ref) {
  return CategoriesNotifier(getIt<GetCategories>());
});
