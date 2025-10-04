import 'package:flutter/material.dart';

class ServiceTabBar extends StatelessWidget {
  final String activeTab;
  final String inactiveTab;
  final VoidCallback? onActiveTabPressed;
  final VoidCallback? onInactiveTabPressed;

  const ServiceTabBar({
    super.key,
    required this.activeTab,
    required this.inactiveTab,
    this.onActiveTabPressed,
    this.onInactiveTabPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Onglet actif
        GestureDetector(
          onTap: onActiveTabPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              activeTab,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        
        const SizedBox(width: 12),
        
        // Onglet inactif
        GestureDetector(
          onTap: onInactiveTabPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              inactiveTab,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
