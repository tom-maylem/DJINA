import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:djina_debug/src/home/presentation/providers/home_provider.dart';
import 'package:djina_debug/src/home/presentation/widgets/home_header.dart';
import 'package:djina_debug/src/home/presentation/widgets/search_section.dart';
import 'package:djina_debug/src/home/presentation/widgets/services_grid.dart';
import 'package:djina_debug/src/home/presentation/widgets/recent_trips.dart';
import 'package:djina_debug/src/drawer/presentation/pages/profile_page.dart';
import 'package:djina_debug/src/drawer/presentation/pages/security_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: AppTheme.primaryColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppTheme.secondaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              color: AppTheme.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Titre PARAMETTRE
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'PARAMETTRE',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                        letterSpacing: 1,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Options du menu
                  _buildDrawerItem(context, Icons.person_outline, 'Profile'),
                  _buildDrawerItem(context, Icons.security, 'Sécurité'),
                  _buildDrawerItem(context, Icons.language, 'Langue'),
                  _buildDrawerItem(context, Icons.history, 'Historique'),
                  _buildDrawerItem(
                    context,
                    Icons.notifications_outlined,
                    'Notification',
                  ),
                  _buildDrawerItem(context, Icons.shield_outlined, 'A propos'),
                  _buildDrawerItem(context, Icons.help_outline, 'Support'),
                  _buildDrawerItem(context, Icons.flag_outlined, 'Systems'),

                  const SizedBox(height: 40),

                  // Boutons Parainage et Se Déconnecter
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // Bouton Parainage
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400]!),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Parainage',
                              style: TextStyle(
                                color: AppTheme.secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Bouton Se Déconnecter
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // TODO: Implémenter la déconnexion
                            },
                            child: const Text(
                              'Se Déconnecter',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer gris avec profil
          Container(
            height: 80,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Avatar
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[600],
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Nom et prénom
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NOM',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.secondaryColor,
                        ),
                      ),
                      Text(
                        'PRENOM',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: AppTheme.secondaryColor, size: 22),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: AppTheme.secondaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          // Navigation selon le titre
          if (title == 'Profile') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else if (title == 'Sécurité') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecurityPage()),
            );
          }
          // TODO: Ajouter d'autres navigations
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          drawer: _buildDrawer(context),
          body: Column(
            children: [
              // Header avec bienvenue et menu
              const HomeHeader(),

              // Contenu scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Section de recherche
                      SearchSection(
                        locationController: homeProvider.locationController,
                        destinationController:
                            homeProvider.destinationController,
                        canSearch: homeProvider.canSearch,
                        onSearch: () => homeProvider.searchRide(),
                        selectedService: homeProvider.selectedService,
                        isLoading: homeProvider.isLoading,
                      ),

                      // Grille des services
                      ServicesGrid(
                        selectedService: homeProvider.selectedService,
                        onServiceSelected: homeProvider.selectService,
                      ),

                      // Trajets récents
                      RecentTrips(
                        trips: homeProvider.recentTrips,
                        onTripSelected: homeProvider.selectRecentTrip,
                      ),

                      // Espace en bas pour éviter que le contenu soit coupé
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
