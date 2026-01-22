# Sprint 3: Fluxo de Pedidos e Histórico

**Objetivo:** Implementar a funcionalidade de criação de pedidos, rastreamento de status e visualização do histórico de pedidos, substituindo os mocks restantes.

---

## Tarefas

### 1. Endpoint de Criação de Pedido
- **Descrição:** Implementar a chamada para criar um novo pedido no backend.
- **API Endpoint:** `POST /pedidos/`
- **Tarefa Técnica:**
  - Criar o modelo de dados `PedidoModel` com os campos necessários (`cliente_id`, `lojista_id`, `itens`, etc.).
  - Adicionar o método `createOrder` na `ShopRemoteDataSource`.
  - Criar o caso de uso `CreateOrder`.
  - O `cliente_id` deve ser obtido do usuário logado.
  - Os `itens` devem ser montados a partir do carrinho de compras do usuário.

### 2. Endpoint de Histórico de Pedidos
- **Descrição:** Buscar a lista de pedidos realizados pelo cliente logado.
- **API Endpoint:** `GET /pedidos/cliente/{id}/pedidos`
- **Tarefa Técnica:**
  - Adicionar o método `getOrderHistory` na `ShopRemoteDataSource`.
  - Criar o caso de uso `GetOrderHistory`.
  - Integrar a `OrderHistoryScreen` para exibir a lista de pedidos retornada pela API.

### 3. Endpoint de Detalhes/Status do Pedido
- **Descrição:** Buscar os detalhes e o status atual de um pedido específico.
- **API Endpoint:** `GET /pedidos/{id}`
- **Tarefa Técnica:**
  - Adicionar o método `getOrderDetails` na `ShopRemoteDataSource`.
  - Criar o caso de uso `GetOrderDetails`.
  - Modificar a `OrderTrackingScreen` para buscar e exibir o status do pedido em tempo real (ou com atualizações periódicas).
  - Mapear os status da API (`pendente`, `confirmado`, `em_entrega`, etc.) para os status visuais no app.

### 4. Integração com a UI
- **Descrição:** Conectar o fluxo de "Finalizar Compra" e as telas de histórico/rastreamento com os novos casos de uso.
- **Arquivos:**
  - `lib/screens/cart_screen.dart` (ou similar)
  - `lib/screens/order_history_screen.dart`
  - `lib/screens/order_tracking_screen.dart`
- **Tarefa Técnica:**
  - No fluxo de checkout, chamar o `CreateOrder` com os dados do carrinho.
  - Após a criação do pedido, redirecionar o usuário para a tela de rastreamento (`OrderTrackingScreen`).
  - A `OrderHistoryScreen` deve listar os pedidos e, ao clicar em um, levar para a `OrderTrackingScreen`.

### 5. Limpeza Final
- **Descrição:** Remover completamente os dados mocados de pedidos do projeto.
- **Arquivo:** `lib/core/mocks/mock_data.dart`
- **Tarefa Técnica:**
  - Remover a lista `MockData.orders`.
  - Remover a classe `MockOrderData`.
  - O arquivo `mock_data.dart` pode ser totalmente removido se não houver mais nenhum mock sendo usado.

---

## Critérios de Aceitação
- O usuário consegue finalizar uma compra, e um pedido é criado no backend.
- A tela de histórico de pedidos exibe a lista de pedidos do usuário logado, buscando da API.
- A tela de rastreamento de pedido exibe o status correto do pedido, buscando da API.
- Os mocks de pedidos (`MockData.orders` e `MockOrderData`) são completamente removidos do código.
- O fluxo de compra, desde a seleção do produto até a confirmação do pedido, está funcionando com dados reais.
