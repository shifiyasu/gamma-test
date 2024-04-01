import 'package:flutter/material.dart';
import 'package:gamma_test/config/colors.dart';
import 'package:gamma_test/config/text_styles.dart';

get appTheme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        labelSmall: TextStyles.labelSmall,
        labelMedium: TextStyles.labelMedium,
        labelLarge: TextStyles.labelLarge,
        titleSmall: TextStyles.titleSmall,
        titleMedium: TextStyles.titleMedium,
        titleLarge: TextStyles.titleLarge,
        headlineSmall: TextStyles.headlineSmall,
        headlineMedium: TextStyles.headlineMedium,
        headlineLarge: TextStyles.headlineLarge,
        bodyMedium: TextStyles.bodyMedium,
        bodyLarge: TextStyles.bodyLarge,
      ),
      fontFamily: TextStyles.fontFamily,
      colorScheme: _colorScheme,
    );
ColorScheme get _colorScheme => const ColorScheme.dark(
    primary: AppColors.black,
    secondary: AppColors.white,
    brightness: Brightness.dark);
