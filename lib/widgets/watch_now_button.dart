import 'package:flutter/material.dart';
import 'package:gamma_test/config/colors.dart';
import 'package:gamma_test/config/text_styles.dart';

class WatchNowButton extends StatelessWidget {
  const WatchNowButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .8,
      child: TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 6,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.play_arrow,
                size: 24,
              ),
              Text(
                'Watch now',
                style: TextStyles.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
