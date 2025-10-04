import 'package:flutter/material.dart';
import 'package:djina_debug/config/app_navigation.dart';
import 'package:djina_debug/config/route_pages.dart';
import 'package:djina_debug/core/theme/app_theme.dart';

/// Configuration principale de l'application
/// Point d'entrée centralisé pour la configuration
class AppConfig {
  
  /// Route initiale de l'application
  static const String initialRoute = RoutePages.splash;
  
  /// Configuration des routes pour MaterialApp
  static Map<String, WidgetBuilder> get routes => AppNavigation.routes;
  
  /// Titre de l'application
  static const String appTitle = 'DJINA';
  
  /// Configuration du thème
  static ThemeData get theme => AppTheme.theme();
  
  /// Configuration pour MaterialApp
  static MaterialApp createApp() {
    return MaterialApp(
      title: appTitle,
      theme: theme,
      initialRoute: initialRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
