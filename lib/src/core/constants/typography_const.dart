import 'package:flutter/material.dart';
import 'color_const.dart';

class AppTypography {
  // Font Families
  static const String fontInter = 'Inter';
  static const String fontPoppins = 'Poppins';

  // Display Text
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontPoppins,
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.25,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontPoppins,
    fontSize: 45,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontPoppins,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  // Headline Text
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontPoppins,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontPoppins,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontPoppins,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // Title Text
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontInter,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontInter,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontInter,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontInter,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontInter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: AppColors.textPrimary,
    height: 1.43,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontInter,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
    height: 1.33,
  );

  // Label Text
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontInter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
    height: 1.43,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontInter,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.textPrimary,
    height: 1.33,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontInter,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.textSecondary,
    height: 1.45,
  );

  // Specialized Text Styles
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: fontPoppins,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.onPrimary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontInter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontInter,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.textTertiary,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: fontInter,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: AppColors.textSecondary,
    height: 1.6,
  );
}
