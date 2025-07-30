import 'package:flutter/material.dart';
import '../core/constants/color_const.dart';
import '../core/constants/typography_const.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryLight,
      onPrimaryContainer: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryLight,
      onSecondaryContainer: AppColors.onSecondary,
      tertiary: AppColors.accent,
      onTertiary: AppColors.primary,
      error: AppColors.error,
      onError: AppColors.onPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
      outline: AppColors.divider,
      shadow: AppColors.primaryDark,
    ),

    // Scaffold
    scaffoldBackgroundColor: AppColors.scaffoldBackground,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      elevation: 0,
      titleTextStyle: AppTypography.appBarTitle,
      iconTheme: IconThemeData(color: AppColors.onPrimary),
    ),

    // Bottom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      unselectedIconTheme: IconThemeData(color: AppColors.textSecondary),
      elevation: 8,
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: AppTypography.button.copyWith(fontWeight: FontWeight.w600),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTypography.button,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // Cards
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.divider, width: 0.5),
      ),
      margin: const EdgeInsets.all(8),
    ),

    // Input Fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.divider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      labelStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondary,
      ),
      hintStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.textDisabled,
      ),
    ),

    // Text Selection
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primaryLight,
      selectionHandleColor: AppColors.primary,
    ),

    // Progress Indicators
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
      circularTrackColor: AppColors.surface,
      linearTrackColor: AppColors.surface,
    ),

    // Dialogs
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      titleTextStyle: AppTypography.headlineSmall,
      contentTextStyle: AppTypography.bodyMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Snackbars
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.primary,
      contentTextStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.onPrimary,
      ),
      actionTextColor: AppColors.accent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

    // Chips
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.surface,
      selectedColor: AppColors.primary.withAlpha(25),
      checkmarkColor: AppColors.primary,
      disabledColor: AppColors.surface,
      shadowColor: AppColors.primaryDark,
      labelStyle: AppTypography.bodySmall,
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.divider),
      ),
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 16,
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 24),

    // Tab Bar
    tabBarTheme: const TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textSecondary,
      indicator: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.primary, width: 2)),
      ),
    ),

    // List Tiles
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.primary,
      textColor: AppColors.textPrimary,
      tileColor: Colors.transparent,
    ),

    // Popup Menu
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.surface,
      textStyle: AppTypography.bodyMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.divider),
      ),
    ),

    // Tooltip
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: AppTypography.bodySmall.copyWith(color: AppColors.onPrimary),
    ),
  );

  // Dark Theme (Optional)
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // You can customize this for dark mode if needed
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.primaryDark,
  );
}
