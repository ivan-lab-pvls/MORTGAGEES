import 'package:flutter/material.dart';

class AppTheme {
  static const Color blackColor = Color(0xFF363636);
  static const Color greyColor = Color(0xFFC1C1C1);
  static const Color lightColor = Color(0xFF4A4A5B);
  static const Color greenColor = Color(0xFF24C665);

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xFF536DF9),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xFFC1C1C1),
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppTheme.blackColor,
            fontSize: 16,
          ),
        ),
      );
}
