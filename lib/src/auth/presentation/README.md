# Architecture d'Authentification avec Provider

## Vue d'ensemble

L'architecture d'authentification suit le même pattern que l'onboarding avec **Provider** pour une cohérence dans le projet. Cette approche centralisée simplifie la gestion d'état et rend le code plus maintenable, même pour les développeurs juniors.

## 1. AuthProvider - Gestion d'État Centralisée

Le `AuthProvider` gère tous les états liés à l'authentification :

```dart
class AuthProvider extends ChangeNotifier {
  // États de chargement
  bool _isLoginLoading = false;
  bool _isSignupLoading = false;
  
  // États des formulaires
  bool _obscurePassword = true;
  bool _acceptTerms = false;
  
  // Contrôleurs des champs
  final TextEditingController _phoneController = TextEditingController();
  // ...
}
```

### Fonctionnalités principales :
- **Gestion des états de chargement** : `isLoginLoading`, `isSignupLoading`
- **Validation des formulaires** : `isLoginFormValid`, `isSignupFormValid`
- **Gestion des erreurs** : `errorMessage` avec méthodes `setError()` et `clearError()`
- **Contrôle de l'UI** : visibilité mot de passe, acceptation des conditions

## 2. Widgets Modulaires

### AuthHeader
- Header réutilisable avec image de fond, logo DJINA et bouton retour
- Utilisé sur toutes les pages d'authentification

### CustomTextField
- Champ de texte personnalisé avec :
  - Label aligné à droite
  - Support du préfixe (+221 pour téléphone)
  - Icône suffixe (œil pour mot de passe)
  - Style cohérent avec le design

### AuthButton
- Bouton avec **circular loader intégré**
- États : normal, loading, disabled
- Style cohérent noir/blanc

### TermsCheckbox
- **Checkbox interactive** pour les conditions d'utilisation
- Animation de transition
- Style personnalisé

### ErrorMessage
- Affichage des messages d'erreur
- Design avec icône et possibilité de fermeture
- Couleurs d'erreur cohérentes

## 3. Pattern Consumer

```dart
Consumer<AuthProvider>(
  builder: (context, authProvider, child) {
    return Column(
      children: [
        // Message d'erreur
        ErrorMessage(
          message: authProvider.errorMessage,
          onDismiss: authProvider.clearError,
        ),
        
        // Champs de formulaire
        CustomTextField(
          controller: authProvider.phoneController,
          // ...
        ),
        
        // Bouton avec loader
        AuthButton(
          text: 'Connecter',
          isLoading: authProvider.isLoginLoading,
          onPressed: authProvider.isLoginFormValid
              ? () => authProvider.login(context)
              : null,
        ),
      ],
    );
  },
)
```

## 4. Fonctionnalités Implémentées

###  Circular Loaders
- Intégrés dans `AuthButton`
- Désactivation automatique des boutons pendant le chargement
- Animation fluide

###  Checkbox Interactive
- `TermsCheckbox` entièrement interactive
- Validation obligatoire pour l'inscription
- Design personnalisé

###  Gestion d'Erreurs
- Messages d'erreur contextuels
- Validation en temps réel
- Interface utilisateur claire

###  Architecture Clean
- Séparation des responsabilités
- Widgets réutilisables
- Code facile à comprendre

## 5. Structure des Fichiers

```


## 6. Comment Utiliser

### Ajouter un nouveau champ
1. Ajouter le contrôleur dans `AuthProvider`
2. Créer un getter public
3. Utiliser `CustomTextField` dans la page
4. Mettre à jour la validation si nécessaire

### Ajouter une nouvelle validation
1. Créer une méthode dans `AuthProvider`
2. Utiliser dans les getters `isFormValid`
3. Afficher l'erreur avec `setError()`

### Modifier un widget
1. Éditer le fichier dans `widgets/`
2. Le changement s'applique automatiquement partout
3. Pas besoin de modifier les pages

## 7. Avantages de cette Architecture

- **Simple à comprendre** : Pattern Provider classique
- **Maintenable** : Code organisé et modulaire
- **Réutilisable** : Widgets indépendants
- **Testable** : Logique séparée de l'UI
- **Cohérent** : Même pattern que l'onboarding
- **Junior-friendly** : Documentation claire et structure simple

## 8. Prochaines Étapes

- Ajouter des tests unitaires pour `AuthProvider`
- Implémenter la logique d'API réelle
- Ajouter la persistance des données utilisateur
- Intégrer avec le système de navigation global

---