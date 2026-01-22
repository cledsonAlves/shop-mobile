class ApiConstants {
  static const String baseUrl = 'https://api.jarifast.com.br';
  
  // Endpoints
  static const String lojistas = '/lojistas';
  static const String produtos = '/produtos';
  static const String categorias = '/categorias';
  static const String produtoImagens = '/produto-imagens';
  static const String pedidos = '/pedidos';
  static const String auth = '/auth';
  static const String ofertas = '/offers';
  static const String clientes = '/clientes';
  static const String cidades = '/cidades';
  static const String pagamentos = '/pagamentos';
  static const String criarPreferencia = '/pagamentos/criar-preferencia';
  
  // Pedidos - endpoints específicos
  static String pedidosCliente(String clienteId) => '/pedidos/cliente/$clienteId/pedidos';
  static String pedidoStatus(String pedidoId) => '/pedidos/$pedidoId/status';
  
  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
