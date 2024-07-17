import 'package:flutter/material.dart';
import 'package:petit_bac/pages/category_page/category_page.dart';
import 'package:petit_bac/pages/choix_lettre/choix_lettre_page.dart';
import 'package:petit_bac/widgets/CategorieInput/category_input_field.dart';
import 'package:petit_bac/widgets/ConfettiDialog/confetti_dialog.dart';
import 'package:petit_bac/widgets/appBarGame/app_bar_game.dart';
import 'package:petit_bac/widgets/footer_scores_widget/footer_scores_widgets.dart';

class GamePage extends StatefulWidget {
  final String letter;
  final List<String> categories;
  final int initialScoreTotal;

  const GamePage({
    super.key,
    required this.letter,
    required this.categories,
    required this.initialScoreTotal,
  });

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _progressAnimation;
  bool isChallengeFinished = false;
  int scorePartie = 0;
  late int scoreTotal;

  @override
  void initState() {
    super.initState();
    scoreTotal = widget.initialScoreTotal;
    int totalSeconds = widget.categories.length * 10;

    _controller = AnimationController(
      duration: Duration(seconds: totalSeconds),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _colorAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(_controller);

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementScore(int increment) {
    setState(() {
      scorePartie += increment;
    });
  }

  void endGame() {
    setState(() {
      scoreTotal += scorePartie;
      scorePartie = 0;
    });
  }

  void restartGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChoixLettrePage(
          categories: widget.categories,
          initialScoreTotal: scoreTotal,
        ),
      ),
    );
  }

  void finishChallenge() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfettiDialog(scoreTotal: scoreTotal);
      },
    ).then((_) {
      setState(() {
        scoreTotal = 0;
        scorePartie = 0;
        isChallengeFinished = true;
      });
    });
  }

  void initializeChallenge() {
    if (!isChallengeFinished) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Impossible d'initialiser un défi, vous en avez déjà un en cours."),
        ),
      );
    } else {
      setState(() {
        isChallengeFinished = false;
      });

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CategoryPage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGame(letter: widget.letter),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _progressAnimation.value,
            color: _colorAnimation.value,
            backgroundColor: Colors.grey[300],
            minHeight: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: widget.categories.map((category) {
                    return CategoryInputField(
                      category: category,
                      letter: widget.letter,
                      onIncrementScore: incrementScore,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 2.0,
              alignment: WrapAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: endGame,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  child: const Text('Fin de partie'),
                ),
                ElevatedButton(
                  onPressed: restartGame,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  child: const Text('Nouvelle lettre'),
                ),
                ElevatedButton(
                  onPressed: finishChallenge,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  child: const Text('Fin de défi'),
                ),
                ElevatedButton(
                  onPressed: initializeChallenge,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  child: const Text('Nouveau défi'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: FooterScoresWidget(scorePartie: scorePartie, scoreTotal: scoreTotal),
    );
  }
}
