import 'package:flutter/material.dart';
import 'package:djina_debug/src/onboarding/presentation/navigation/onboarding_flow.dart';

//la logique métier de l'onboarding
class OnboardingController {
  // Démarre le processus d'onboarding
  static void startOnboarding(BuildContext context) {
    OnboardingFlow.goToWelcome(context);
  }

  // Passe à l'écran d'onboarding principal
  static void proceedToOnboarding(BuildContext context) {
    OnboardingFlow.goToOnboarding(context);
  }

  //Passe à la demande de permission de localisation
  static void requestLocationPermission(BuildContext context) {
    OnboardingFlow.goToLocationPermission(context);
  }

  // Termine l'onboarding et va vers l'authentification
  static void completeOnboarding(BuildContext context) {
    OnboardingFlow.completeOnboarding(context);
  }

  static void gotoLoginPage(BuildContext context) {
    OnboardingFlow.goToLoginPage(context);
  }

  static void gotoJoinLoginPage(BuildContext context) {
    OnboardingFlow.goToJoinLoginPage(context);
  }

  /// Vérifie si l'onboarding est déjà terminé
  // TODO: Implementation avec SharedPreferences ou une base de données
  static Future<bool> isOnboardingCompleted() async {
    return false;
  }

  /// Marque l'onboarding comme terminé
  /// TODO: La meme chose a faire plustard avec SharedPreferences ou une base de données
  static Future<void> markOnboardingAsCompleted() async {
    // Sauvegarder l'état dans les préférences
  }
}
