import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class BoutonWidget extends StatelessWidget {
  const BoutonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsConstant.foregroundColorBouton,
        backgroundColor: ColorsConstant.backgroundColorBouton,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsConstant.borderBouton, width: 6),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
