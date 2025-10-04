// domain/repositories/preferences_repository.dart
abstract class PreferencesRepository {
  Future<void> saveOnboardingComplete();
  Future<bool> isOnboardingComplete();
}
