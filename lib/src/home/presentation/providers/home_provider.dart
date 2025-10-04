import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  // Contrôleurs pour les champs de recherche
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  // État de l'interface
  String _selectedService = '';
  bool _isLoading = false;

  // Constructeur avec listeners
  HomeProvider() {
    _locationController.addListener(_onTextChanged);
    _destinationController.addListener(_onTextChanged);
  }

  // Getters publics
  TextEditingController get locationController => _locationController;
  TextEditingController get destinationController => _destinationController;
  String get selectedService => _selectedService;
  bool get isLoading => _isLoading;

  // Validation des champs
  bool get canSearch =>
      _locationController.text.trim().isNotEmpty &&
      _destinationController.text.trim().isNotEmpty &&
      _selectedService.isNotEmpty;

  // Données simulées des trajets récents
  List<Map<String, dynamic>> get recentTrips => [
        {
          'title': 'Rue Massanya',
          'subtitle': 'Corniche Ouest',
          'icon': 'assets/images/location_icon.png', // Chemin à remplacer
        },
        {
          'title': 'Livraison Soya',
          'subtitle': 'Plateau',
          'icon': 'assets/images/delivery_icon.png', // Chemin à remplacer
        },
      ];

  void _onTextChanged() {
    notifyListeners();
  }

  void selectService(String serviceType) {
    _selectedService = serviceType;
    notifyListeners();
  }

  Future<void> searchRide() async {
    if (!canSearch) return;

    _isLoading = true;
    notifyListeners();

    try {
      // Simulation d'une recherche
      await Future.delayed(const Duration(seconds: 2));
      
      // TODO: Implémenter la logique de recherche réelle
      
    } catch (e) {
      // Gestion d'erreur
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectRecentTrip(Map<String, dynamic> trip) {
    _destinationController.text = trip['title'];
    notifyListeners();
  }

  void clearSearch() {
    _locationController.clear();
    _destinationController.clear();
    _selectedService = '';
    notifyListeners();
  }

  @override
  void dispose() {
    _locationController.removeListener(_onTextChanged);
    _destinationController.removeListener(_onTextChanged);
    
    _locationController.dispose();
    _destinationController.dispose();
    super.dispose();
  }
}
