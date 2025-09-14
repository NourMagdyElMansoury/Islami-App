import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      primary: AppColor.primaryColor,
      secondary: AppColor.secondaryColor,
    ),
    scaffoldBackgroundColor: AppColor.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.secondaryColor),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColor.secondaryColor,
        fontSize: 20,
        fontFamily: 'jana',
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: 'jana',
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColor.secondaryColor,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
      bodyMedium: TextStyle(
        color: AppColor.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColor.white,
      indent: 20,
      endIndent: 20,
    ),
  );
}
