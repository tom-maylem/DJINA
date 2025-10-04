import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/drawer_header.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/custom_button.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/password_field.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header avec flèche retour et titre DJINA
            const CustomDrawerHeader(),

            // Contenu principal
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre SECURITYE
                    const Text(
                      'SECURITE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 80),

                    // Label "Mot de pass actuel"
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Mot de pass actuel',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.secondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Champ mot de passe actuel
                    PasswordField(
                      controller: _currentPasswordController,
                      isVisible: _isCurrentPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isCurrentPasswordVisible =
                              !_isCurrentPasswordVisible;
                        });
                      },
                    ),

                    const SizedBox(height: 30),

                    // Label "Nouveau Mot de pass"
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Nouveau Mot de pass',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppTheme.secondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Champ nouveau mot de passe
                    PasswordField(
                      controller: _newPasswordController,
                      isVisible: _isNewPasswordVisible,
                      onToggleVisibility: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                    ),

                    const SizedBox(height: 50),

                    // Bouton Enregistrer
                    CustomButton(
                      text: 'Enregistrer',
                      isLoading: _isLoading,
                      loadingText: 'Enregistrement...',
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });

                        // Simulation d'une requête
                        await Future.delayed(const Duration(seconds: 2));

                        if (mounted) {
                          setState(() {
                            _isLoading = false;
                          });

                          // Afficher un message de succès
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Mot de passe mis à jour avec succès',
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
