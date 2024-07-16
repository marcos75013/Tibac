import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class AppBarGame extends StatelessWidget implements PreferredSizeWidget {
  final String? letter;

  const AppBarGame({
    super.key,
    this.letter,
  });

  @override
  Size get preferredSize => const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsConstant.primaryYellow,
              Color(0xFFFFF8E1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'lib/assets/pngs/petit_bac_logo.png',
                height: 160,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    letter!,
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 10.0,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'LETTRE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
