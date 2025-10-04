## Authentification
l'authentification des utilisateurs selon l'architecture Clean Architecture.


## Flux de navigation

### Séquence d'authentification :
1. **LoginPage** → 2. **SignupPage**  → 3. **OtpSignup**  → 4. **Home**

### Comment naviguer :
```dart
// ✅ Bonne pratique - Utiliser le contrôleur
AuthController.goToSignup(context);

// ❌ Éviter - Navigation directe
Navigator.push(context, MaterialPageRoute(...));
```

##  Pages disponibles

| Page | Rôle | Navigation |
|------|------|-----------|
| `LoginPage` | Connexion utilisateur | `AuthController.goToLogin()` |
| `SignupPage` | Inscription utilisateur | `AuthController.goToSignup()` |
| `OtpSignup` | Vérification OTP | `AuthController.goToOtpVerification()` |

##  Bonnes pratiques
- Utiliser `AuthController` pour toute navigation
- Valider les formulaires avant soumission
- Gérer les états de chargement
- Afficher des messages d'erreur clairs

### ❌ À éviter :
- Navigation directe avec Navigator
- Logique métier dans les widgets
- Mots de passe en dur
- Données sensibles non chiffrées

## 🔧 Fichiers importants

| Fichier | Rôle | Quand le modifier |
|---------|------|------------------|
| `auth_controller.dart` | Logique de navigation | Ajouter une nouvelle page |
| `login_page.dart` | Page de connexion | Modifier l'UI de connexion |
| `signup_page.dart` | Page d'inscription | Modifier l'UI d'inscription |
| `otp_signup.dart` | Vérification OTP | Modifier la vérification |

##  Démarrage 

Pour ajouter une fonctionnalité :
1. Créer la page dans `presentation/pages/`
2. Ajouter la route dans `config/route_pages.dart`
3. Configurer dans `config/app_navigation.dart`
4. Utiliser via `AuthController`

## Sécurité

### Points importants :
- Ne jamais stocker de mots de passe en clair
- Utiliser HTTPS pour toutes les requêtes
- Valider côté client ET serveur
- Implémenter la déconnexion automatique
