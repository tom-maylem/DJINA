import 'package:flutter/material.dart';
import 'package:djina_debug/src/home/presentation/pages/services/taxi_moto_page.dart';
import 'package:djina_debug/src/home/presentation/pages/services/taxi_voiture_page.dart';
import 'package:djina_debug/src/home/presentation/pages/services/livraison_moto_page.dart';
import 'package:djina_debug/src/home/presentation/pages/services/livraison_voiture_page.dart';

/// Navigation dédiée aux services
/// Centralise la navigation vers les différentes pages de services
class ServiceNavigation {
  
  /// Navigue vers la page du service selon le type
  static void navigateToService(BuildContext context, String serviceType) {
    Widget page;
    
    switch (serviceType) {
      case 'moto':
        page = const TaxiMotoPage();
        break;
      case 'voiture':
        page = const TaxiVoiturePage();
        break;
      case 'livraison_moto':
        page = const LivraisonMotoPage();
        break;
      case 'livraison_voiture':
        page = const LivraisonVoiturePage();
        break;
      default:
        // Service non reconnu, afficher un message d'erreur
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Service "$serviceType" non disponible'),
            backgroundColor: Colors.red,
          ),
        );
        return;
    }
    
    // Navigation vers la page du service
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
  
  /// Navigue vers une page de service spécifique
  static void navigateToTaxiMoto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TaxiMotoPage()),
    );
  }
  
  static void navigateToTaxiVoiture(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TaxiVoiturePage()),
    );
  }
  
  static void navigateToLivraisonMoto(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LivraisonMotoPage()),
    );
  }
  
  static void navigateToLivraisonVoiture(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LivraisonVoiturePage()),
    );
  }
  
  /// Retour à la page précédente
  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
