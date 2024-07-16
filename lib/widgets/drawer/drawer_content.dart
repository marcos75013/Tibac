import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';
import 'package:petit_bac/pages/create_profile/create_profile_page.dart';
import 'package:petit_bac/pages/mentions_legales/legal_mentions_page.dart'; // Ajout de l'import pour la nouvelle page

bool isOpened = false;

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  DrawerContentState createState() => DrawerContentState();
}

class DrawerContentState extends State<DrawerContent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 140, // Réduire la hauteur du DrawerHeader
                decoration: const BoxDecoration(
                  color: ColorsConstant.horizontalLineColor,
                ),
                child: Center(
                  child: Image.asset(
                    'lib/assets/pngs/petit_bac_logo.png',
                    height: 140, // Ajustez la hauteur de l'image du logo selon vos besoins
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle), // Icône pour Créer un profil
                title: const Text('Créer un profil'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateProfilePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.history), // Icône pour Mon historique de jeu
                title: const Text('Mon historique de jeu'),
                onTap: () {
                  // Action for game history
                },
              ),
              ListTile(
                leading: const Icon(Icons.info), // Icône pour Mentions légales
                title: const Text('Mentions légales'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LegalMentionsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          const Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
