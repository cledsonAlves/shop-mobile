# 🛍️ Jarinu Shop - Arquitetura Modernizada

Projeto Flutter modernizado com **Clean Architecture**, **Riverpod**, **Freezed**, **Go Router** e integração com **API REST**.

## 🚀 Tecnologias Implementadas

### ✅ State Management
- **Riverpod 2.6.1** - Gerenciamento de estado type-safe e reativo
- Substituiu o Provider por solução mais robusta

### ✅ Navegação
- **Go Router 14.6.2** - Navegação declarativa com deep linking
- Rotas tipadas e navegação em stack

### ✅ Arquitetura
- **Clean Architecture** implementada com 3 camadas:
  - **Domain Layer**: Entities, Repository Interfaces, Use Cases
  - **Data Layer**: Models (DTOs), Data Sources, Repository Implementations
  - **Presentation Layer**: Screens, Widgets, Providers

### ✅ Network & API
- **Dio 5.7.0** - Cliente HTTP robusto
- **Retrofit 4.5.0** - Type-safe REST client
- **Pretty Dio Logger** - Log de requisições para debug

### ✅ Code Generation
- **Freezed 2.5.7** - Models imutáveis e type-safe
- **JSON Serializable 6.8.0** - Serialização automática
- **Riverpod Generator 2.6.2** - Geração de providers

### ✅ Dependency Injection
- **Get It 8.0.2** + **Injectable 2.5.0** - Injeção de dependências

### ✅ Error Handling
- **Dartz 0.10.1** - Either para tratamento funcional de erros

## 📁 Estrutura do Projeto

```
lib/
├── core/
│   ├── constants/          # Constantes da aplicação
│   ├── error/              # Failures e Exceptions
│   ├── network/            # Dio Client configurado
│   ├── di/                 # Dependency Injection setup
│   └── router/             # Configuração do Go Router
│
├── features/
│   └── shop/
│       ├── data/
│       │   ├── models/           # DTOs com Freezed + JSON
│       │   ├── datasources/      # Remote Data Sources + API
│       │   └── repositories/     # Implementações dos repositórios
│       │
│       ├── domain/
│       │   ├── entities/         # Entidades de negócio (Freezed)
│       │   ├── repositories/     # Interfaces dos repositórios
│       │   └── usecases/         # Casos de uso
│       │
│       └── presentation/
│           ├── providers/        # Riverpod Providers
│           ├── screens/          # Telas da aplicação
│           └── widgets/          # Widgets reutilizáveis
│
└── theme/                  # Tema da aplicação
```

## 🔧 Setup e Execução

### 1. Instalar dependências
\`\`\`bash
flutter pub get
\`\`\`

### 2. Gerar código (Freezed, JSON, Retrofit, Riverpod)
\`\`\`bash
flutter pub run build_runner build --delete-conflicting-outputs
\`\`\`

### 3. Executar o app
\`\`\`bash
flutter run
\`\`\`

### 4. Para desenvolvimento com watch (auto rebuild)
\`\`\`bash
flutter pub run build_runner watch --delete-conflicting-outputs
\`\`\`

## 🌐 Configuração da API

Edite o arquivo `lib/core/constants/api_constants.dart` para configurar a URL base da API:

\`\`\`dart
class ApiConstants {
  static const String baseUrl = 'https://api.jarinushop.com/v1';
  // ...
}
\`\`\`

## 📱 Funcionalidades

- ✅ Lista de produtos e lojas
- ✅ Categorias
- ✅ Detalhes do produto
- ✅ Carrinho de compras (Riverpod State)
- ✅ Histórico de pedidos
- ✅ Perfil do usuário
- ✅ Navegação com bottom bar
- ✅ Integração preparada para API REST

## 🔍 Padrões Implementados

### Repository Pattern
Separação entre interface (domain) e implementação (data).

### Dependency Injection
Todas as dependências são injetadas via Get It e resolvidas automaticamente.

### Error Handling com Either
\`\`\`dart
Future<Either<Failure, List<Product>>> getProducts();
\`\`\`

### Freezed Models
Models imutáveis com copyWith, equality, toString automático:
\`\`\`dart
@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String id,
    required String name,
    // ...
  }) = _ProductEntity;
}
\`\`\`

### Riverpod Providers
\`\`\`dart
final productsProvider = FutureProvider<List<ProductEntity>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final result = await repository.getProducts();
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (products) => products,
  );
});
\`\`\`

## 🧪 Testes

Para adicionar testes:
\`\`\`bash
flutter test
\`\`\`

## 📝 Próximos Passos Recomendados

1. **Implementar Use Cases** na camada domain
2. **Adicionar testes unitários** para repositories e providers
3. **Implementar cache local** com Hive ou Isar
4. **Adicionar autenticação** com tokens JWT
5. **Implementar refresh token** automático
6. **Adicionar analytics** (Firebase Analytics)
7. **Implementar notificações push**
8. **Adicionar tratamento offline-first**

## 🎯 Benefícios da Nova Arquitetura

- ✅ **Testabilidade**: Cada camada pode ser testada independentemente
- ✅ **Manutenibilidade**: Código organizado e fácil de manter
- ✅ **Escalabilidade**: Fácil adicionar novas features
- ✅ **Type Safety**: Menos erros em runtime com Freezed e Riverpod
- ✅ **Reatividade**: UI atualiza automaticamente com Riverpod
- ✅ **Performance**: Build otimizado com code generation

## 📚 Documentação

- [Riverpod](https://riverpod.dev/)
- [Freezed](https://pub.dev/packages/freezed)
- [Go Router](https://pub.dev/packages/go_router)
- [Dio](https://pub.dev/packages/dio)
- [Get It](https://pub.dev/packages/get_it)

---

**Versão**: 2.0.0  
**Data**: Janeiro 2026  
**Migrado para Clean Architecture com Riverpod**
