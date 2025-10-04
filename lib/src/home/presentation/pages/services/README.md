# Pages de Services - Navigation Dédiée

Chaque service de la grille d'accueil a sa propre page dédiée avec une navigation centralisée. Cette approche modulaire facilite l'ajout de nouveaux services et la maintenance du code.

## 📱 Pages Créées

### 1. TaxiMotoPage
- **Service** : Transport en moto-taxi
- **Couleur** : Orange
- **Image** : `assets/images/motorcycle-front.png`
- **Avantages** : Rapidité, économique, écologique, disponible 24h/24

### 2. TaxiVoiturePage  
- **Service** : Transport en voiture
- **Image** : `assets/images/car-rear.png`
- **Avantages** : Confortable, sécurisé, capacité 4 passagers, espace bagages

### 3. LivraisonMotoPage
- **Service** : Livraison express en moto
- **Image** : `assets/images/vector.png`
- **Avantages** : Express (<1h), suivi temps réel, sécurisé, flexible 7j/7

### 4. LivraisonVoiturePage
- **Service** : Livraison gros colis en véhicule utilitaire
- **Image** : `assets/images/van-front.png`
- **Avantages** : Grande capacité (500kg), objets volumineux, assistance, professionnel

## 🧭 Système de Navigation

### ServiceNavigation
Classe centralisée pour gérer la navigation vers les services :

```dart
// Navigation automatique selon le type
ServiceNavigation.navigateToService(context, 'moto');

// Navigation directe vers un service spécifique
ServiceNavigation.navigateToTaxiMoto(context);
ServiceNavigation.navigateToTaxiVoiture(context);
ServiceNavigation.navigateToLivraisonMoto(context);
ServiceNavigation.navigateToLivraisonVoiture(context);
```

### Intégration dans ServicesGrid
```dart
GestureDetector(
  onTap: () {
    // Sélectionner le service
    onServiceSelected(service['type']);
    // Naviguer vers la page dédiée
    ServiceNavigation.navigateToService(context, service['type']);
  },
  // ...
)
```

##  Design Pattern

### Structure Commune
Toutes les pages suivent le même pattern :
- **AppBar** : Noir avec titre du service
- **Image** : Container avec ombre et bordures arrondies
- **Titre et description** : Présentation du service
- **Avantages** : Liste avec icônes et descriptions
- **Bouton CTA** : Appel à l'action pour commander

### Widgets Réutilisables
Chaque page utilise `_buildAdvantageItem()` pour afficher les avantages :
```dart
Widget _buildAdvantageItem(IconData icon, String title, String description)
```


## 🔧 Comment Ajouter un Nouveau Service

### 1. Créer la page
```dart
class NouveauServicePage extends StatelessWidget {
  // Suivre le même pattern que les autres pages
}
```
### 2. Ajouter dans service_type.dart
```dart
{
  'type': 'nouveau_service',
  'title': 'Nouveau Service',
  'subtitle': 'Description',
  'icon': 'assets/images/nouveau_service.png',
},
```

### 3. Mettre à jour ServiceNavigation
```dart
case 'nouveau_service':
  page = const NouveauServicePage();
  break;
```

### 4. Exporter dans services.dart
```dart
export 'nouveau_service_page.dart';
```
##  Prochaines Étapes

- Ajouter des formulaires de commande sur chaque page
- Implémenter la logique de réservation
- Ajouter des animations de transition
- Intégrer avec l'API backend
- Ajouter des tests unitaires

---