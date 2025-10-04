import 'package:flutter/material.dart';

class ServiceImageContainer extends StatelessWidget {
  final String imagePath;
  final double height;
  final BoxFit fit;

  const ServiceImageContainer({
    super.key,
    required this.imagePath,
    this.height = 200,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: fit,
        ),
      ),
    );
  }
}
