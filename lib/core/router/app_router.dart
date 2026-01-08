import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/shop/presentation/screens/home_screen.dart';
import '../../features/shop/presentation/screens/product_detail_screen.dart';
import '../../features/shop/presentation/screens/orders_screen.dart';
import '../../features/shop/presentation/screens/profile_screen.dart';
import '../../features/shop/presentation/screens/main_navigation_screen.dart';
import '../../features/shop/presentation/screens/store_screen.dart';
import '../../features/shop/presentation/screens/delivery_code_screen.dart';

// Route names
class AppRoutes {
  static const home = '/';
  static const productDetail = '/product/:id';
  static const storeDetail = '/store/:id';
  static const orderHistory = '/orders';
  static const profile = '/profile';
  static const search = '/search';
  static const deliveryCode = '/delivery-code/:id';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainNavigationScreen(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.search,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const Center(child: Text('Pesquisa')),
          ),
        ),
        GoRoute(
          path: AppRoutes.orderHistory,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const OrdersScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.profile,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ProfileScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return ProductDetailScreen(productId: productId);
      },
    ),
    GoRoute(
      path: '/store/:id',
      builder: (context, state) {
        final storeId = state.pathParameters['id']!;
        return StoreScreen(storeId: storeId);
      },
    ),
    GoRoute(
      path: '/delivery-code/:id',
      builder: (context, state) {
        final orderId = state.pathParameters['id']!;
        return DeliveryCodeScreen(orderId: orderId);
      },
    ),
  ],
);
