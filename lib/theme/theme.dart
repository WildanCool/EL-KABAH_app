import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color greenLight = Color(0xFF889265);
  static const Color greenMedium = Color(0xFF79815C);
  static const Color greenDark = Color(0xFF585F41);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,

    primaryColor: AppColors.greenMedium,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.greenMedium,
      foregroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0,
    ),

    colorScheme: const ColorScheme.light(
      primary: AppColors.greenMedium,
      secondary: AppColors.greenLight,
    ),
  );
}
