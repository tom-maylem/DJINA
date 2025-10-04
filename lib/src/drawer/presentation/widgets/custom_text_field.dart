import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppTheme.secondaryColor,
              width: 3,
            ),
          ),
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppTheme.secondaryColor,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}
