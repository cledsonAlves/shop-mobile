# Sprint 2: Autenticação e Perfil do Cliente ✅ CONCLUÍDA

**Objetivo:** Implementar o fluxo de autenticação do cliente (cadastro e login) e conectar a tela de perfil com dados reais do backend.

**Data de Conclusão:** 21 de Janeiro de 2026

---

## Tarefas

### 1. Endpoints de Autenticação ✅
- **Descrição:** Implementar as chamadas para os endpoints de cadastro e login de clientes.
- **API Endpoints:**
  - `POST /clientes/` (para cadastro)
  - `POST /auth/clientes/login` (para login)
- **Implementação:**
  - ✅ Criado `AuthRemoteDataSource` com métodos `registerClient` e `loginClient`
  - ✅ Arquivo: `lib/features/auth/data/datasources/auth_remote_datasource.dart`

### 2. Gerenciamento de Token ✅
- **Descrição:** Armazenar o token JWT recebido após o login de forma segura no dispositivo.
- **Implementação:**
  - ✅ Criado `AuthManager` usando `shared_preferences` para salvar o token
  - ✅ Modificado `DioClient` com interceptor para incluir `Authorization: Bearer <token>` automaticamente
  - ✅ Arquivos:
    - `lib/features/auth/data/datasources/auth_manager.dart`
    - `lib/core/network/dio_client.dart`

### 3. Telas de Autenticação ✅
- **Descrição:** Criar as telas de Login e Cadastro.
- **Implementação:**
  - ✅ Criada `LoginScreen` com formulário de email/senha
  - ✅ Criada `RegisterScreen` com formulário completo (nome, email, senha, e campos opcionais)
  - ✅ Arquivos:
    - `lib/features/auth/presentation/screens/login_screen.dart`
    - `lib/features/auth/presentation/screens/register_screen.dart`

### 4. Endpoint de Perfil do Cliente ✅
- **Descrição:** Buscar os dados do cliente logado para exibir na tela de perfil.
- **API Endpoint:** `GET /clientes/{id}`
- **Implementação:**
  - ✅ Criado use case `GetClientProfile`
  - ✅ Modificada `ProfileScreen` para usar dados reais do cliente
  - ✅ Arquivos:
    - `lib/features/auth/domain/usecases/get_client_profile.dart`
    - `lib/features/shop/presentation/screens/profile_screen.dart`

### 5. Fluxo de Navegação ✅
- **Descrição:** Adicionar rotas de autenticação e proteção de telas.
- **Implementação:**
  - ✅ Adicionadas rotas `/login` e `/register` no `AppRouter`
  - ✅ `ProfileScreen` mostra tela de login se usuário não estiver autenticado
  - ✅ Arquivo: `lib/core/router/app_router.dart`

### 6. Limpeza ✅
- **Descrição:** Remover o `UserProfile` mocado do arquivo `lib/core/mocks/mock_data.dart`.
- **Implementação:**
  - ✅ Removido `UserProfile` e `mockUserProfileProvider`
  - ✅ Arquivos:
    - `lib/core/mocks/mock_data.dart`
    - `lib/features/shop/presentation/providers/mock_providers.dart`

---

## Arquivos Criados/Modificados

### Novos Arquivos:
- `lib/features/auth/auth.dart` - Exports do módulo
- `lib/features/auth/domain/entities/client_entity.dart` - Entidade do cliente
- `lib/features/auth/domain/repositories/auth_repository.dart` - Interface do repositório
- `lib/features/auth/domain/usecases/register_client.dart` - Use case de registro
- `lib/features/auth/domain/usecases/login_client.dart` - Use case de login
- `lib/features/auth/domain/usecases/get_client_profile.dart` - Use case de perfil
- `lib/features/auth/domain/usecases/logout_client.dart` - Use case de logout
- `lib/features/auth/data/models/client_model.dart` - Model do cliente
- `lib/features/auth/data/models/auth_response_model.dart` - Model de resposta de auth
- `lib/features/auth/data/datasources/auth_manager.dart` - Gerenciador de token
- `lib/features/auth/data/datasources/auth_remote_datasource.dart` - Data source remoto
- `lib/features/auth/data/repositories/auth_repository_impl.dart` - Implementação do repositório
- `lib/features/auth/presentation/providers/auth_provider.dart` - Provider Riverpod
- `lib/features/auth/presentation/screens/login_screen.dart` - Tela de login
- `lib/features/auth/presentation/screens/register_screen.dart` - Tela de cadastro

### Arquivos Modificados:
- `lib/core/constants/api_constants.dart` - Adicionado endpoint de clientes
- `lib/core/network/dio_client.dart` - Adicionado interceptor de token
- `lib/core/di/injection_container.dart` - Registradas dependências de auth
- `lib/core/router/app_router.dart` - Adicionadas rotas de login/register
- `lib/core/mocks/mock_data.dart` - Removido UserProfile mock
- `lib/core/error/failures.dart` - Adicionada AuthFailure
- `lib/features/shop/presentation/screens/profile_screen.dart` - Integração com auth
- `lib/features/shop/presentation/providers/mock_providers.dart` - Removido mockUserProfileProvider

---

## Critérios de Aceitação ✅
- ✅ Um novo usuário consegue se cadastrar no aplicativo através do endpoint `POST /clientes/`.
- ✅ Um usuário cadastrado consegue fazer login.
- ✅ O token de autenticação é salvo no dispositivo após o login.
- ✅ A tela de perfil exibe os dados do usuário logado, buscando da API.
- ✅ O mock `userProfile` é removido do projeto.
