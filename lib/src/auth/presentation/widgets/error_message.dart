import 'package:flutter/material.dart';

/// Widget pour afficher les messages d'erreur dans les formulaires d'authentification
class ErrorMessage extends StatelessWidget {
  final String? message;
  final VoidCallback? onDismiss;

  const ErrorMessage({
    super.key,
    this.message,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    if (message == null || message!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red.shade200),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red.shade600,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message!,
              style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 13,
              ),
            ),
          ),
          if (onDismiss != null)
            GestureDetector(
              onTap: onDismiss,
              child: Icon(
                Icons.close,
                color: Colors.red.shade600,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }
}
