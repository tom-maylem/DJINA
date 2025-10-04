import 'package:djina_debug/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:djina_debug/src/onboarding/presentation/controllers/onboarding_controller.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  bool _isAnimating = false;

  // Les controller pour l'animation
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Contrôleur des pages
  final PageController _pageController = PageController();

  // Getters
  int get currentPage => _currentPage;
  bool get isAnimating => _isAnimating;
  bool get isLastPage => _currentPage >= OnboardingData.pages.length - 1;
  PageController get pageController => _pageController;
  Animation<double> get fadeAnimation => _fadeAnimation;
  Animation<Offset> get slideAnimation => _slideAnimation;

  /// Initialisation des animations
  void initializeAnimations(TickerProvider vsync) {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    // Démarrer l'a animations d'entrée
    _startEntryAnimations();
  }

  /// Démarre les animations d'entrée
  void _startEntryAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _slideController.forward();
  }

  /// gestion des pages
  void onPageChanged(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners();

      // Redémarrer les animations pour la nouvelle page
      _restartAnimations();
    }
  }

  /// Redémarre les animations
  void _restartAnimations() {
    _fadeController.reset();
    _slideController.reset();
    _fadeController.forward();
    _slideController.forward();
  }

  /// Navigation vers la page suivante
  void nextPage(BuildContext context) {
    if (_isAnimating) return;

    if (_currentPage < OnboardingData.pages.length - 1) {
      _isAnimating = true;
      notifyListeners();

      _pageController
          .nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          )
          .then((_) {
            _isAnimating = false;
            notifyListeners();
          });
    } else {
      // Dernière page pour aller vers la permission de localisation
      OnboardingController.requestLocationPermission(context);
    }
  }

  /// Passe à la page spécifique
  void goToPage(int page) {
    if (_isAnimating || page == _currentPage) return;

    _isAnimating = true;
    notifyListeners();

    _pageController
        .animateToPage(
          page,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        )
        .then((_) {
          _isAnimating = false;
          notifyListeners();
        });
  }

  /// pour liberer les resources
  void disposeAnimations() {
    _pageController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
  }
}
