import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiDialog extends StatefulWidget {
  final int scoreTotal;

  const ConfettiDialog({super.key, required this.scoreTotal});

  @override
  ConfettiDialogState createState() => ConfettiDialogState();
}

class ConfettiDialogState extends State<ConfettiDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        alignment: Alignment.center,
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Bravo Défi terminé",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                "Score Total: ${widget.scoreTotal}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}