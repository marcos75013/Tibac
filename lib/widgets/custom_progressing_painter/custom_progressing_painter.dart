import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class CustomProgressPainter extends CustomPainter {
  final double progress;

  CustomProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorsConstant.blueButton
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width * progress, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}