import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'ride_confirmation_page.dart';
import 'package:djina_debug/src/home/presentation/widgets/services/vehicle_card.dart';
import 'package:djina_debug/src/home/presentation/widgets/services/service_tab_bar.dart';
import 'package:djina_debug/src/home/presentation/widgets/services/service_confirm_button.dart';
import 'package:djina_debug/src/home/presentation/widgets/services/trip_info_widget.dart';
import 'package:djina_debug/src/home/presentation/widgets/services/parking_indicator.dart';

class TaxiVoiturePage extends StatefulWidget {
  const TaxiVoiturePage({super.key});

  @override
  State<TaxiVoiturePage> createState() => _TaxiVoiturePageState();
}

class _TaxiVoiturePageState extends State<TaxiVoiturePage> {
  int selectedCarIndex = 0;
  bool isLoading = false;

  final List<Map<String, dynamic>> cars = [
    {
      'name': 'Taxi',
      'price': 'F 2.000',
      'time': '3 min',
      'image': 'assets/images/yellowcar.png',
      'color': AppTheme.cardColor,
    },
    {
      'name': 'Confort',
      'price': 'F 3.500',
      'time': '2 min',
      'image': 'assets/images/black1.png',
      'color': AppTheme.secondaryColor,
    },
    {
      'name': 'Confort+',
      'price': 'F 5.000',
      'time': '3 min',
      'image': 'assets/images/black1.png',
      'color': Colors.grey,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Partie carte
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  // Image de la carte
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(
                              Icons.map,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Bouton retour
                  Positioned(
                    top: 50,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.secondaryColor.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 16,
                    right: 16,
                    child: ParkingIndicator(),
                  ),

                  // Informations du trajet
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: TripInfoWidget(
                      fromLocation: 'Alfa Zegrati',
                      toLocation: 'Rue Massanya',
                    ),
                  ),
                ],
              ),
            ),

            // Partie sélection de voiture
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Onglets
                      const ServiceTabBar(
                        activeTab: 'Taxi-Voiture',
                        inactiveTab: 'Taxi-Moto',
                      ),

                      const SizedBox(height: 16),

                      // Liste des voitures
                      SizedBox(
                        height: 102,
                        child: Row(
                          children: cars.asMap().entries.map((entry) {
                            final index = entry.key;
                            final car = entry.value;
                            final isSelected = selectedCarIndex == index;

                            return Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: index < cars.length - 1 ? 8 : 0,
                                ),
                                child: VehicleCard(
                                  name: car['name'],
                                  price: car['price'],
                                  time: car['time'],
                                  imagePath: car['image'],
                                  vehicleColor: car['color'],
                                  isSelected: isSelected,
                                  onTap: () {
                                    setState(() {
                                      selectedCarIndex = index;
                                    });
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Bouton confirmer
                      ServiceConfirmButton(
                        isLoading: isLoading,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Future.delayed(const Duration(seconds: 2));

                          if (mounted) {
                            setState(() {
                              isLoading = false;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RideConfirmationPage(
                                  selectedCar: cars[selectedCarIndex],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
