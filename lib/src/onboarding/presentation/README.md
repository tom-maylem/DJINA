
# Architecture avec Provider

## Vue d'ensemble

 Ici j’ai utilisé le **pattern Provider** pour gérer l’état de l’écran d’onboarding. ça simplifie la vie : tout l’état est centralisé et les widgets n’ont pas à se prendre la tête pour communiquer entre eux.

## 1. Provider
 **OnboardingProvider**, 

```dart
class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  bool _isAnimating = false;
  
  // Accès public aux valeurs
  int get currentPage => _currentPage;
  bool get isAnimating => _isAnimating;
  
  // Méthode pour passer à la page suivante
  void nextPage(BuildContext context) {
    // Ici, tu ajoutes la logique + notifyListeners()
  }
}
```

## 2. Widgets séparés

Pour que ça reste lisible et modulable, j’ai tout mis dans des widgets séparés. Comme ça, tu peux toucher à un truc sans casser tout le reste :

* `OnboardingHeader` → le logo DJINA, 
* `OnboardingContent` → le PageView avec tous les textes
* `PageIndicators` → les petits points qui montrent la page active
* `OnboardingGestureDetector` → gère les taps, pour passer à la page suivante

## 3. Le pattern Consumer

```dart
Consumer<OnboardingProvider>(
  builder: (context, provider, child) {
    return Column(
      children: [
        OnboardingHeader(fadeAnimation: provider.fadeAnimation),
        OnboardingContent(/* ... */),
        PageIndicators(currentPage: provider.currentPage),
      ],
    );
  },
)
```


### Ajouter un nouveau widget

1. Crée le fichier dans `widgets/`
2. Exporter dans `widgets/widgets.dart`
3. Tu peux l’utiliser direct dans `onboarding_screens.dart`

### Modifier l’état

1. Ajouter la propriété dans `OnboardingProvider`
2. Créer un getter public
3. Créer une méthode pour modifier la valeur
4. Appeler `notifyListeners()` pour que l’UI se mette à jour

### Ajouter une animation

1. Déclare-la dans `OnboardingProvider.initializeAnimations()`
2. Crée un getter pour y accéder
3. Passe-la aux widgets qui en ont besoin
   *les animations sont sympas mais elles peuvent vite ralentir l’app 

## Exemple rapide

```dart
Consumer<OnboardingProvider>(
  builder: (context, provider, child) {
    return GestureDetector(
      onTap: () => provider.nextPage(context),
      child: Text('Page ${provider.currentPage + 1}'),
    );
  },
)
```

## Prochaines étapes

* Ajouter des tests unitaires pour le provider.
* Implémenter la sauvegarde d’état pour ne pas perdre la progression

---