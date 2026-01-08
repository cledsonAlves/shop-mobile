# 🚀 Guia Rápido - Jarinu Shop

## ⚡ Setup Rápido

### Opção 1: Script Automático (Recomendado)
\`\`\`bash
./setup.sh
\`\`\`

### Opção 2: Manual
\`\`\`bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
\`\`\`

## 📝 Comandos Importantes

### Gerar código (após modificar models/providers)
\`\`\`bash
flutter pub run build_runner build --delete-conflicting-outputs
\`\`\`

### Desenvolvimento com auto-rebuild
\`\`\`bash
flutter pub run build_runner watch --delete-conflicting-outputs
\`\`\`

### Limpar e recompilar tudo
\`\`\`bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
\`\`\`

## 🏗️ Estrutura de Features

Ao adicionar uma nova feature, siga esta estrutura:

\`\`\`
lib/features/nova_feature/
├── data/
│   ├── models/              # DTOs com @freezed
│   ├── datasources/         # APIs, Local Storage
│   └── repositories/        # Implementações
│
├── domain/
│   ├── entities/            # Entidades de negócio
│   ├── repositories/        # Interfaces
│   └── usecases/           # Casos de uso
│
└── presentation/
    ├── providers/          # Riverpod providers
    ├── screens/            # Telas
    └── widgets/            # Componentes
\`\`\`

## 🎨 Criando um Model com Freezed

\`\`\`dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    String? email,
    @Default(false) bool isActive,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
\`\`\`

Depois execute: `flutter pub run build_runner build --delete-conflicting-outputs`

## 🔌 Criando um Provider com Riverpod

\`\`\`dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider simples
final counterProvider = StateProvider<int>((ref) => 0);

// Provider assíncrono
final userProvider = FutureProvider<User>((ref) async {
  final repository = ref.watch(userRepositoryProvider);
  return await repository.getCurrentUser();
});

// Provider com estado
final cartNotifierProvider = 
    StateNotifierProvider<CartNotifier, List<Item>>((ref) {
  return CartNotifier();
});
\`\`\`

## 🚦 Adicionando Rotas (Go Router)

Edite `lib/core/router/app_router.dart`:

\`\`\`dart
GoRoute(
  path: '/nova-tela/:id',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return NovaTela(id: id);
  },
),
\`\`\`

Navegue usando:
\`\`\`dart
context.go('/nova-tela/123');
context.push('/nova-tela/123');
\`\`\`

## 🔧 Configurando Nova API

1. Adicione endpoints em `lib/features/shop/data/datasources/shop_api.dart`:
\`\`\`dart
@GET('/novo-endpoint')
Future<List<NovoModel>> getNovos();
\`\`\`

2. Execute code generation:
\`\`\`bash
flutter pub run build_runner build --delete-conflicting-outputs
\`\`\`

## 📊 Injeção de Dependências

Adicione em `lib/core/di/injection_container.dart`:

\`\`\`dart
// Data Source
getIt.registerLazySingleton<NovoDataSource>(
  () => NovoDataSourceImpl(getIt<ShopApi>()),
);

// Repository
getIt.registerLazySingleton<NovoRepository>(
  () => NovoRepositoryImpl(getIt<NovoDataSource>()),
);
\`\`\`

## 🎯 Consumindo Provider na UI

\`\`\`dart
class MinhaScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    
    return productsAsync.when(
      data: (products) => ListView.builder(...),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Erro: \$error'),
    );
  }
}
\`\`\`

## 🐛 Troubleshooting

### Erro: "Missing required dependencies"
\`\`\`bash
flutter pub get
\`\`\`

### Erro: "Part file doesn't exist"
\`\`\`bash
flutter pub run build_runner build --delete-conflicting-outputs
\`\`\`

### Erro: "Conflicting outputs"
\`\`\`bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
\`\`\`

### Cache problems
\`\`\`bash
flutter clean
flutter pub cache repair
flutter pub get
\`\`\`

## 📚 Recursos

- [Riverpod Docs](https://riverpod.dev/)
- [Freezed Docs](https://pub.dev/packages/freezed)
- [Go Router Docs](https://pub.dev/packages/go_router)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

---

💡 **Dica**: Mantenha o `build_runner watch` rodando durante o desenvolvimento para auto-gerar código!
