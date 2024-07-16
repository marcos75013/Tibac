import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class LegalMentionsPage extends StatelessWidget {
  const LegalMentionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
           
            const SizedBox(width: 10),
            const Text(
              'Mentions légales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
             Image.asset(
              'lib/assets/pngs/petit_bac_logo.png',
              height: 80,
            ),
          ],
        ),
        backgroundColor: ColorsConstant.horizontalLineColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text(
                '1. Éditeur du site',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nom de la société: Tibac\n'
                'Adresse: 123 Rue de l\'Exemple, 75001 Paris, France\n'
                'Téléphone: +33 1 23 45 67 89\n'
                'Email: contact@tibac.com\n'
                'Directeur de la publication: Jean Dupont',
              ),
              SizedBox(height: 20),
              Text(
                '2. Hébergement',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Hébergeur: OVH\n'
                'Adresse: 2 Rue Kellermann, 59100 Roubaix, France\n'
                'Téléphone: +33 9 72 10 10 07',
              ),
              SizedBox(height: 20),
              Text(
                '3. Propriété intellectuelle',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Le contenu du site Tibac, incluant, mais sans s\'y limiter, les graphismes, images, textes, vidéos, animations, sons, logos, gifs et icônes ainsi que leur mise en forme sont la propriété exclusive de la société Tibac à l\'exception des marques, logos ou contenus appartenant à d\'autres sociétés partenaires ou auteurs.',
              ),
              SizedBox(height: 20),
              Text(
                '4. Protection des données personnelles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'En conformité avec les dispositions du Règlement Général sur la Protection des Données (RGPD), vous disposez d\'un droit d\'accès, de rectification, d\'effacement, d\'opposition et de portabilité de vos données personnelles. Pour exercer ce droit, vous pouvez nous contacter par email à l\'adresse contact@tibac.com.',
              ),
              SizedBox(height: 20),
              Text(
                '5. Responsabilité',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'La société Tibac met en œuvre tous les moyens raisonnables à sa disposition pour assurer un accès de qualité au site et à ses services. Néanmoins, elle ne saurait être tenue responsable de tout dysfonctionnement du réseau ou des serveurs ou de tout autre événement échappant au contrôle raisonnable, qui empêcherait ou dégraderait l\'accès au service.',
              ),
              SizedBox(height: 20),
              Text(
                '6. Cookies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Le site Tibac peut-être amené à vous demander l\'acceptation des cookies pour des besoins de statistiques et d\'affichage. Un cookie est une information déposée sur votre disque dur par le serveur du site que vous visitez. Il contient plusieurs données qui sont stockées sur votre ordinateur dans un fichier texte auquel un serveur accède pour lire et enregistrer des informations.',
              ),
              SizedBox(height: 20),
              Text(
                '7. Contact',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Pour toute question ou information sur les produits présentés sur le site, ou concernant le site lui-même, vous pouvez laisser un message à l\'adresse suivante : contact@tibac.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
