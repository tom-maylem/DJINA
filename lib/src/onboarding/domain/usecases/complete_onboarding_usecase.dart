import 'package:djina_debug/src/onboarding/domain/repositories/preferences_repositories.dart';

class CompleteOnboardingUsecase {
  final PreferencesRepository repository;
  CompleteOnboardingUsecase({required this.repository});
  Future<void> call() async {
    await repository.saveOnboardingComplete();
  }
}
