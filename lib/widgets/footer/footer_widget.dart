import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(color: ColorsConstant.primaryYellow),
      child: const SafeArea(
        top: false,
        child: Center(
          child: Text(
            '©Made with ❤️ by M McFly',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
