# Design Sprint 2: Otimização da Jornada de Compra

**Objetivo:** Reduzir o atrito na jornada de compra, aprimorando a apresentação de produtos, o feedback ao adicionar itens ao carrinho e a clareza no acompanhamento de pedidos.

---

## Histórias de Usuário e Tarefas de Design

### 1. **Épico: Aprimorar a Tela de Detalhes do Produto**

> **Como** um usuário, **eu quero** entender todos os detalhes de um produto de forma clara e visual, **para que** eu me sinta seguro para adicioná-lo ao carrinho.

#### Tarefas:
-   **Refatoração da `ProductDetailScreen` (`lib/screens/product_detail_screen.dart`):**
    -   **Análise:** A tela usa um `SliverAppBar` básico e um `bottomSheet` que pode ser melhorado. O controle de quantidade é simples.
    -   **Ação:**
        -   **Galeria de Imagens:** Se a API suportar múltiplas imagens, transformar o `FlexibleSpaceBar` em uma galeria com paginação (indicadores de ponto).
        -   **Feedback de "Adicionar ao Carrinho":** Ao clicar no botão "Adicionar", mostrar uma animação de confirmação (ex: um "check" aparece no botão ou um snackbar customizado surge) em vez de apenas fechar a tela.
        -   **Controle de Quantidade (Stepper):** Redesenhar o controle de quantidade para ser mais robusto e visualmente alinhado ao novo Design System. Desabilitar o botão de "-" quando a quantidade for 1.
        -   **Informações da Loja:** Tornar a seção da loja (`storeName`) um link clicável que leva para a página da loja.
        -   **Animação no `BottomSheet`:** Fazer o `bottomSheet` deslizar suavemente para cima quando a tela é aberta.

---

### 2. **Épico: Melhorar a Experiência de Acompanhamento de Pedidos**

> **Como** um usuário, **eu quero** acompanhar meu pedido com informações visuais e em tempo real, **para que** eu me sinta tranquilo e informado sobre o progresso da minha entrega.

#### Tarefas:
-   **Refatoração da `OrderTrackingScreen` (`lib/screens/order_tracking_screen.dart`):**
    -   **Análise:** A tela possui um placeholder de mapa e uma timeline de status funcional, mas que pode ser mais dinâmica e visual.
    -   **Ação:**
        -   **Integração Real do Mapa:** Substituir o placeholder do mapa por uma integração real (ex: `google_maps_flutter`). Mostrar o trajeto da loja até o endereço do cliente com um marcador para o entregador (mesmo que simulado inicialmente).
        -   **Timeline de Status Animada:** Animar a `_buildStatusTimeline`. Quando o status muda, o preenchimento da linha e o crescimento do círculo devem ser animados.
        -   **Estimativa de Entrega:** Adicionar uma estimativa de tempo de entrega (ex: "Chega em 15-25 min") que se atualiza com base no status.
        -   **Ações Rápidas:** Incluir botões de ação, como "Ligar para a loja" ou "Preciso de ajuda".
-   **Refatoração da `OrderHistoryScreen` (`lib/screens/order_history_screen.dart`):**
    -   **Análise:** A tela é funcional, com abas para pedidos ativos e concluídos. Os cards são informativos.
    -   **Ação:**
        -   **Ação de "Pedir Novamente":** No card de um pedido concluído, adicionar um botão "Pedir Novamente" que adiciona os mesmos itens ao carrinho, facilitando a recompra.
        -   **Filtros e Busca:** Adicionar uma opção para filtrar o histórico por data ou buscar por nome de loja/produto.
        -   **Empty States Mais Amigáveis:** Melhorar os `_buildEmptyState` com ilustrações mais elaboradas (em vez de apenas ícones) e um botão que leve o usuário para a `HomeScreen` para fazer um novo pedido.

---

### 3. **Épico: Refinar o Perfil do Usuário**

> **Como** um usuário, **eu quero** que minha tela de perfil seja útil e organizada, **para que** eu possa gerenciar minhas informações e acessar recursos importantes facilmente.

#### Tarefas:
-   **Refatoração da `ProfileScreen` (`lib/screens/profile_screen.dart`):**
    -   **Análise:** A tela mistura informações estáticas e itens de menu. Os "Stat Cards" são uma boa ideia, mas podem ser mais integrados.
    -   **Ação:**
        -   **Tornar Stats Clicáveis:** Fazer com que o card "Pedidos Ativos" navegue diretamente para a aba de pedidos em andamento na `OrderHistoryScreen`.
        -   **Gamificação:** Adicionar elementos de gamificação, como uma barra de progresso para o próximo "nível" de cliente ou emblemas por conquistas (ex: "Fã de Pizza" por pedir 5 vezes da mesma categoria).
        -   **Modo Escuro (Dark Mode):** Adicionar um toggle em "Configurações" para alternar entre o tema claro e escuro, aproveitando a `AppTheme` aprimorada.

---

## Critérios de Aceitação da Sprint
-   A tela de detalhes do produto é mais rica, com uma galeria de imagens e feedback claro ao adicionar ao carrinho.
-   A tela de rastreamento de pedido possui um mapa funcional (mesmo que simulado) e uma timeline animada.
-   A tela de histórico de pedidos permite que o usuário repita um pedido com um clique.
-   Os "empty states" são mais convidativos e direcionam o usuário para ações.
-   A tela de perfil é mais interativa e oferece atalhos úteis.
