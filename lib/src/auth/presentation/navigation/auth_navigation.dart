import 'package:flutter/material.dart';
import 'package:djina_debug/config/app_navigation.dart';
import 'package:djina_debug/config/route_pages.dart';

/// Contrôleur simple pour gérer le flux d'authentification
/// Centralise la logique métier de l'authentification
class AuthNavigation {
  /// Navigue vers la page de connexion
  static void goToLogin(BuildContext context) {
    AppNavigation.navigateAndReplace(context, RoutePages.login);
  }

  /// Navigue vers la page d'inscription
  static void goToSignup(BuildContext context) {
    AppNavigation.navigateTo(context, RoutePages.signup);
  }

  /// Navigue vers la vérification OTP
  static void goToOtpVerification(BuildContext context) {
    AppNavigation.navigateTo(context, RoutePages.otpSignup);
  }

  /// Termine l'authentification et va vers l'app principale
  static void completeAuthentication(BuildContext context) {
    // TODO: Naviguer vers la page principale après authentification
    AppNavigation.navigateAndReplace(context, RoutePages.homepage);
  }

  /// Retour vers la page précédente
  static void goBack(BuildContext context) {
    AppNavigation.goBack(context);
  }

  /// Vérifie si l'utilisateur est connecté
  /// TODO: Implémenter avec SharedPreferences ou une base de données
  static Future<bool> isUserLoggedIn() async {
    // Pour l'instant, retourne false
    // Dans une vraie app, on vérifierait le token d'authentification
    return false;
  }

  /// Déconnecte l'utilisateur
  /// TODO: Implémenter la déconnexion complète
  static Future<void> logout(BuildContext context) async {
    // Effacer les données utilisateur
    // Naviguer vers l'onboarding ou login
    AppNavigation.navigateAndReplace(context, RoutePages.login);
  }
}
