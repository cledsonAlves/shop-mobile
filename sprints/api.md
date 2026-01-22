# 📖 Documentação da API - Delivery Backend (Marketplace)

# 🚀 Guia Prático de Integração Front-end

Este guia resume como integrar o front-end a todas as APIs do marketplace, cobrindo autenticação, consumo de endpoints, fluxo de pedidos, ofertas e pagamentos.

---

## 1. Autenticação (Lojistas)

**Registro:**
```http
POST /auth/lojistas/register
{
  "nome": "João Silva",
  "email": "joao@exemplo.com",
  "password": "senha123"
}
```
**Login:**
```http
POST /auth/lojistas/login
{
  "email": "joao@exemplo.com",
  "password": "senha123"
}
```
**Uso do token:**
Inclua o token JWT no header:
```
Authorization: Bearer <seu_token_jwt>
```

---

## 2. Endpoints Principais

Veja o resumo dos principais endpoints (CRUD):

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| POST   | /lojistas/           | Criar lojista |
| GET    | /lojistas/           | Listar lojistas |
| POST   | /clientes/           | Criar cliente |
| GET    | /clientes/           | Listar clientes |
| POST   | /produtos/           | Criar produto |
| GET    | /produtos/           | Listar produtos |
| POST   | /offers/             | Criar oferta |
| GET    | /offers/             | Listar ofertas |
| POST   | /pedidos/            | Criar pedido |
| GET    | /pedidos/            | Listar pedidos |
| POST   | /pagamentos/criar-preferencia | Criar preferência de pagamento |

Consulte a tabela completa de endpoints neste arquivo para detalhes de filtros e parâmetros.

---

## 3. Exemplo de Fluxo Completo (Cliente)

1. **Cadastro/Login**: Cliente se cadastra ou faz login.
2. **Listar Ofertas**: `GET /offers?category=...&page=1&limit=20` (com token)
3. **Ver Produtos**: `GET /produtos/?lojista_id=...`
4. **Adicionar ao Carrinho**: Armazene produtos e quantidades localmente.
5. **Criar Pedido**: `POST /pedidos/` com os itens do carrinho.
6. **Pagamento**: `POST /pagamentos/criar-preferencia` com o `pedido_id`.
7. **Redirecionar para Mercado Pago**: Use o `init_point` retornado.
8. **Consultar Status**: `GET /pagamentos/pedido/{pedido_id}`.

---

## 4. Exemplos de Código (React/TypeScript)

### Listar Ofertas
```typescript
import axios from 'axios';
const API_URL = 'https://api.jarifast.com.br';
const token = localStorage.getItem('auth_token');

const listarOfertas = async (params) => {
  const res = await axios.get(`${API_URL}/offers`, {
    headers: { Authorization: `Bearer ${token}` },
    params
  });
  return res.data;
};
```

### Criar Pedido
```typescript
const criarPedido = async (pedidoData) => {
  const res = await axios.post(`${API_URL}/pedidos/`, pedidoData, {
    headers: { Authorization: `Bearer ${token}` }
  });
  return res.data;
};
```

### Iniciar Pagamento Mercado Pago
```typescript
const criarPreferencia = async (pedidoId) => {
  const res = await axios.post(`${API_URL}/pagamentos/criar-preferencia`, { pedido_id: pedidoId }, {
    headers: { Authorization: `Bearer ${token}` }
  });
  window.location.href = res.data.init_point;
};
```

---

## 5. Dicas e Boas Práticas

- Sempre valide dados antes de enviar (ex: CPF, email, estoque)
- Use try/catch para tratamento de erros
- Implemente loading states e feedbacks visuais
- Use paginação (`page`, `limit`) e cache de dados (React Query/SWR)
- Armazene tokens e IDs no localStorage
- Consulte status do pedido após pagamento

---

## 6. Tratamento de Erros

Exemplo de tratamento genérico:
```typescript
try {
  // chamada à API
} catch (error) {
  if (error.response?.status === 400) {
    alert('Dados inválidos ou estoque insuficiente');
  } else if (error.response?.status === 401) {
    // Redirecionar para login
  } else {
    alert('Erro inesperado. Tente novamente.');
  }
}
```

---

## 7. Fluxo de Status de Pedido

