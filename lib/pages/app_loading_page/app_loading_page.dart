import 'package:flutter/material.dart';
import 'package:petit_bac/config/theming/colors_constant.dart';
import 'package:petit_bac/main.dart';
import 'package:petit_bac/widgets/custom_progressing_painter/custom_progressing_painter.dart';

class AppLoadingPage extends StatefulWidget {
  const AppLoadingPage({super.key});

  @override
  AppLoadingPageState createState() => AppLoadingPageState();
}

class AppLoadingPageState extends State<AppLoadingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    _startLoading();
  }

  void _startLoading() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()), 
      );
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
      backgroundColor: ColorsConstant.horizontalLineColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'lib/assets/pngs/petit_bac_logo.png',
              width: 400,
              height: 400,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomPaint(
                painter: CustomProgressPainter(_animation.value),
                child: const SizedBox(
                  width: 200,
                  height: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
