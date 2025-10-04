import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// Page de vérification OTP avec pin_code_fields
class OtpSignupPage extends StatefulWidget {
  const OtpSignupPage({super.key});

  @override
  State<OtpSignupPage> createState() => _OtpSignupPageState();
}

class _OtpSignupPageState extends State<OtpSignupPage> {
  final TextEditingController _otpController = TextEditingController();
  String _otpCode = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // En-tête avec flèche retour et nom de l'app
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppTheme.secondaryColor,
                      size: 20,
                    ),
                  ),
                  const Text(
                    'DJINA',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.secondaryColor,
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 20), // Pour équilibrer
                ],
              ),
            ),

            // Contenu principal
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Titre VERIFICATION
                    Text(
                      'VERIFICATION',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: AppTheme.cardColor,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Champs OTP avec pin_code_fields
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.secondaryColor,
                        ),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          borderWidth: 1,
                          activeBorderWidth: 1.5,
                          selectedBorderWidth: 1.5,
                          inactiveBorderWidth: 1,
                          activeColor: AppTheme.secondaryColor,
                          selectedColor: AppTheme.secondaryColor,
                          inactiveColor: AppTheme.secondaryColor,
                          activeFillColor: AppTheme.primaryColor,
                          selectedFillColor: AppTheme.primaryColor,
                          inactiveFillColor: AppTheme.primaryColor,
                        ),
                        enableActiveFill: true,
                        onChanged: (value) {
                          setState(() {
                            _otpCode = value;
                          });
                        },

                        onCompleted: (value) {
                          setState(() {
                            _otpCode = value;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Bouton Valider
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.secondaryColor,
                          foregroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          elevation: 0,
                        ),
                        onPressed: _validateOtp,
                        child: const Text(
                          'Valider',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Texte "Expire dans 30s"
                    const Center(
                      child: Text(
                        'Expire dans 30s',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.secondaryColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Lien "Renvoyer un autre code OTP"
                    Center(
                      child: GestureDetector(
                        onTap: _resendOtp,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.secondaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Renvoyer un autre code OTP',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppTheme.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Valider le code OTP
  void _validateOtp() {
    // Vérifier que le widget est encore monté
    if (!mounted) return;

    if (_otpCode.length == 4) {
      // Logique de validation réelle
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Code OTP validé: $_otpCode')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez saisir les 4 chiffres')),
      );
    }
  }

  // Renvoyer un nouveau code OTP
  void _resendOtp() {
    // Vérifier que le widget est encore monté avant d'utiliser le contrôleur
    if (!mounted) return;

    // Vider le champ OTP
    _otpController.clear();
    setState(() {
      _otpCode = '';
    });

    // Logique de renvoi réelle
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Nouveau code OTP envoyé')));
  }
}
