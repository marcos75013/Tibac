import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';
import 'package:petit_bac/widgets/appBarTibac/app_bar_tibac.dart';
import 'package:petit_bac/widgets/Drawer/drawer_content.dart';
import 'package:petit_bac/widgets/bouton/bouton_widget.dart';
import 'package:petit_bac/pages/compte_rebours/compte_rebours_page.dart';

class ChoixLettrePage extends StatefulWidget {
  final List<String> categories;
  final int initialScoreTotal;

  const ChoixLettrePage({super.key, required this.categories, required this.initialScoreTotal});

  @override
  ChoixLettrePageState createState() => ChoixLettrePageState();
}

class ChoixLettrePageState extends State<ChoixLettrePage> with SingleTickerProviderStateMixin {
  bool isManuel = true;
  String selectedLetter = 'A';
  late AnimationController _controller;
  Timer? _timer;
  bool isRandomLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void toggleSelection(int index) {
    setState(() {
      isManuel = index == 0;
      if (!isManuel) {
        startRandomSelection();
      }
    });
  }

  void startRandomSelection() {
    // Annuler tout minuteur actif avant de démarrer un nouveau
    _timer?.cancel();
    _controller.repeat();
    setState(() {
      isRandomLoading = true;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        selectedLetter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'[DateTime.now().millisecond % 26];
      });
    });

    Timer(const Duration(seconds: 3), () {
      _timer?.cancel();
      _controller.stop();
      setState(() {
        isRandomLoading = false;
      });
    });
  }

  void selectLetter(String letter) {
    setState(() {
      selectedLetter = letter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTibac(logoPath: "lib/assets/pngs/petit_bac_logo.png", onMenuPressed: () {  },),
      drawer: const DrawerContent(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'LETTRE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => toggleSelection(0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isManuel ? ColorsConstant.primaryYellow : Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,
                        child: Text(
                          'MANUELLEMENT',
                          style: TextStyle(
                            color: isManuel ? Colors.black : Colors.black.withOpacity(0.6),
                            fontWeight: isManuel ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => toggleSelection(1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isManuel ? ColorsConstant.primaryYellow : Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,
                        child: Text(
                          'ALEATOIRE',
                          style: TextStyle(
                            color: !isManuel ? Colors.black : Colors.black.withOpacity(0.6),
                            fontWeight: !isManuel ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isManuel)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                alignment: WrapAlignment.center,
                children: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letter) {
                  return GestureDetector(
                    onTap: () => selectLetter(letter),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: selectedLetter == letter ? ColorsConstant.primaryYellow : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              if (isRandomLoading)
                const SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              Text(
                selectedLetter,
                style: const TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                  fontSize: 78,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstant.primaryYellow,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BoutonWidget(
              text: "C'est Parti !",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompteReboursPage(
                      letter: selectedLetter,
                      categories: widget.categories,
                      initialScoreTotal: widget.initialScoreTotal, // Passez le score total
                    ),
                  ),
                );
              },
            ),
          ),
          //const FooterWidget(),
        ],
      ),
    );
  }
}
