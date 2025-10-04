import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:djina_debug/core/utils/constants.dart';
import 'package:djina_debug/src/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _carController;
  late AnimationController _textController;
  late AnimationController _buttonController;
  late AnimationController _continueController;

  late Animation<Offset> _carSlideAnimation;
  late Animation<double> _carScaleAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _buttonOpacityAnimation;
  late Animation<Offset> _carContinueAnimation;

  bool _hasStarted = false;
  bool _showContent = false;

  @override
  void initState() {
    super.initState();

    // Animation d'entrée de la voiture
    _carController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Animation du texte
    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Animation du bouton
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Animation de continuation
    _continueController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // Configuration des animations
    _carSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 2.0), // Commence en bas de l'écran
      end: const Offset(0, 0), // S'arrête au centre
    ).animate(CurvedAnimation(parent: _carController, curve: Curves.easeOut));

    _carScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _carController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    _buttonOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );

    _carContinueAnimation =
        Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(0, -3.0), // Sort vers le haut
        ).animate(
          CurvedAnimation(parent: _continueController, curve: Curves.easeInOut),
        );

    // Démarrer la séquence d'animations
    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    // Attendre un peu puis démarrer l'animation de la voiture
    await Future.delayed(const Duration(milliseconds: 500));
    _carController.forward();

    // Attendre que la voiture soit arrivée puis afficher le texte
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      _showContent = true;
    });
    _textController.forward();

    // Attendre puis afficher le bouton
    await Future.delayed(const Duration(milliseconds: 600));
    _buttonController.forward();
  }

  void _startCar() async {
    setState(() {
      _hasStarted = true;
    });

    // Faire disparaître le texte et le bouton
    _textController.reverse();
    _buttonController.reverse();

    // Attendre un peu puis faire partir la voiture
    await Future.delayed(const Duration(milliseconds: 300));
    _continueController.forward();

    // Naviguer vers la page suivante après l'animation
    await Future.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      OnboardingController.proceedToOnboarding(context);
    }
  }

  @override
  void dispose() {
    _carController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    _continueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      body: Stack(
        children: [
          // Deux bandes orange verticales au centre comme la route de la voiture
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 30, color: AppTheme.cardColor),
                const SizedBox(width: 20),
                Container(width: 30, color: AppTheme.cardColor),
              ],
            ),
          ),

          // Car with animations
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _hasStarted ? _continueController : _carController,
                  builder: (context, child) {
                    return SlideTransition(
                      position: _hasStarted
                          ? _carContinueAnimation
                          : _carSlideAnimation,
                      child: ScaleTransition(
                        scale: _carScaleAnimation,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            AppImages.onboarding2,
                            width: 350,
                            height: 520,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                if (_showContent)
                  AnimatedBuilder(
                    animation: _textController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _textOpacityAnimation.value,
                        child: const Text(
                          "DJINA",
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),
                      );
                    },
                  ),

                const SizedBox(height: 60),

                // Button
                if (_showContent)
                  AnimatedBuilder(
                    animation: _buttonController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _buttonOpacityAnimation.value,
                        child: Container(
                          width: 220,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryColor.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: _hasStarted ? null : _startCar,
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Démarrer",
                                      style: TextStyle(
                                        color: AppTheme.secondaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.double_arrow,
                                      color: AppTheme.secondaryColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
