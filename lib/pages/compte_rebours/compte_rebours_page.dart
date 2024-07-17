import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';
import 'package:petit_bac/pages/game/game_page.dart';
import 'package:petit_bac/widgets/bg_feuille/feuille_cahier.dart';

class CompteReboursPage extends StatefulWidget {
  final String letter;
  final List<String> categories;
  final int initialScoreTotal;

  const CompteReboursPage({
    super.key,
    required this.letter,
    required this.categories,
    required this.initialScoreTotal,
  });

  @override
  CompteReboursPageState createState() => CompteReboursPageState();
}

class CompteReboursPageState extends State<CompteReboursPage> with TickerProviderStateMixin {
  int _remainingTime = 5; // Initial countdown time
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _remainingTime),
    )..forward();
    startCountdown();
  }

  void startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GamePage(
              letter: widget.letter,
              categories: widget.categories,
              initialScoreTotal: widget.initialScoreTotal,
            ),
          ),
        );
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const FeuilleCahier(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Image.asset(
                    'lib/assets/pngs/petit_bac_logo.png',
                    height: 300,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: CircularProgressIndicator(
                          value: _remainingTime > 0 ? _remainingTime / 5 : 0,
                          strokeWidth: 30,
                          valueColor: const AlwaysStoppedAnimation<Color>(ColorsConstant.primaryYellow),
                          backgroundColor: const Color.fromARGB(255, 124, 200, 219),
                        ),
                      ),
                      Text(
                        _remainingTime > 0 ? '$_remainingTime' : 'Go!',
                        style: TextStyle(
                          fontSize: _remainingTime > 0 ? 100 : 80,
                          fontWeight: FontWeight.bold,
                          color: _remainingTime > 0 ? Colors.black : ColorsConstant.primaryYellow,
                          shadows: _remainingTime <= 0
                              ? [
                                  const Shadow(
                                    blurRadius: 10.0,
                                    color: ColorsConstant.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ]
                              : null,
                        ),
                      ),
                    ],
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
