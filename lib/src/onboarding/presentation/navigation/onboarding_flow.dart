import 'package:flutter/material.dart';
import 'package:djina_debug/config/app_navigation.dart';
import 'package:djina_debug/config/route_pages.dart';
import 'package:djina_debug/src/onboarding/presentation/pages/onboarding_screens.dart';
import 'package:djina_debug/src/onboarding/presentation/pages/location_permission_page.dart';

// Gestion du flux de navigation pour l'onboarding
class OnboardingFlow {
  /// Démarre le processus d'onboarding
  static void goToWelcome(BuildContext context) {
    AppNavigation.navigateAndReplace(context, RoutePages.welcome);
  }

  /// Passe aux écrans d'onboarding principaux
  static void goToOnboarding(BuildContext context) {
    AppNavigation.navigateWithAnimation(context, const OnboardingScreens());
  }

  /// Passe à la demande de permission de localisation
  static void goToLocationPermission(BuildContext context) {
    AppNavigation.navigateWithAnimation(
      context,
      const LocationPermissionPage(),
    );
  }

  static void goToLoginPage(BuildContext context) {
    AppNavigation.navigateTo(context, RoutePages.login);
  }

  static void goToJoinLoginPage(BuildContext context) {
    AppNavigation.navigateTo(context, RoutePages.joinLogin);
  }

  /// Termine l'onboarding et va vers l'authentification
  static void completeOnboarding(BuildContext context) {
    AppNavigation.navigateAndReplace(context, RoutePages.login);
  }
}
