// domain/repositories/location_repository.dart
abstract class LocationRepository {
  Future<void> enableLocation();
  Future<bool> hasPermission();
}
