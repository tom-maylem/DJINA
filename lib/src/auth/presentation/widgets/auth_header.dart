import 'package:flutter/material.dart';
import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:djina_debug/core/utils/constants.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Background jaune avec la voiture
        Container(
          height: 280,
          width: double.infinity,
          decoration: const BoxDecoration(color: AppTheme.cardColor),
        ),

        // Bouton retour et logo DJINA
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 12,
          right: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              const Text(
                'DJINA',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondaryColor,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),

        // Image de la voiture
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImages.onboarding4,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
