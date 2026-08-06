import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const background = Color(0xFFFBF5F1);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceAlt = Color(0xFFF3E8E0);
  static const accent = Color(0xFFC77A5B);
  static const accentFill = Color(0xFF9E5238);
  static const accentTint = Color(0xFFF5E2D8);
  static const accentPressed = Color(0xFF82412C);
  static const support = Color(0xFF7FA6A0);
  static const textPrimary = Color(0xFF2A1E18);
  static const textSecondary = Color(0xFF5C4A40);
  static const textTertiary = Color(0xFF8C7A70);
  static const border = Color(0xFFE8DAD0);
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFD97706);
  static const danger = Color(0xFFDC2626);

  static const gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, support],
  );
}

class AppRadius {
  AppRadius._();
  static const card = 20.0;
  static const control = 14.0;
  static const input = 12.0;
  static const pill = 999.0;
}

class AppText {
  AppText._();

  static const display = TextStyle(
    fontFamily: 'Newsreader',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    color: AppColors.textPrimary,
  );

  static const title = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const body = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const label = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const caption = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
  );
}

class AppShadow {
  AppShadow._();
  static const card = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 2, offset: Offset(0, 1)),
    BoxShadow(color: Color(0x0F000000), blurRadius: 24, offset: Offset(0, 8)),
  ];
}

ThemeData buildAppTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.accentFill,
      secondary: AppColors.support,
      surface: AppColors.surface,
      error: AppColors.danger,
    ),
    textTheme: base.textTheme.apply(fontFamily: 'Nunito'),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentFill,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        textStyle: AppText.label,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.accentFill,
        side: const BorderSide(color: AppColors.accent),
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        textStyle: AppText.label,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        borderSide: const BorderSide(color: AppColors.accent, width: 2),
      ),
    ),
  );
}
