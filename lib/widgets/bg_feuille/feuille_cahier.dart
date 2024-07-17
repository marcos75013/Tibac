import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class FeuilleCahier extends StatelessWidget {
  final double lineSpacing;
  final double verticalLinePadding;
  //final Color backgroundColor;
  final double verticalLineWidth;

  const FeuilleCahier({
    super.key,
    this.lineSpacing = 20.0,
    this.verticalLinePadding = 20.0,
    this.verticalLineWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstant.backgroundColor,
      child: Stack(
        children: generateLines(context),
      ),
    );
  }

  List<Widget> generateLines(BuildContext context) {
    List<Widget> lines = [];
    double screenHeight = MediaQuery.of(context).size.height;

    lines.add(
      Positioned(
        top: 0,
        bottom: 0,
        left: verticalLinePadding,
        child: Container(
          width: verticalLineWidth,
          color: ColorsConstant.red600,
        ),
      ),
    );

    for (double y = 0; y < screenHeight; y += lineSpacing) {
      lines.add(
        Positioned(
          top: y,
          left: 0,
          right: 0,
          child: const Divider(
            color: ColorsConstant.blue600,
            thickness: 1,
          ),
        ),
      );
    }
    return lines;
  }
}
