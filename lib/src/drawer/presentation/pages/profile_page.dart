import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/drawer_header.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/custom_text_field.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/custom_button.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/gender_button.dart';
import 'package:djina_debug/src/drawer/presentation/widgets/phone_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _surnomController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isMrSelected = true; // Mr sélectionné par défaut

  @override
  void initState() {
    super.initState();
    // Pré-remplir avec des valeurs par défaut
    _nomController.text = 'Nom complet';
    _surnomController.text = 'Surnom';
    _dateController.text = '18 Juillet 1995';
    _emailController.text = 'Email@example.com';
    _phoneController.text = '00 000 00 00';
  }

  @override
  void dispose() {
    _nomController.dispose();
    _surnomController.dispose();
    _dateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const CustomDrawerHeader(),

            //principal
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre PROFILE
                    const Text(
                      'PROFILE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 30),

                    CustomTextField(
                      controller: _nomController,
                      placeholder: 'Nom complet',
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      controller: _surnomController,
                      placeholder: 'Surnom',
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: GenderButton(
                            text: 'Mr',
                            isSelected: _isMrSelected,
                            onTap: () {
                              setState(() {
                                _isMrSelected = true;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GenderButton(
                            text: 'Mm',
                            isSelected: !_isMrSelected,
                            onTap: () {
                              setState(() {
                                _isMrSelected = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Champ Date
                    CustomTextField(
                      controller: _dateController,
                      placeholder: '18 Juillet 1995',
                    ),
                    const SizedBox(height: 16),

                    // Champ Email
                    CustomTextField(
                      controller: _emailController,
                      placeholder: 'Email@example.com',
                    ),
                    const SizedBox(height: 16),

                    PhoneField(controller: _phoneController),

                    const Spacer(),

                    // Section SUPPRIMER SON COMPTE
                    const Text(
                      'SUPPRIMER SON COMPTE',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Bouton Désactiver mon compte
                    CustomButton(
                      text: 'Désactiver mon compte',
                      backgroundColor: AppTheme.cardColor,
                      onPressed: () {
                        // TODO: A Implémenter désactivation
                      },
                    ),

                    const SizedBox(height: 12),

                    CustomButton(
                      text: 'Supprimer mon compte',
                      backgroundColor: Colors.red,
                      onPressed: () {
                        // TODO: A Implémenter suppression
                      },
                    ),

                    const SizedBox(height: 20),
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
