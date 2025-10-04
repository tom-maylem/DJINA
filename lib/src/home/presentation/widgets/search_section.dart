import 'package:djina_debug/core/theme/app_theme.dart';
import 'package:djina_debug/src/home/presentation/navigation/service_navigation.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  final TextEditingController locationController;
  final TextEditingController destinationController;
  final bool canSearch;
  final VoidCallback onSearch;
  final String selectedService;
  final bool isLoading;

  const SearchSection({
    super.key,
    required this.locationController,
    required this.destinationController,
    required this.canSearch,
    required this.onSearch,
    required this.selectedService,
    required this.isLoading,
  });

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  // Header du haut
  Widget _topBarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Ouvrir le drawer du Scaffold parent
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.menu, size: 28),
        ),
        const Text(
          "DJINA",
          style: TextStyle(
            color: AppTheme.secondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            _topBarHeader(),
            const SizedBox(height: 20),

            // Champ localisation
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: widget.locationController,
                decoration: const InputDecoration(
                  hintText: 'Localisation / Point de départ',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.location_on, color: Colors.orange),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Champ destination
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: widget.destinationController,
                decoration: const InputDecoration(
                  hintText: 'Où allez-vous ?',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.flag, color: Colors.grey),
                  suffixIcon: Icon(Icons.add, size: 20, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Bouton Commander
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.canSearch && !widget.isLoading
                      ? AppTheme.cardColor
                      : Colors.grey[400],
                  foregroundColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                onPressed: widget.canSearch && !widget.isLoading
                    ? () async {
                        widget.onSearch();
                        // Attendre 2 secondes avant de naviguer
                        await Future.delayed(const Duration(seconds: 2));
                        // Vérifier que le widget est encore monté avant de naviguer
                        if (mounted) {
                          ServiceNavigation.navigateToService(
                            context,
                            widget.selectedService,
                          );
                        }
                      }
                    : null,
                child: widget.isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Recherche...',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        'Commandez',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
