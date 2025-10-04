import 'package:flutter/material.dart';

class ParkingIndicator extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double size;

  const ParkingIndicator({
    super.key,
    this.label = 'P',
    this.backgroundColor = Colors.orange,
    this.textColor = Colors.white,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: size * 0.45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
