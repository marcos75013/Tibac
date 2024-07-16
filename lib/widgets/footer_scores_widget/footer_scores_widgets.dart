import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class FooterScoresWidget extends StatelessWidget {
  final int scorePartie;
  final int scoreTotal;

  const FooterScoresWidget({
    super.key,
    required this.scorePartie,
    required this.scoreTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            ColorsConstant.primaryYellow,
            Color(0xFFFFE082),
          ],
        ),
        border: Border(
          top: BorderSide(
            color: ColorsConstant.primaryYellow,
            width: 7,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'SCORE PARTIE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 150,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$scorePartie',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'SCORE TOTAL',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 150,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$scoreTotal',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
