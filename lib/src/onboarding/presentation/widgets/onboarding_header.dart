import 'package:flutter/material.dart';
import 'package:djina_debug/core/theme/app_theme.dart';

/// Pour gerer l'onboarding avec le logo DJINA
class OnboardingHeader extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const OnboardingHeader({super.key, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FadeTransition(
            opacity: fadeAnimation,
            child: Text(
              "DJINA",
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
