import 'package:flutter/material.dart';

/// Widget checkbox interactive pour l'acceptation des conditions d'utilisation
class TermsCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;

  const TermsCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.text = 'J\'accepte les conditions générales',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          // Checkbox personnalisée
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: value ? Colors.black : Colors.black54,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(3),
              color: value ? Colors.black : Colors.transparent,
            ),
            child: value
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 8),

          // Texte des conditions
          Expanded(
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Les terms et conditions ne sont pas encore definis',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
