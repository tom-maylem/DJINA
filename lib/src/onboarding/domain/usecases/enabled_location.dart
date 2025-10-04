import 'package:djina_debug/src/onboarding/domain/repositories/location_repository.dart';

class EnableLocationUseCase {
  final LocationRepository repository;
  EnableLocationUseCase({required this.repository});
  Future<void> call() async {
    await repository.enableLocation();
  }
}
