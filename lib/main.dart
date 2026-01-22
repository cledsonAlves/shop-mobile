import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Setup dependency injection
  await setupDependencies();
  
  runApp(
    const ProviderScope(
      child: JarinuShopApp(),
    ),
  );
}

class JarinuShopApp extends StatelessWidget {
  const JarinuShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Regional Shop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: goRouter,
    );
  }
}
