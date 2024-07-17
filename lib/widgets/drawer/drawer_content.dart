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
                  color: ColorsConstant.blue600,
                ),
                child: Center(
                  child: Image.asset(
                    'lib/assets/pngs/petit_bac_logo.png',
                    height: 140, 
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle), 
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
                title: const Text('Mon historique de jeu'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
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
                color: ColorsConstant.greyVersion,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
