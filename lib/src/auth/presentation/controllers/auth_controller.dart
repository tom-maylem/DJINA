import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:djina_debug/src/auth/presentation/navigation/auth_navigation.dart';
import 'package:djina_debug/src/auth/presentation/providers/auth_provider.dart';

/// Contrôleur simple pour gérer le flux d'authentification
/// Centralise la logique métier de l'authentification
class AuthController {
  /// Navigue vers la page d'accueil
  static void gotoHomepage(BuildContext context) {
    AuthNavigation.completeAuthentication(context);
  }

  /// Gère la connexion utilisateur
  static Future<void> login(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.login(context);
  }

  /// Gère l'inscription utilisateur
  static Future<void> signup(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.signup(context);
  }

  /// Bascule la visibilité du mot de passe
  static void togglePasswordVisibility(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.togglePasswordVisibility();
  }

  /// Bascule l'acceptation des conditions
  static void toggleTermsAcceptance(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.toggleTermsAcceptance();
  }

  /// Efface les erreurs
  static void clearError(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.clearError();
  }
}
