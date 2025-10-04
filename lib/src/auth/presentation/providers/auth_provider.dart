import 'package:flutter/material.dart';
import 'package:djina_debug/config/route_pages.dart';
import '../navigation/auth_navigation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoginLoading = false;
  bool _isSignupLoading = false;

  bool _obscurePassword = true;
  bool _acceptTerms = false;

  // Contrôleurs des champs de texte
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  /// Constructeur - Ajouter les listeners sur les contrôleurs
  AuthProvider() {
    _phoneController.addListener(_onTextChanged);
    _passwordController.addListener(_onTextChanged);
    _fullNameController.addListener(_onTextChanged);
  }

  /// Méthode appelée quand le texte change dans les champs
  void _onTextChanged() {
    notifyListeners();
  }

  // Messages d'erreur
  String? _errorMessage;

  // Getters publics
  bool get isLoginLoading => _isLoginLoading;
  bool get isSignupLoading => _isSignupLoading;
  bool get obscurePassword => _obscurePassword;
  bool get acceptTerms => _acceptTerms;
  String? get errorMessage => _errorMessage;

  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get fullNameController => _fullNameController;

  // Getters pour validation
  bool get isLoginFormValid =>
      _phoneController.text.trim().isNotEmpty &&
      _passwordController.text.isNotEmpty;

  bool get isSignupFormValid =>
      _phoneController.text.trim().isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _fullNameController.text.trim().isNotEmpty &&
      _acceptTerms;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  /// Basculer l'acceptation des conditions
  void toggleTermsAcceptance() {
    _acceptTerms = !_acceptTerms;
    notifyListeners();
  }

  /// Effacer le message d'erreur
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Connexion utilisateur
  Future<void> login(BuildContext context) async {
    if (!isLoginFormValid) {
      setError('Veuillez remplir tous les champs');
      return;
    }

    _isLoginLoading = true;
    clearError();
    notifyListeners();

    try {
      // Simulation d'une requête API
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Implémenter la logique de connexion réelle
      final phone = _phoneController.text.trim();
      //final password = _passwordController.text;

      // Simulation d'une connexion réussie
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Connexion réussie pour: $phone')),
        );
        // Naviguer vers l'écran principal
        AuthNavigation.completeAuthentication(context);
      }
    } catch (e) {
      setError('Erreur de connexion: ${e.toString()}');
    } finally {
      _isLoginLoading = false;
      notifyListeners();
    }
  }

  /// Inscription utilisateur
  Future<void> signup(BuildContext context) async {
    if (!isSignupFormValid) {
      if (!_acceptTerms) {
        setError('Vous devez accepter les conditions générales');
      } else {
        setError('Veuillez remplir tous les champs');
      }
      return;
    }

    _isSignupLoading = true;
    clearError();
    notifyListeners();

    try {
      // Simulation d'une requête API
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Implémenter la logique d'inscription réelle
      //final phone = _phoneController.text.trim();
      final fullName = _fullNameController.text.trim();
      //final password = _passwordController.text;

      // Simulation d'une inscription réussie
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inscription réussie pour: $fullName')),
        );
        // Naviguer vers la page OTP
        Navigator.pushNamed(context, RoutePages.otpSignup);
      }
    } catch (e) {
      setError('Erreur d\'inscription: ${e.toString()}');
    } finally {
      _isSignupLoading = false;
      notifyListeners();
    }
  }

  /// Réinitialiser le formulaire de connexion
  void resetLoginForm() {
    _phoneController.clear();
    _passwordController.clear();
    _obscurePassword = true;
    clearError();
  }

  /// Réinitialiser le formulaire d'inscription
  void resetSignupForm() {
    _phoneController.clear();
    _passwordController.clear();
    _fullNameController.clear();
    _obscurePassword = true;
    _acceptTerms = false;
    clearError();
  }

  @override
  void dispose() {
    // Supprimer les listeners avant de disposer les contrôleurs
    _phoneController.removeListener(_onTextChanged);
    _passwordController.removeListener(_onTextChanged);
    _fullNameController.removeListener(_onTextChanged);

    _phoneController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }
}
