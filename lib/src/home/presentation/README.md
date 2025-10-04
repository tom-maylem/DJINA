# Architecture de la Page d'Accueil avec Provider

## Vue d'ensemble

La page d'accueil suit la même architecture Provider que l'authentification pour maintenir la cohérence du projet. Cette approche modulaire facilite la maintenance et la compréhension du code.

## 1. HomeProvider - Gestion d'État

Le `HomeProvider` centralise toute la logique de la page d'accueil :

```dart
class HomeProvider extends ChangeNotifier {
  // Contrôleurs de recherche
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  
  // États de l'interface
  String _selectedService = '';
  bool _isLoading = false;
}
```

### Fonctionnalités :
- **Gestion des champs de recherche** : localisation et destination
- **Sélection de services** : moto, voiture, livraison
- **Trajets récents** : données simulées
- **Validation en temps réel** : activation du bouton "Commandez"

### Services centralisés dans `service_type.dart` :
```dart
final List<Map<String, dynamic>> services = [
  {
    'type': 'moto',
    'title': 'Taxi moto',
    'subtitle': 'Djina',
    'icon': 'assets/images/motorcycle-front.png',
    'color': AppTheme.card,
  },
];
```

### Trajets récents simulés :
```dart
List<Map<String, dynamic>> get recentTrips => [
  {
    'title': 'Rue Massanya',
    'subtitle': 'Corniche Ouest',
    'icon': 'assets/images/location_icon.png', 
  },
];
```

## 3. Pattern Consumer

```dart
Consumer<HomeProvider>(
  builder: (context, homeProvider, child) {
    return Column(
      children: [
        SearchSection(
          locationController: homeProvider.locationController,
          destinationController: homeProvider.destinationController,
          canSearch: homeProvider.canSearch,
          onSearch: () => homeProvider.searchRide(),
        ),
        ServicesGrid(
          selectedService: homeProvider.selectedService,
          onServiceSelected: homeProvider.selectService,
        ),
        // ...
      ],
    );
  },
)
```

## 5. Images Utilisées
```
assets/images/motorcycle-front.png
assets/images/car-rear.png
assets/images/vector.png
assets/images/van-front.png
assets/images/location_icon.png 
assets/images/delivery_icon.png 
```
## 6. Comment Utiliser

### Ajouter un nouveau service :
1. Modifier la liste `services` dans `service_type.dart`
2. Ajouter l'image correspondante dans les assets
3. Le widget se met à jour automatiquement

### Modifier les trajets récents :
1. Modifier la liste `recentTrips` dans `HomeProvider`
2. Les changements s'appliquent immédiatement

### Ajouter une nouvelle fonctionnalité :
1. Ajouter l'état dans `HomeProvider`
2. Créer un widget dédié dans `widgets/`
3. L'intégrer dans `home_page.dart`

