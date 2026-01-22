import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/shop/presentation/screens/splash_screen.dart';
import '../../features/shop/presentation/screens/home_screen.dart';
import '../../features/shop/presentation/screens/discover_products_screen.dart';
import '../../features/shop/presentation/screens/product_detail_screen.dart';
import '../../features/shop/presentation/screens/orders_screen.dart';
import '../../features/shop/presentation/screens/profile_screen.dart';
import '../../features/shop/presentation/screens/main_navigation_screen.dart';
import '../../features/shop/presentation/screens/store_screen.dart';
import '../../features/shop/presentation/screens/delivery_code_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../screens/cart_screen.dart';
import '../../screens/order_tracking_screen.dart';

// Route names
class AppRoutes {
  static const splash = '/splash';
  static const home = '/';
  static const productDetail = '/product/:id';
  static const storeDetail = '/store/:id';
  static const orderHistory = '/orders';
  static const profile = '/profile';
  static const search = '/search';
  static const deliveryCode = '/delivery-code/:id';
  static const login = '/login';
  static const register = '/register';
  static const cart = '/cart';
  static const orderTracking = '/order-tracking/:id';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  routes: [
    // Splash Screen (fora do ShellRoute)
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    // Auth routes (fora do ShellRoute)
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
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
            child: const DiscoverProductsScreen(),
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
    // Carrinho
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    // Rastreamento de pedido
    GoRoute(
      path: '/order-tracking/:id',
      builder: (context, state) {
        final orderId = state.pathParameters['id']!;
        return OrderTrackingScreen(orderId: orderId);
      },
    ),
  ],
);
