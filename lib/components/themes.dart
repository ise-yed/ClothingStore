import 'package:clothingstore/components/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
        primary: AppColors.kPrimary500, onPrimary: AppColors.kWhite),
    platform: TargetPlatform.iOS,
    fontFamily: 'dana',
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontFamily: 'dana',
        fontSize: 16,
        color: AppColors.kGray900,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        color: AppColors.kGray900,
      ),
      bodySmall: TextStyle(
        fontFamily: 'dana',
        fontSize: 12,
        color: AppColors.kGray900,
      ),
      labelSmall: TextStyle(
        fontFamily: 'dana',
        fontSize: 10,
        color: AppColors.kGray900,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kPrimary500, strokeAlign: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kGray150, strokeAlign: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kGray150, strokeAlign: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kGray150, strokeAlign: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.kPrimary500),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(double.infinity, 40),
        ),
      ),
    ),
    scaffoldBackgroundColor: AppColors.kWhite,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.kWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)))),
  );
}
