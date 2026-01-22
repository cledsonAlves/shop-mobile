# Sprint 1: Refatoração e Endpoints de Visualização

**Objetivo:** Configurar a base da comunicação com a API e substituir os dados mocados de lojas, produtos e categorias por dados reais do backend.

---

## Tarefas

### 1. Configuração do Cliente HTTP
- **Descrição:** Adicionar o pacote `dio` (ou `http`) ao `pubspec.yaml` para realizar as chamadas de API.
- **Arquivo:** `pubspec.yaml`
- **Tarefa Técnica:** Criar uma classe `DioClient` (ou similar) em `lib/core/network/` para centralizar a configuração do `dio`, incluindo a `baseUrl` da API (`http://200.98.64.133:8000`).

### 2. Modelos de Dados (Data Transfer Objects - DTOs)
- **Descrição:** Criar os modelos de dados que correspondem às respostas da API para Lojistas, Produtos e Categorias. Eles devem incluir métodos `fromJson` para facilitar a conversão.
- **Arquivos:**
  - `lib/features/shop/data/models/store_model.dart`
  - `lib/features/shop/data/models/product_model.dart`
  - `lib/features/shop/data/models/category_model.dart`
- **API Endpoints:**
  - `GET /lojistas/`
  - `GET /produtos/`
  - `GET /categorias/`

### 3. Repositórios e Fontes de Dados (Data Sources)
- **Descrição:** Criar a abstração do repositório e a implementação da fonte de dados remota para cada entidade.
- **Arquivos:**
  - `lib/features/shop/data/datasources/shop_remote_data_source.dart`
  - `lib/features/shop/data/repositories/shop_repository_impl.dart`
  - `lib/features/shop/domain/repositories/shop_repository.dart`
- **Tarefa Técnica:**
  - A `ShopRemoteDataSource` irá usar o `DioClient` para chamar os endpoints da API.
  - A `ShopRepositoryImpl` irá consumir a `DataSource`, tratar exceções e converter os `Models` (DTOs) para `Entities` de domínio.

### 4. Casos de Uso (Use Cases)
- **Descrição:** Criar os casos de uso que serão chamados pelos `Providers` ou `BLoCs` da camada de apresentação.
- **Arquivos:**
  - `lib/features/shop/domain/usecases/get_stores.dart`
  - `lib/features/shop/domain/usecases/get_products.dart`
  - `lib/features/shop/domain/usecases/get_categories.dart`

### 5. Integração com a UI (Camada de Apresentação)
- **Descrição:** Modificar as telas e `Providers` para usar os novos casos de uso em vez dos dados mocados.
- **Arquivos:**
  - `lib/providers/shop_provider.dart`
  - `lib/screens/home_screen.dart`
  - `lib/screens/product_detail_screen.dart`
- **Tarefa Técnica:**
  - Atualizar o `ShopProvider` para chamar os casos de uso, gerenciar os estados de `loading`, `success` e `error`.
  - Remover as chamadas para `MockData.stores`, `MockData.products` e `MockData.categories`.

### 6. Limpeza
- **Descrição:** Após a integração bem-sucedida, remover as listas de `stores`, `products` e `categories` do arquivo `lib/core/mocks/mock_data.dart`.
- **Arquivo:** `lib/core/mocks/mock_data.dart`

---

## Critérios de Aceitação
- O aplicativo deve iniciar e exibir a lista de lojas e produtos buscando os dados da API.
- As categorias de produtos devem ser carregadas a partir da API.
- Os estados de carregamento (loading) devem ser visíveis para o usuário.
- O código relacionado aos mocks de lojas, produtos e categorias deve ser removido.
