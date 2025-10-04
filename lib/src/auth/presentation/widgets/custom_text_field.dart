import 'package:flutter/material.dart';
import 'package:djina_debug/core/theme/app_theme.dart';

/// Widget personnalisé pour les champs de texte d'authentification
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixText;
  final VoidCallback? onSuffixIconPressed;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixText,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label aligné à droite
        Row(
          children: [
            const Spacer(),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12, 
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        
        // Champ de texte
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppTheme.textColor.withOpacity(0.5),
            ),
            
            // Préfixe pour le numéro de téléphone
            prefixIcon: prefixText != null 
                ? Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: Text(
                      prefixText!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  )
                : null,
            prefixIconConstraints: prefixText != null 
                ? const BoxConstraints(minWidth: 0, minHeight: 0)
                : null,
            prefixIconColor: Colors.black,
            
            // Suffixe pour l'icône de visibilité du mot de passe
            suffixIcon: suffixIcon != null 
                ? IconButton(
                    onPressed: onSuffixIconPressed,
                    icon: suffixIcon!,
                  )
                : null,
            
            // Bordures
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.black87,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
