import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../features/shop/presentation/providers/order_provider.dart';
import '../features/shop/presentation/providers/payment_provider.dart';
import '../features/auth/presentation/providers/auth_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool _isCheckingOut = false;
  String _selectedPaymentMethod = 'pix';
  final _observacoesController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();
  final _cepController = TextEditingController();
  bool _enderecoExpanded = false;

  @override
  void initState() {
    super.initState();
    // Preenche com dados do cliente se disponível
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = ref.read(authProvider);
      if (authState.client != null) {
        final client = authState.client!;
        _enderecoController.text = client.endereco ?? '';
        _cidadeController.text = client.cidade ?? '';
        _estadoController.text = client.estado ?? '';
        _cepController.text = client.cep ?? '';
      }
    });
  }

  @override
  void dispose() {
    _observacoesController.dispose();
    _enderecoController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        actions: [
          if (cartItems.isNotEmpty)
            TextButton(
              onPressed: () => _showClearCartDialog(),
              child: const Text('Limpar', style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
      body: cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return _buildCartItem(item);
                    },
                  ),
                ),
                _buildCheckoutSection(cartTotal, authState),
              ],
            ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey[300]),
          const SizedBox(height: 24),
          Text(
            'Seu carrinho está vazio',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Adicione produtos para começar',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Ver Produtos'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    final product = item.product;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        children: [
          // Imagem do produto
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: product.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(product.imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey[200],
            ),
            child: product.imageUrl == null
                ? const Icon(Icons.image, color: Colors.grey)
                : null,
          ),
          const SizedBox(width: 12),
          // Detalhes do produto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Controle de quantidade
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    color: Colors.grey,
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .updateQuantity(product.id, item.quantity - 1);
                    },
                  ),
                  Text(
                    '${item.quantity}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    color: AppTheme.primaryColor,
                    onPressed: () {
                      ref
                          .read(cartProvider.notifier)
                          .updateQuantity(product.id, item.quantity + 1);
                    },
                  ),
                ],
              ),
              Text(
                'R\$ ${item.subtotal.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(double cartTotal, AuthState authState) {
    const taxaEntrega = 5.0;
    final total = cartTotal + taxaEntrega;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Endereço de entrega
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _enderecoExpanded = !_enderecoExpanded),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: AppTheme.primaryColor, size: 20),
                              const SizedBox(width: 8),
                              const Text(
                                'Endereço de entrega',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                          Icon(
                            _enderecoExpanded ? Icons.expand_less : Icons.expand_more,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    if (_enderecoExpanded) ...[
                      const SizedBox(height: 12),
                      TextField(
                        controller: _enderecoController,
                        decoration: InputDecoration(
                          labelText: 'Endereço *',
                          hintText: 'Rua, número, complemento',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: _cidadeController,
                              decoration: InputDecoration(
                                labelText: 'Cidade *',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                isDense: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _estadoController,
                              decoration: InputDecoration(
                                labelText: 'Estado *',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _cepController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'CEP *',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          isDense: true,
                        ),
                      ),
                    ] else if (_enderecoController.text.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${_enderecoController.text}, ${_cidadeController.text} - ${_estadoController.text}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ] else ...[
                      const SizedBox(height: 8),
                      Text(
                        'Toque para adicionar endereço',
                        style: TextStyle(color: Colors.red[400], fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
              
              // Resumo de valores
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Subtotal'),
                  Text('R\$ ${cartTotal.toStringAsFixed(2).replaceAll('.', ',')}'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Taxa de entrega'),
                  Text('R\$ ${taxaEntrega.toStringAsFixed(2).replaceAll('.', ',')}'),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Forma de pagamento
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forma de pagamento',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildPaymentOption('pix', 'PIX', Icons.pix),
                        const SizedBox(width: 12),
                        _buildPaymentOption('cartao', 'Cartão', Icons.credit_card),
                        const SizedBox(width: 12),
                        _buildPaymentOption('dinheiro', 'Dinheiro', Icons.money),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Botão de finalizar
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isCheckingOut
                      ? null
                      : () => _checkout(authState, taxaEntrega),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isCheckingOut
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                        'Finalizar Pedido',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String value, String label, IconData icon) {
    final isSelected = _selectedPaymentMethod == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPaymentMethod = value),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryColor.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? AppTheme.primaryColor : Colors.grey[300]!,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? AppTheme.primaryColor : Colors.grey,
                size: 20,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: isSelected ? AppTheme.primaryColor : Colors.grey[600],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showClearCartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar carrinho'),
        content: const Text('Tem certeza que deseja remover todos os itens?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              ref.read(cartProvider.notifier).clear();
              Navigator.pop(context);
            },
            child: const Text('Limpar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _checkout(AuthState authState, double taxaEntrega) async {
    if (!authState.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Faça login para finalizar o pedido'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Valida campos de endereço
    if (_enderecoController.text.isEmpty ||
        _cidadeController.text.isEmpty ||
        _estadoController.text.isEmpty ||
        _cepController.text.isEmpty) {
      setState(() => _enderecoExpanded = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha o endereço de entrega completo'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isCheckingOut = true);

    // 1. Criar o pedido
    final order = await ref.read(createOrderProvider.notifier).createOrderFromCart(
          observacoes: _observacoesController.text.isNotEmpty
              ? _observacoesController.text
              : null,
          taxaEntrega: taxaEntrega,
          formaPagamento: _selectedPaymentMethod,
          enderecoEntrega: _enderecoController.text,
          cidadeEntrega: _cidadeController.text,
          estadoEntrega: _estadoController.text,
          cepEntrega: _cepController.text,
        );

    if (order == null) {
      setState(() => _isCheckingOut = false);
      final errorState = ref.read(createOrderProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorState.errorMessage ?? 'Erro ao criar pedido'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    // 2. Criar preferência de pagamento e abrir Mercado Pago
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pedido criado! Abrindo pagamento...'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 2),
        ),
      );
    }

    final paymentSuccess = await ref.read(paymentProvider.notifier)
        .createPaymentAndOpenCheckout(order.id);

    setState(() => _isCheckingOut = false);

    if (paymentSuccess) {
      // Sucesso - o Mercado Pago foi aberto
      // Navega para a tela de aguardando pagamento
      if (mounted) {
        context.go('/');
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            context.push('/order-tracking/${order.id}');
          }
        });
      }
    } else {
      // Erro ao abrir Mercado Pago, mas o pedido foi criado
      final paymentState = ref.read(paymentProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(paymentState.errorMessage ?? 'Erro ao abrir pagamento. Acesse seus pedidos para pagar.'),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 4),
          ),
        );
        // Navega para a tela de pedidos
        context.go('/');
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            context.push('/order-tracking/${order.id}');
          }
        });
      }
    }
  }
}
