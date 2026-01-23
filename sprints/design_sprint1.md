# Design Sprint 1: Fundações e Identidade Visual

**Objetivo:** Criar uma primeira impressão impactante, estabelecer uma base visual consistente (Design System) e refinar a tela principal para melhorar a descoberta de lojas e produtos.

---

## Histórias de Usuário e Tarefas de Design

### 1. **Épico: Estabelecer um Design System**

> **Como** um usuário, **eu quero** uma experiência visual consistente e agradável em todo o aplicativo, **para que** eu possa navegar de forma intuitiva e confiar na marca.

#### Tarefas:
-   **Revisão da `AppTheme`:**
    -   **Análise:** A `AppTheme` atual define apenas a cor primária.
    -   **Ação:** Expandir `lib/theme/app_theme.dart` para incluir:
        -   Uma paleta de cores completa (primária, secundária, sucesso, erro, background, texto, etc.).
        -   Definições de tipografia (tamanhos e pesos para títulos, subtítulos, corpo, etc.).
        -   Estilos padronizados para botões, inputs e cards.
-   **Componentização de Widgets:**
    -   **Análise:** O código usa `Text` e `Icon` diretamente com estilos inline.
    -   **Ação:** Criar widgets reutilizáveis em um novo diretório `lib/widgets/common/` (ex: `PrimaryButton`, `HeadlineText`, `BodyText`) que usem a `AppTheme` centralizada.

---

### 2. **Épico: Modernizar Cards de Apresentação**

> **Como** um usuário, **eu quero** ver cards de lojas e produtos que sejam visualmente atraentes e informativos, **para que** eu possa tomar decisões de compra rápidas.

#### Tarefas:
-   **Refatoração do `StoreCard` (`lib/widgets/store_card.dart`):**
    -   **Análise:** O card atual é funcional, mas pode ser mais "respirável" e informativo.
    -   **Ação:**
        -   Aumentar o `border-radius` para um visual mais suave.
        -   Adicionar um indicador de "Aberto"/"Fechado" com cores distintas.
        -   Exibir a taxa de entrega (`deliveryFee`) de forma clara.
        -   Usar um `Hero` widget na imagem para uma transição suave para a tela da loja.
-   **Refatoração do `ProductCard` (`lib/widgets/product_card.dart`):**
    -   **Análise:** O botão "Adicionar" é genérico e pode ser melhorado.
    -   **Ação:**
        -   Substituir o botão "Adicionar" por um ícone de "adicionar ao carrinho" (ex: `IconButton` com `Icons.add_shopping_cart_outlined`), que é mais rápido e visualmente mais limpo para uma lista.
        -   Adicionar um efeito de "ripple" ao tocar no card.
        -   Implementar um "shimmer effect" (usando o pacote `shimmer`) para o estado de carregamento dos produtos na `HomeScreen`.

---

### 3. **Épico: Otimizar a Tela Principal (`HomeScreen`)**

> **Como** um usuário, **eu quero** uma tela inicial que me ajude a descobrir novas lojas e promoções facilmente, **para que** eu me sinta engajado a explorar o app.

#### Tarefas:
-   **Layout da `HomeScreen` (`lib/features/shop/presentation/screens/home_screen.dart`):**
    -   **Análise:** A tela atual (legada) é um placeholder. A nova precisa ser estruturada.
    -   **Ação:**
        -   **Barra de Busca Proeminente:** Adicionar uma barra de busca fixa no topo.
        -   **Carrossel de Categorias:** Manter o carrossel de categorias, mas com ícones mais estilizados e um indicador de seleção claro.
        -   **Seção "Ofertas Especiais":** Criar uma seção de banners horizontais para promoções.
        -   **Listas de Lojas:** Organizar as lojas em seções com títulos claros (ex: "Lojas Populares", "Entrega Grátis", "Novidades"). Usar `ListView.builder` horizontal para os `StoreCards`.
        -   **Feed de Produtos:** Adicionar uma grade de produtos vertical (`GridView.builder`) na parte inferior da tela para descoberta contínua, com `ProductCards` e scroll infinito.

---

## Critérios de Aceitação da Sprint
-   A `AppTheme` está enriquecida com uma paleta de cores e estilos de texto.
-   Os `StoreCard` e `ProductCard` foram redesenhados e estão mais informativos e modernos.
-   A `HomeScreen` possui uma estrutura clara com busca, categorias, banners e seções de lojas/produtos.
-   O estado de carregamento na `HomeScreen` utiliza "shimmer effects" para uma melhor UX.
-   A navegação e as transições estão mais suaves, especialmente com o uso de `Hero` widgets.
