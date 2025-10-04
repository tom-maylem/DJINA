import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String prefix;
  final String placeholder;

  const PhoneField({
    super.key,
    required this.controller,
    this.prefix = '+221',
    this.placeholder = '00 000 00 00',
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
          // Préfixe +221
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              prefix,
              style: const TextStyle(
                color: AppTheme.secondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Séparateur
          Container(width: 1, height: 30, color: AppTheme.secondaryColor),
          // Champ téléphone
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
