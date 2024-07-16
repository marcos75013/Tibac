import 'package:flutter/material.dart';
import 'package:petit_bac/pages/app_loading_page/app_loading_page.dart';
import 'package:petit_bac/pages/category_page/category_page.dart';
import 'package:petit_bac/widgets/bg_feuille/feuille_cahier.dart';
import 'package:petit_bac/widgets/bouton/bouton_widget.dart';
import 'package:petit_bac/widgets/footer/footer_widget.dart';

void main() {
  runApp(const LeTibacApp());
}

class LeTibacApp extends StatelessWidget {
  const LeTibacApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Le\'tibac',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppLoadingPage(), 
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const FeuilleCahier(),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/pngs/petit_bac_logo.png',
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Bienvenue sur Petit Bac, le jeu amusant et convivial pour tous',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Que vous soyez en famille, entre amis, ou même en compagnie de Smarty McFly, notre robot intelligent et espiègle, préparez-vous à des moments de rires et de défis !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      BoutonWidget(
                        text: 'COMMENCER UN DEFI 😃',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const FooterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
