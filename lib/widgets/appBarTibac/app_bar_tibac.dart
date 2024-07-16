import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';

class AppBarTibac extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;

  const AppBarTibac({
    super.key,
    required this.logoPath, required Null Function() onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorsConstant.primaryYellow,
            Color(0xFFFFF8E1),
          ],
        ),
        border: const Border(
          bottom: BorderSide(
            color: ColorsConstant.horizontalLineColor,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      height: preferredSize.height,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  logoPath,
                  height: 120,
                  width: 120,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.menu_rounded, color: Colors.black, size: 34),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
