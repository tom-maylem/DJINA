import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final String? loadingText;
  final bool hasBorder;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = AppTheme.secondaryColor,
    this.textColor = AppTheme.primaryColor,
    this.isLoading = false,
    this.loadingText,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: hasBorder ? Colors.transparent : backgroundColor,
        border: hasBorder ? Border.all(color: Colors.grey[400]!) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(textColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    loadingText ?? 'Chargement...',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(
                  color: hasBorder ? AppTheme.secondaryColor : textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
