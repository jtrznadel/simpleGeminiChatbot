import 'package:flutter/material.dart';

import 'package:simple_chatbot/core/constants/colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkBgColor,
    scaffoldBackgroundColor: AppColors.darkBgColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.lightBgColor,
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
    ),
    hintColor: AppColors.darkBgColor,
    iconTheme: const IconThemeData(color: AppColors.lightBgColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.lightBgColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.lightBgColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      hintStyle: const TextStyle(
        color: AppColors.lightBgColor,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightBgColor,
    scaffoldBackgroundColor: AppColors.lightBgColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.darkBgColor,
        fontSize: 26,
        fontWeight: FontWeight.w500,
      ),
    ),
    hintColor: AppColors.lightBgColor,
    iconTheme: const IconThemeData(color: AppColors.darkBgColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.darkBgColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.darkBgColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: AppColors.darkBgColor,
        ),
      ),
      hintStyle: const TextStyle(
        color: AppColors.darkBgColor,
      ),
    ),
  );
}
