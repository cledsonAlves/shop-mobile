import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../theme/app_theme.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();
  final _cepController = TextEditingController();
  
  bool _showOptionalFields = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _telefoneController.dispose();
    _enderecoController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _cepController.dispose();
    super.dispose();
  }

  String _formatCpf(String value) {
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.length <= 3) return digits;
    if (digits.length <= 6) return '${digits.substring(0, 3)}.${digits.substring(3)}';
    if (digits.length <= 9) return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6)}';
    return '${digits.substring(0, 3)}.${digits.substring(3, 6)}.${digits.substring(6, 9)}-${digits.substring(9, digits.length.clamp(0, 11))}';
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authProvider.notifier).register(
      nome: _nomeController.text.trim(),
      email: _emailController.text.trim(),
      cpf: _cpfController.text.trim(),
      telefone: _telefoneController.text.isNotEmpty ? _telefoneController.text.trim() : null,
      endereco: _enderecoController.text.isNotEmpty ? _enderecoController.text.trim() : null,
      cidade: _cidadeController.text.isNotEmpty ? _cidadeController.text.trim() : null,
      estado: _estadoController.text.isNotEmpty ? _estadoController.text.trim() : null,
      cep: _cepController.text.isNotEmpty ? _cepController.text.trim() : null,
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Conta criada com sucesso! Faça login com seu CPF.'),
          backgroundColor: Colors.green,
        ),
      );
      context.go('/login');
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
          ),
        );
        ref.read(authProvider.notifier).clearError();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Título
                Text(
                  'Criar Conta',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Preencha seus dados para começar',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 32),

                // Campo de nome
                _buildTextField(
                  controller: _nomeController,
                  label: 'Nome completo',
                  hint: 'Digite seu nome',
                  prefixIcon: Icons.person_outline,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    if (value.length < 3) {
                      return 'O nome deve ter pelo menos 3 caracteres';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Campo de email
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'seu@email.com',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Campo de CPF (obrigatório)
                TextFormField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
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
                    labelText: 'CPF *',
                    hintText: '000.000.000-00',
                    prefixIcon: const Icon(Icons.badge_outlined),
                    helperText: 'Será usado para fazer login',
                    helperStyle: TextStyle(color: Colors.grey[600]),
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
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

                const SizedBox(height: 24),

                // Campos opcionais
                InkWell(
                  onTap: () {
                    setState(() {
                      _showOptionalFields = !_showOptionalFields;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        _showOptionalFields
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Informações adicionais (opcional)',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                if (_showOptionalFields) ...[
                  const SizedBox(height: 16),

                  // Telefone
                  _buildTextField(
                    controller: _telefoneController,
                    label: 'Telefone',
                    hint: '(00) 00000-0000',
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 16),

                  // CEP
                  _buildTextField(
                    controller: _cepController,
                    label: 'CEP',
                    hint: '00000-000',
                    prefixIcon: Icons.location_on_outlined,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Endereço
                  _buildTextField(
                    controller: _enderecoController,
                    label: 'Endereço',
                    hint: 'Rua, número, complemento',
                    prefixIcon: Icons.home_outlined,
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 16),

                  // Cidade e Estado
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildTextField(
                          controller: _cidadeController,
                          label: 'Cidade',
                          hint: 'Sua cidade',
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          controller: _estadoController,
                          label: 'Estado',
                          hint: 'UF',
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 32),

                // Botão de cadastro
                SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: authState.isLoading ? null : _handleRegister,
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
                            'CRIAR CONTA',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 24),

                // Link para login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já tem uma conta? ',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text(
                        'Faça login',
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: validator,
    );
  }
}
