import 'package:flutter/material.dart';
import 'package:gamma_test/config/colors.dart';

class DarkOverlayGradient extends StatelessWidget {
  const DarkOverlayGradient({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.transparent,
            AppColors.black,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
    );
  }
}
