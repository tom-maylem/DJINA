import 'package:flutter/material.dart';
import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:djina_debug/core/utils/constants.dart';

///le contenu principal de l'onboarding
class OnboardingContent extends StatelessWidget {
  final PageController pageController;
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;
  final Function(int) onPageChanged;

  const OnboardingContent({
    super.key,
    required this.pageController,
    required this.fadeAnimation,
    required this.slideAnimation,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: OnboardingData.pages.length,
        itemBuilder: (context, index) {
          return Center(
            child: FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    OnboardingData.pages[index].title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
