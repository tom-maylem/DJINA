import 'package:flutter/material.dart';
import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:djina_debug/core/utils/constants.dart';

/// Widget pour les indicateurs de page en bas de l'écran
class PageIndicators extends StatelessWidget {
  final int currentPage;
  final Animation<double> fadeAnimation;
  final Function(int)? onIndicatorTap;

  const PageIndicators({
    super.key,
    required this.currentPage,
    required this.fadeAnimation,
    this.onIndicatorTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            OnboardingData.pages.length,
            (index) => GestureDetector(
              onTap: onIndicatorTap != null
                  ? () => onIndicatorTap!(index)
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentPage == index ? 24 : 8,
                height: 4,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? AppTheme.primaryColor
                      : AppTheme.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
