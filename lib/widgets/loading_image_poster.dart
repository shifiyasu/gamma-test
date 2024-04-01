import 'package:flutter/material.dart';
import 'package:gamma_test/config/colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingImagePoster extends StatelessWidget {
  const LoadingImagePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.black,
      highlightColor: AppColors.gray.withOpacity(.5),
      direction: ShimmerDirection.ltr,
      child: AspectRatio(
        aspectRatio: 15 / 22,
        child: Container(
          margin: const EdgeInsets.only(right: 8, bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}
