import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RecentTrips extends StatelessWidget {
  final List<Map<String, dynamic>> trips;
  final Function(Map<String, dynamic>) onTripSelected;

  const RecentTrips({
    super.key,
    required this.trips,
    required this.onTripSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mes Trajets',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.secondaryColor,
            ),
          ),
          const SizedBox(height: 12),

          // Liste des trajets récents
          ...trips.map((trip) => _buildTripItem(trip)).toList(),
        ],
      ),
    );
  }

  Widget _buildTripItem(Map<String, dynamic> trip) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => onTripSelected(trip),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              // Icône du trajet
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),

              // Informations du trajet
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip['title'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      trip['subtitle'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              // Flèche
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
