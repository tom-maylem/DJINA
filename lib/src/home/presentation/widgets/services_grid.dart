import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:djina_debug/src/home/presentation/widgets/service_type.dart';
import 'package:flutter/material.dart';

class ServicesGrid extends StatelessWidget {
  final String selectedService;
  final Function(String) onServiceSelected;

  const ServicesGrid({
    super.key,
    required this.selectedService,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Commandez',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Layout personnalisé : 2 cartes côte à côte, puis 2 cartes pleine largeur
          Column(
            children: [
              // Première ligne : 2 cartes côte à côte (Taxi moto et Taxi voiture)
              Row(
                children: [
                  Expanded(child: _buildServiceCard(context, services[0])),
                  const SizedBox(width: 12),
                  Expanded(child: _buildServiceCard(context, services[1])),
                ],
              ),
              const SizedBox(height: 12),

              // Deuxième ligne : Livraison Moto (pleine largeur)
              _buildServiceCard(context, services[2]),
              const SizedBox(height: 12),

              // Troisième ligne : Livraison Voiture (pleine largeur)
              _buildServiceCard(context, services[3]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    final isSelected = selectedService == service['type'];

    return GestureDetector(
      onTap: () {
        // Sélectionner le service seulement (pas de navigation immédiate)
        onServiceSelected(service['type']);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 80, // Hauteur fixe pour toutes les cartes
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.cardColor : AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.cardColor : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Textes
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 3,
                    width: 20,
                    color: AppTheme.cardColor, // petit trait jaune
                    margin: const EdgeInsets.only(bottom: 4),
                  ),
                  Text(
                    service['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    service['subtitle'],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // Icône
            Image.asset(
              service['icon'],
              width: 36,
              height: 36,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported,
                  size: 36,
                  color: Colors.grey[400],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
