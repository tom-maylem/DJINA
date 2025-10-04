// gestion des images de l'onboarding
class AppImages {
  static const String onboarding1 = 'assets/images/taxi_onboarding.png';
  static const String onboarding2 = 'assets/images/car.png';
  static const String onboarding3 = 'assets/images/car1.png';
  static const String onboarding4 = 'assets/images/car2.png';
}

// gestion des données de l'onboarding
class OnboardingData {
  final String title;

  OnboardingData({required this.title});

  static final List<OnboardingData> pages = [
    OnboardingData(title: "Déplacez vous avec\nSécurité"),
    OnboardingData(title: "Aller où vous voulez\net quand vous\nle voulez"),
    OnboardingData(title: "Chaque jour de\nnouvelles\nExpériences"),
  ];
}
