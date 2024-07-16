import 'package:flutter/widgets.dart';

class CardTitleWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double borderRadius;

  const CardTitleWidget({
    super.key,
    required this.title,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.borderRadius = 8.0, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
