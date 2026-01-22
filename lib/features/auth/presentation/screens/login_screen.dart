import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cpfController = TextEditingController();

  @override
  void dispose() {
    _cpfController.dispose();
    super.dispose();
  }

  String _formatCpf(String value) {
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.length <= 3) return digits;
    if (digits.length <= 6) return '${digits.substring(0, 3)}.${digits.substring(3)}';
    if (digits.length <= 9) return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6)}';
    return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6, 9)}-${digits.substring(9, digits.length.clamp(0, 11))}';
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authProvider.notifier).loginByCpf(
      _cpfController.text,
    );

    if (success && mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    // Mostra erro se houver
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.errorMessage != null && next.errorMessage!.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: Colors.red,
            action: next.errorMessage!.contains('Cadastre-se')
                ? SnackBarAction(
                    label: 'CADASTRAR',
                    textColor: Colors.white,
                    onPressed: () => context.go('/register'),
                  )
                : null,
          ),
        );
        ref.read(authProvider.notifier).clearError();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),
                
                // Logo e título
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Bem-vindo!',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Digite seu CPF para entrar',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),

                // Campo de CPF
                TextFormField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _handleLogin(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return TextEditingValue(
                        text: _formatCpf(newValue.text),
                        selection: TextSelection.collapsed(
                          offset: _formatCpf(newValue.text).length,
                        ),
                      );
                    }),
                  ],
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    hintText: '000.000.000-00',
                    prefixIcon: const Icon(Icons.badge_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu CPF';
                    }
                    final digits = value.replaceAll(RegExp(r'[^\d]'), '');
                    if (digits.length != 11) {
                      return 'CPF deve ter 11 dígitos';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 32),

                // Botão de login
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: authState.isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: authState.isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'ENTRAR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 24),

                // Info de segurança
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue[700], size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'O login é feito apenas com CPF. Não é necessário senha.',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Divisor
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'ou',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),

                const SizedBox(height: 24),

                // Botão de cadastro
                OutlinedButton(
                  onPressed: () => context.go('/register'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: AppTheme.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'CRIAR CONTA',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Continuar sem login
                Center(
                  child: TextButton(
                    onPressed: () => context.go('/'),
                    child: Text(
                      'Continuar sem login',
                      style: TextStyle(
                        color: Colors.grey[600],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
