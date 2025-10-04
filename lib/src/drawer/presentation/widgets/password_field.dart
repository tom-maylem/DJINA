import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isVisible;
  final VoidCallback onToggleVisibility;

  const PasswordField({
    super.key,
    required this.controller,
    required this.isVisible,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Icône cadenas à gauche
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.lock_outline,
              color: AppTheme.secondaryColor,
              size: 20,
            ),
          ),

          // Champ de saisie
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: !isVisible,
              style: const TextStyle(
                color: AppTheme.secondaryColor,
                fontSize: 16,
                letterSpacing: 2,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),

          // Icône œil à droite
          GestureDetector(
            onTap: onToggleVisibility,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: AppTheme.secondaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
