import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:djina_debug/src/auth/presentation/controllers/auth_controller.dart';
import 'package:djina_debug/src/auth/presentation/pages/signup_page.dart';
import 'package:djina_debug/src/auth/presentation/providers/auth_provider.dart';
import 'package:djina_debug/src/auth/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const _LoginPageContent(),
    );
  }
}

class _LoginPageContent extends StatelessWidget {
  const _LoginPageContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          backgroundColor: AppTheme.primaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Header avec image et logo
                const AuthHeader(),
                SafeArea(
                  top: false,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.only(),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.secondaryColor,
                          blurRadius: 8,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),

                        // Titre
                        const Text(
                          'SE CONNECTER',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 22),

                        // Message d'erreur
                        ErrorMessage(
                          message: authProvider.errorMessage,
                          onDismiss: () => AuthController.clearError(context),
                        ),

                        // Champ téléphone
                        CustomTextField(
                          controller: authProvider.phoneController,
                          label: 'Numéro / Nom',
                          hintText: '00 000 00 00',
                          keyboardType: TextInputType.phone,
                          prefixText: '+221  |',
                        ),

                        const SizedBox(height: 18),

                        // Champ mot de passe
                        CustomTextField(
                          controller: authProvider.passwordController,
                          label: 'Mot de passe',
                          hintText: '********',
                          obscureText: authProvider.obscurePassword,
                          suffixIcon: Icon(
                            authProvider.obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onSuffixIconPressed: () =>
                              AuthController.togglePasswordVisibility(context),
                        ),

                        const SizedBox(height: 22),

                        // Bouton de connexion
                        AuthButton(
                          text: 'Connecter',
                          isLoading: authProvider.isLoginLoading,
                          onPressed: authProvider.isLoginFormValid
                              ? () => AuthController.login(context)
                              : null,
                        ),

                        const SizedBox(height: 12),

                        // Lien "Créer un compte"
                        GestureDetector(
                          onTap: () => _navigateToSignup(context),
                          child: const Text(
                            'Créer un compte',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _navigateToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }
}
