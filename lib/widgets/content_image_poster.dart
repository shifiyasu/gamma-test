import 'package:flutter/material.dart';
import 'package:gamma_test/config/colors.dart';
import 'package:gamma_test/widgets/dark_overlay_gradient.dart';

class ContentImagePoster extends StatelessWidget {
  const ContentImagePoster(
      {super.key, required this.imageUrl, this.hasDarkBottomGradient = false});

  final String imageUrl;
  final bool hasDarkBottomGradient;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: AspectRatio(
          aspectRatio: 15 / 22,
          child: Stack(
            children: [
              Image.asset(
                imageUrl,
                fit: BoxFit.fitWidth,
              ),
              if (hasDarkBottomGradient)
                DarkOverlayGradient(height: height * .1)
            ],
          ),
        ),
      ),
    );
  }
}