| Status      | Descrição                        |
|-------------|----------------------------------|
| pendente    | Pedido criado, aguardando ação   |
| confirmado  | Confirmado pelo lojista          |
| preparando  | Em preparo                       |
| em_entrega  | Saiu para entrega                |
| entregue    | Entregue ao cliente              |
| cancelado   | Cancelado                        |

---

## 8. Referências e Suporte

- [Swagger UI - Documentação Interativa](http://localhost:8000/docs)
- Dúvidas? Consulte este arquivo ou abra uma issue.

## 🎯 Visão Geral

API REST completa para gerenciamento de um marketplace de delivery onde múltiplos lojistas cadastram seus produtos (com categorias, imagens e variações), ofertas promocionais, e gerenciam pedidos de clientes.

**Base URL:** `http://200.98.64.133:8000` (produção) ou `http://127.0.0.1:8000` (desenvolvimento)

**Documentação Interativa (Swagger):** `http://localhost:8000/docs`

**Formato de resposta:** JSON

---

## 📊 Arquitetura de Dados

```
Lojista
├── Categorias (produtos agrupados)
│   └── Produtos
│       ├── Imagens (múltiplas fotos)
│       └── Variações (tamanhos, cores, etc.)
├── Ofertas (promoções e descontos)
└── Pedidos (vendas realizadas)
    └── Itens do Pedido

Cliente
├── Dados Pessoais (nome, email, CPF, endereço)
└── Pedidos (histórico de compras)
```

---

## 🔑 Endpoints Disponíveis

### 1. **LOJISTAS** - Gerenciar lojas

#### Criar Lojista
```http
POST /lojistas/
Content-Type: application/json

{
  "nome": "Burger Master",
  "email": "contato@burgermaster.com"
}
```

**Resposta (200):**
```json
{
  "id": "3a56d5bd-ce8b-4e43-a212-418abd2f667e",
  "nome": "Burger Master",
  "email": "contato@burgermaster.com",
  "ativo": true,
  "criado_em": "2026-01-06T06:36:40.109011-03:00",
  "atualizado_em": "2026-01-06T06:36:40.109011-03:00"
}
```

#### Listar Lojistas
```http
GET /lojistas/?skip=0&limit=10
```

**Resposta (200):** Array de lojistas

#### Obter Lojista Específica
```http
GET /lojistas/{lojista_id}
```

#### Atualizar Lojista
```http
PUT /lojistas/{lojista_id}
Content-Type: application/json

{
  "nome": "Burger Master Premium",
  "email": "novo@email.com"
}
```

#### Deletar Lojista
```http
DELETE /lojistas/{lojista_id}
```

**Resposta (200):**
```json
{
  "message": "Lojista deleted"
}
```

---

### 2. **CATEGORIAS** - Organizar produtos por tipo

#### Criar Categoria
```http
POST /categorias/
Content-Type: application/json

{
  "lojista_id": "3a56d5bd-ce8b-4e43-a212-418abd2f667e",
  "nome": "Combos",
  "descricao": "Combos e promoções",
  "ordem": 1
}
```

**Resposta (200):**
```json
{
  "id": "abc123...",
  "lojista_id": "3a56d5bd-ce8b-4e43-a212-418abd2f667e",
  "nome": "Combos",
  "descricao": "Combos e promoções",
  "ativo": true,
  "ordem": 1,
  "criado_em": "2026-01-06T06:40:00-03:00"
}
```

#### Listar Categorias (por lojista)
```http
GET /categorias/?lojista_id=3a56d5bd-ce8b-4e43-a212-418abd2f667e&skip=0&limit=20
```

#### Obter Categoria
```http
GET /categorias/{categoria_id}
```

#### Atualizar Categoria
```http
PUT /categorias/{categoria_id}
Content-Type: application/json

{
  "lojista_id": "3a56d5bd-ce8b-4e43-a212-418abd2f667e",
  "nome": "Combos Premium",
  "descricao": "Combos especiais",
  "ordem": 2
}
```

#### Deletar Categoria
```http
DELETE /categorias/{categoria_id}
```

---

### 3. **PRODUTOS** - Cadastrar e gerenciar produtos

#### Criar Produto
```http
POST /produtos/
Content-Type: application/json

{
  "lojista_id": "3a56d5bd-ce8b-4e43-a212-418abd2f667e",
  "categoria_id": "cat-abc123",
  "nome": "Combo Jarinu Master",
  "descricao": "Hambúrguer artesanal + batata + refrigerante",
  "preco": "39.90",
  "preco_promocional": "34.90",
  "custo": "15.50",
  "estoque": 20,
  "estoque_minimo": 5,
  "controla_estoque": true,
  "sku": "COMBO-001",
  "codigo_barras": "1234567890",
  "ativo": true,
  "ordem": 1
}
```

**Resposta (200):**
```json
{
  "id": "prod-xyz789",
  "lojista_id": "3a56d5bd-ce8b-4e43-a212-418abd2f667e",
  "categoria_id": "cat-abc123",
  "nome": "Combo Jarinu Master",
  "descricao": "Hambúrguer artesanal + batata + refrigerante",
  "preco": "39.90",
  "preco_promocional": "34.90",
  "custo": "15.50",
  "estoque": 20,
  "estoque_minimo": 5,
  "controla_estoque": true,
  "sku": "COMBO-001",
  "codigo_barras": "1234567890",
  "ativo": true,
  "ordem": 1,
  "criado_em": "2026-01-06T07:00:00-03:00",
  "atualizado_em": "2026-01-06T07:00:00-03:00"
}
```

#### Listar Produtos (com filtros)
```http
GET /produtos/?lojista_id=3a56d5bd-ce8b-4e43-a212-418abd2f667e&categoria_id=cat-abc123&ativo=true&skip=0&limit=50
```

#### Obter Produto
```http
GET /produtos/{produto_id}
```

#### Atualizar Produto
```http
PUT /produtos/{produto_id}
Content-Type: application/json

{
  "lojista_id": "3a56d5bd-ce8b-4e43-a212-418abd2f667e",
  "categoria_id": "cat-abc123",
  "nome": "Combo Jarinu Master v2",
  "descricao": "Hambúrguer artesanal + batata + refrigerante + molho",
  "preco": "42.90",
  "preco_promocional": "37.90",
  "custo": "16.00",
  "estoque": 25,
  "estoque_minimo": 5,
  "controla_estoque": true,
  "sku": "COMBO-001",
  "codigo_barras": "1234567890",
  "ativo": true,
  "ordem": 1
}
```

#### Deletar Produto
```http
DELETE /produtos/{produto_id}
```

---

### 4. **IMAGENS** - Galeria de fotos do produto

#### Adicionar Imagem
```http
POST /produto-imagens/
Content-Type: application/json

{
  "produto_id": "prod-xyz789",
  "url": "https://cdn.exemplo.com/produtos/combo-master-1.jpg",
  "principal": true,
  "ordem": 1
}
```

**Resposta (200):**
```json
{
  "id": "img-001",
  "produto_id": "prod-xyz789",
  "url": "https://cdn.exemplo.com/produtos/combo-master-1.jpg",
  "principal": true,
  "ordem": 1
}
```

#### Listar Imagens (por produto)
```http
GET /produto-imagens/?produto_id=prod-xyz789
```

#### Obter Imagem
```http
GET /produto-imagens/{imagem_id}
```

#### Atualizar Imagem
```http
PUT /produto-imagens/{imagem_id}
Content-Type: application/json

{
  "produto_id": "prod-xyz789",
  "url": "https://cdn.exemplo.com/produtos/combo-master-atualizado.jpg",
  "principal": true,
  "ordem": 1
}
```

#### Deletar Imagem
```http
DELETE /produto-imagens/{imagem_id}
```

---

### 5. **VARIAÇÕES** - Tamanhos, cores, sabores, etc.

#### Criar Variação
```http
POST /produto-variacoes/
Content-Type: application/json

{
  "produto_id": "prod-xyz789",
  "nome": "Pequeno",
  "preco_adicional": "-5.00",
  "estoque": 30,
  "ativo": true
}
```

**Resposta (200):**
```json
{
  "id": "var-001",
  "produto_id": "prod-xyz789",
  "nome": "Pequeno",
  "preco_adicional": "-5.00",
  "estoque": 30,
  "ativo": true
}
```

#### Listar Variações (por produto)
```http
GET /produto-variacoes/?produto_id=prod-xyz789
```

#### Obter Variação
```http
GET /produto-variacoes/{variacao_id}
```

#### Atualizar Variação
```http
PUT /produto-variacoes/{variacao_id}
Content-Type: application/json

{
  "produto_id": "prod-xyz789",
  "nome": "Pequeno",
  "preco_adicional": "-4.90",
  "estoque": 25,
  "ativo": true
}
```

#### Deletar Variação
```http
DELETE /produto-variacoes/{variacao_id}
```

---

## 💻 Exemplos de Código (JavaScript/TypeScript)

### Configuração Base

```javascript
const API_URL = 'http://200.98.64.133:8000';

// Função auxiliar para requisições
async function apiRequest(method, endpoint, data = null) {
  const options = {
    method,
    headers: {
      'Content-Type': 'application/json',
    },
  };

  if (data) {
    options.body = JSON.stringify(data);
  }

  try {
    const response = await fetch(`${API_URL}${endpoint}`, options);
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }
    return await response.json();
  } catch (error) {
    console.error('Erro na requisição:', error);
    throw error;
  }
}
```

### CRUD de Lojistas

```javascript
// CREATE - Criar lojista
async function criarLojista(nome, email) {
  const result = await apiRequest('POST', '/lojistas/', {
    nome,
    email,
  });
  console.log('Lojista criada:', result);
  return result;
}

// READ - Listar lojistas
async function listarLojistas(skip = 0, limit = 10) {
  const result = await apiRequest('GET', `/lojistas/?skip=${skip}&limit=${limit}`);
  console.log('Lojistas:', result);
  return result;
}

// READ - Obter lojista específica
async function obterLojista(lojistaId) {
  const result = await apiRequest('GET', `/lojistas/${lojistaId}`);
  console.log('Lojista:', result);
  return result;
}

// UPDATE - Atualizar lojista
async function atualizarLojista(lojistaId, nome, email) {
  const result = await apiRequest('PUT', `/lojistas/${lojistaId}`, {
    nome,
    email,
  });
  console.log('Lojista atualizada:', result);
  return result;
}

// DELETE - Deletar lojista
async function deletarLojista(lojistaId) {
  const result = await apiRequest('DELETE', `/lojistas/${lojistaId}`);
  console.log('Resposta:', result);
  return result;
}

// Exemplo de uso
(async () => {
  const lojista = await criarLojista('Pizza Gourmet', 'pizza@gourmet.com');
  const lojistaId = lojista.id;

  await listarLojistas();
  await obterLojista(lojistaId);
  await atualizarLojista(lojistaId, 'Pizza Gourmet Premium', 'contato@pizza.com');
  await deletarLojista(lojistaId);
})();
```

### CRUD de Categorias

```javascript
// CREATE - Criar categoria
async function criarCategoria(lojistaId, nome, descricao) {
  const result = await apiRequest('POST', '/categorias/', {
    lojista_id: lojistaId,
    nome,
    descricao,
    ordem: 0,
  });
  console.log('Categoria criada:', result);
  return result;
}

// READ - Listar categorias de uma lojista
async function listarCategorias(lojistaId, skip = 0, limit = 20) {
  const result = await apiRequest(
    'GET',
    `/categorias/?lojista_id=${lojistaId}&skip=${skip}&limit=${limit}`
  );
  console.log('Categorias:', result);
  return result;
}

// UPDATE - Atualizar categoria
async function atualizarCategoria(categoriaId, lojistaId, nome, descricao) {
  const result = await apiRequest('PUT', `/categorias/${categoriaId}`, {
    lojista_id: lojistaId,
    nome,
    descricao,
    ordem: 0,
  });
  console.log('Categoria atualizada:', result);
  return result;
}

// DELETE - Deletar categoria
async function deletarCategoria(categoriaId) {
  const result = await apiRequest('DELETE', `/categorias/${categoriaId}`);
  return result;
}
```

### CRUD de Produtos

```javascript
// CREATE - Criar produto
async function criarProduto(produto) {
  const result = await apiRequest('POST', '/produtos/', {
    lojista_id: produto.lojistaId,
    categoria_id: produto.categoriaId,
    nome: produto.nome,
    descricao: produto.descricao,
    preco: produto.preco,
    preco_promocional: produto.precoPromocional,
    custo: produto.custo,
    estoque: produto.estoque,
    estoque_minimo: produto.estoqueMinimo,
    controla_estoque: true,
    sku: produto.sku,
    codigo_barras: produto.codigoBarras,
    ativo: true,
    ordem: produto.ordem || 0,
  });
  return result;
}

// READ - Listar produtos com filtros
async function listarProdutos(filtros = {}) {
  const params = new URLSearchParams();
  if (filtros.lojistaId) params.append('lojista_id', filtros.lojistaId);
  if (filtros.categoriaId) params.append('categoria_id', filtros.categoriaId);
  if (filtros.ativo !== undefined) params.append('ativo', filtros.ativo);
  params.append('skip', filtros.skip || 0);
  params.append('limit', filtros.limit || 50);

  const result = await apiRequest('GET', `/produtos/?${params.toString()}`);
  return result;
}

// UPDATE - Atualizar produto
async function atualizarProduto(produtoId, produto) {
  const result = await apiRequest('PUT', `/produtos/${produtoId}`, {
    lojista_id: produto.lojistaId,
    categoria_id: produto.categoriaId,
    nome: produto.nome,
    descricao: produto.descricao,
    preco: produto.preco,
    preco_promocional: produto.precoPromocional,
    custo: produto.custo,
    estoque: produto.estoque,
    estoque_minimo: produto.estoqueMinimo,
    controla_estoque: true,
    sku: produto.sku,
    codigo_barras: produto.codigoBarras,
    ativo: produto.ativo,
    ordem: produto.ordem || 0,
  });
  return result;
}

// DELETE - Deletar produto
async function deletarProduto(produtoId) {
  return await apiRequest('DELETE', `/produtos/${produtoId}`);
}

// Exemplo de uso
(async () => {
  const novoProduto = {
    lojistaId: '3a56d5bd-ce8b-4e43-a212-418abd2f667e',
    categoriaId: 'cat-abc123',
    nome: 'Hambúrguer Clássico',
    descricao: 'Hambúrguer 150g com cheddar e bacon',
    preco: '24.90',
    precoPromocional: '19.90',
    custo: '8.50',
    estoque: 50,
    estoqueMinimo: 10,
    sku: 'HAMB-001',
    codigoBarras: '987654321',
    ordem: 2,
  };

  const produto = await criarProduto(novoProduto);
  console.log('Produto criado com ID:', produto.id);

  const produtos = await listarProdutos({
    lojistaId: '3a56d5bd-ce8b-4e43-a212-418abd2f667e',
  });
  console.log('Total de produtos:', produtos.length);

  await atualizarProduto(produto.id, {
    ...novoProduto,
    estoque: 45,
  });

  await deletarProduto(produto.id);
})();
```

### CRUD de Imagens

```javascript
// CREATE - Adicionar imagem
async function adicionarImagem(produtoId, url, principal = false) {
  const result = await apiRequest('POST', '/produto-imagens/', {
    produto_id: produtoId,
    url,
    principal,
    ordem: 0,
  });
  return result;
}

// READ - Listar imagens de um produto
async function listarImagens(produtoId) {
  const result = await apiRequest('GET', `/produto-imagens/?produto_id=${produtoId}`);
  return result;
}

// UPDATE - Atualizar imagem
async function atualizarImagem(imagemId, produtoId, url, principal) {
  const result = await apiRequest('PUT', `/produto-imagens/${imagemId}`, {
    produto_id: produtoId,
    url,
    principal,
    ordem: 0,
  });
  return result;
}

// DELETE - Deletar imagem
async function deletarImagem(imagemId) {
  return await apiRequest('DELETE', `/produto-imagens/${imagemId}`);
}
```

### CRUD de Variações

```javascript
// CREATE - Criar variação
async function criarVariacao(produtoId, nome, precoAdicional = 0) {
  const result = await apiRequest('POST', '/produto-variacoes/', {
    produto_id: produtoId,
    nome,
    preco_adicional: precoAdicional,
    estoque: 0,
    ativo: true,
  });
  return result;
}

// READ - Listar variações de um produto
async function listarVariacoes(produtoId) {
  const result = await apiRequest('GET', `/produto-variacoes/?produto_id=${produtoId}`);
  return result;
}

// UPDATE - Atualizar variação
async function atualizarVariacao(variacaoId, produtoId, nome, precoAdicional, estoque) {
  const result = await apiRequest('PUT', `/produto-variacoes/${variacaoId}`, {
    produto_id: produtoId,
    nome,
    preco_adicional: precoAdicional,
    estoque,
    ativo: true,
  });
  return result;
}

// DELETE - Deletar variação
async function deletarVariacao(variacaoId) {
  return await apiRequest('DELETE', `/produto-variacoes/${variacaoId}`);
}

// Exemplo: Adicionar variações de tamanho
(async () => {
  const produtoId = 'prod-xyz789';

  const pequeno = await criarVariacao(produtoId, 'Pequeno', -5);
  const medio = await criarVariacao(produtoId, 'Médio', 0);
  const grande = await criarVariacao(produtoId, 'Grande', 5);

  const variacoes = await listarVariacoes(produtoId);
  console.log('Variações:', variacoes);
})();
```

---

## 🔄 Fluxo Completo - Cadastrar Lojista e Produtos

```javascript
async function cadastroCompleto() {
  try {
    // 1. Criar lojista
    const lojista = await criarLojista('Burger Master', 'contato@burgermaster.com');
    const lojistaId = lojista.id;
    console.log('✓ Lojista criada:', lojistaId);

    // 2. Criar categorias
    const combos = await criarCategoria(lojistaId, 'Combos', 'Combos e promoções');
    const lanches = await criarCategoria(lojistaId, 'Lanches', 'Lanches simples');
    console.log('✓ Categorias criadas');

    // 3. Criar produto
    const produto = await criarProduto({
      lojistaId,
      categoriaId: combos.id,
      nome: 'Combo Jarinu Master',
      descricao: 'Hambúrguer + batata + refrigerante',
      preco: '39.90',
      precoPromocional: '34.90',
      custo: '15.50',
      estoque: 20,
      estoqueMinimo: 5,
      sku: 'COMBO-001',
      codigoBarras: '1234567890',
    });
    console.log('✓ Produto criado:', produto.id);

    // 4. Adicionar imagens
    await adicionarImagem(
      produto.id,
      'https://cdn.exemplo.com/combo-master-1.jpg',
      true
    );
    await adicionarImagem(
      produto.id,
      'https://cdn.exemplo.com/combo-master-2.jpg',
      false
    );
    console.log('✓ Imagens adicionadas');

    // 5. Criar variações
    await criarVariacao(produto.id, 'Pequeno', -5);
    await criarVariacao(produto.id, 'Médio', 0);
    await criarVariacao(produto.id, 'Grande', 5);
    console.log('✓ Variações criadas');

    console.log('\n✅ Cadastro completo realizado com sucesso!');
    console.log('Lojista ID:', lojistaId);
    console.log('Produto ID:', produto.id);
  } catch (error) {
    console.error('❌ Erro no cadastro:', error.message);
  }
}

// Executar
cadastroCompleto();
```

---

## ⚠️ Tratamento de Erros

```javascript
async function apiRequest(method, endpoint, data = null) {
  const options = {
    method,
    headers: {
      'Content-Type': 'application/json',
    },
  };

  if (data) {
    options.body = JSON.stringify(data);
  }

  try {
    const response = await fetch(`${API_URL}${endpoint}`, options);

    const responseData = await response.json();

    if (!response.ok) {
      console.error('Erro HTTP:', {
        status: response.status,
        statusText: response.statusText,
        data: responseData,
      });

      // Tratamento específico por status
      switch (response.status) {
        case 404:
          throw new Error(`Recurso não encontrado: ${endpoint}`);
        case 400:
          throw new Error(`Dados inválidos: ${responseData.detail || 'Verifique os campos'}`);
        case 500:
          throw new Error('Erro no servidor. Tente novamente mais tarde.');
        default:
          throw new Error(`Erro: ${response.statusText}`);
      }
    }

    return responseData;
  } catch (error) {
    console.error('Erro na requisição:', error);
    throw error;
  }
}
```

---

## 📋 Resumo dos Endpoints

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| **LOJISTAS** |
| POST | `/lojistas/` | Criar lojista |
| GET | `/lojistas/` | Listar lojistas |
| GET | `/lojistas/{id}` | Obter lojista |
| PUT | `/lojistas/{id}` | Atualizar lojista |
| DELETE | `/lojistas/{id}` | Deletar lojista |
| **CATEGORIAS** |
| POST | `/categorias/` | Criar categoria |
| GET | `/categorias/` | Listar categorias |
| GET | `/categorias/{id}` | Obter categoria |
| PUT | `/categorias/{id}` | Atualizar categoria |
| DELETE | `/categorias/{id}` | Deletar categoria |
| **PRODUTOS** |
| POST | `/produtos/` | Criar produto |
| GET | `/produtos/` | Listar produtos |
| GET | `/produtos/{id}` | Obter produto |
| PUT | `/produtos/{id}` | Atualizar produto |
| DELETE | `/produtos/{id}` | Deletar produto |
| **IMAGENS** |
| POST | `/produto-imagens/` | Adicionar imagem |
| GET | `/produto-imagens/` | Listar imagens |
| PUT | `/produto-imagens/{id}` | Atualizar imagem |
| DELETE | `/produto-imagens/{id}` | Deletar imagem |
| **VARIAÇÕES** |
| POST | `/produto-variacoes/` | Criar variação |
| GET | `/produto-variacoes/` | Listar variações |
| PUT | `/produto-variacoes/{id}` | Atualizar variação |
| DELETE | `/produto-variacoes/{id}` | Deletar variação |
| **OFERTAS** ⭐ NOVO |
| POST | `/offers/` | Criar oferta |
| GET | `/offers/` | Listar ofertas ativas (filtros: store_id, category, page, limit) |
| GET | `/offers/{id}` | Obter oferta específica |
| PUT | `/offers/{id}` | Atualizar oferta |
| PATCH | `/offers/{id}/activate` | Ativar oferta |
| PATCH | `/offers/{id}/deactivate` | Desativar oferta |
| DELETE | `/offers/{id}` | Deletar oferta |
| **CLIENTES** ⭐ NOVO |
| POST | `/clientes/` | Criar cliente |
| GET | `/clientes/` | Listar clientes (filtros: nome, email, cpf, cidade, ativo) |
| GET | `/clientes/{id}` | Obter cliente por ID |
| GET | `/clientes/email/{email}` | Buscar cliente por email |
| GET | `/clientes/cpf/{cpf}` | Buscar cliente por CPF |
| PUT | `/clientes/{id}` | Atualizar cliente |
| PATCH | `/clientes/{id}/activate` | Ativar cliente |
| PATCH | `/clientes/{id}/deactivate` | Desativar cliente |
| DELETE | `/clientes/{id}` | Deletar cliente |
| **PEDIDOS** ⭐ NOVO |
| POST | `/pedidos/` | Criar pedido completo com itens |
| GET | `/pedidos/` | Listar pedidos (filtros: cliente_id, lojista_id, status) |
| GET | `/pedidos/{id}` | Obter pedido completo com itens |
| GET | `/pedidos/cliente/{id}/pedidos` | Listar pedidos de um cliente |
| PATCH | `/pedidos/{id}/status` | Atualizar status do pedido |
| PUT | `/pedidos/{id}` | Atualizar informações do pedido |
| DELETE | `/pedidos/{id}` | Cancelar pedido (devolve estoque) |

⭐ = Novas APIs implementadas em 12/01/2026

---

## 🆕 Novidades - APIs de Ofertas, Clientes e Pedidos

### API de Ofertas (`/offers`)
- Gerenciamento completo de ofertas e promoções
- Filtros por lojista, categoria e ordenação por prioridade
- Paginação integrada
- Controle de período de validade (valid_from/valid_to)
- Ativação/desativação sem deletar

### API de Clientes (`/clientes`)
- Cadastro completo de clientes com CPF e endereço
- Busca por email e CPF
- Validação de duplicidade (email e CPF únicos)
- Filtros avançados (nome parcial, cidade, status)
- Gerenciamento de status ativo/inativo

### API de Pedidos (`/pedidos`)
- Criação de pedidos com múltiplos itens
- Validação automática de estoque
- Cálculo automático de subtotal, taxa e total
- Uso automático de preço promocional quando disponível
- Controle de status do pedido (pendente → confirmado → preparando → em_entrega → entregue)
- Cancelamento com devolução de estoque
- Histórico completo de pedidos por cliente
- Snapshot de dados (nome do produto é salvo no momento da compra)

---

## 🔄 Fluxo Completo de uma Venda

1. **Cliente se cadastra** → `POST /clientes/`
2. **Cliente navega ofertas** → `GET /offers/?category=Eletrônicos`
3. **Cliente vê produtos** → `GET /produtos/?lojista_id=xxx&categoria_id=yyy`
4. **Cliente cria pedido** → `POST /pedidos/` com lista de itens
   - Sistema valida estoque automaticamente
   - Calcula totais (subtotal + taxa_entrega - desconto)
   - Decrementa estoque dos produtos
5. **Lojista recebe** → Notificação do novo pedido (status: "pendente")
6. **Lojista confirma** → `PATCH /pedidos/{id}/status?status=confirmado`
7. **Lojista prepara** → `PATCH /pedidos/{id}/status?status=preparando`
8. **Entregador coleta** → `PATCH /pedidos/{id}/status?status=em_entrega`
9. **Cliente recebe** → `PATCH /pedidos/{id}/status?status=entregue`
10. **Cliente consulta histórico** → `GET /pedidos/cliente/{cliente_id}/pedidos`

**Cancelamento:** `DELETE /pedidos/{id}` devolve o estoque automaticamente

---

## 🎨 Dicas para Front-end

1. **Use um Cliente HTTP**: Considere usar `axios` ou `fetch` com wrapper
2. **Armazene IDs em localStorage**: Guarde `clienteId`, `lojistaId` e dados do carrinho
3. **Implemente Paginação**: Use `page` e `limit` para ofertas; `skip` e `limit` para outros
4. **Valide Dados**: Valide campos antes de enviar (ex: CPF, email, preço > 0)
5. **Tratamento de Erros**: Sempre tenha try/catch para melhor UX
6. **Loading States**: Mostre indicadores enquanto aguarda a API
7. **Cache de Dados**: Use React Query ou SWR para cachear ofertas e produtos
8. **Status de Pedidos**: Implemente tracking visual do status (pendente → entregue)
9. **Carrinho de Compras**: Valide estoque antes de finalizar pedido
10. **Ofertas em Destaque**: Use `sort=priority` para mostrar ofertas principais

### Exemplo de Integração - Criar Pedido

```javascript
// Exemplo React/TypeScript
const criarPedido = async (carrinho) => {
  const pedidoData = {
    cliente_id: localStorage.getItem('clienteId'),
    lojista_id: carrinho.lojistaId,
    endereco_entrega: clienteEndereco,
    cidade_entrega: clienteCidade,
    estado_entrega: clienteEstado,
    cep_entrega: clienteCep,
    forma_pagamento: formaPagamentoSelecionada,
    observacoes: observacoes,
    itens: carrinho.itens.map(item => ({
      produto_id: item.produtoId,
      quantidade: item.quantidade,
      observacoes: item.observacoes
    }))
  };
  
  try {
    const response = await axios.post('http://api.url/pedidos/', pedidoData);
    console.log('Pedido criado:', response.data);
    // Redirecionar para página de confirmação
  } catch (error) {
    if (error.response?.status === 400) {
      alert('Estoque insuficiente para um ou mais produtos');
    }
  }
};
```

---

## 📊 Status de Pedidos

| Status | Descrição | Próximo Status Possível |
|--------|-----------|------------------------|
| `pendente` | Pedido criado, aguardando confirmação | confirmado, cancelado |
| `confirmado` | Confirmado pelo lojista | preparando, cancelado |
| `preparando` | Em preparo | em_entrega, cancelado |
| `em_entrega` | Saiu para entrega | entregue |
| `entregue` | Entregue ao cliente | - |
| `cancelado` | Pedido cancelado | - |

---

## 📞 Contato & Suporte

Se encontrar problemas, verifique:
- URL base está correta
- Campos obrigatórios estão preenchidos
- Tipos de dados estão corretos (string, number, boolean)
- IDs referenciados existem no banco
