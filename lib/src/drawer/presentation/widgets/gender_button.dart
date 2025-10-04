import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                text,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? AppTheme.secondaryColor
                      : Colors.transparent,
                  border: Border.all(color: AppTheme.secondaryColor, width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
