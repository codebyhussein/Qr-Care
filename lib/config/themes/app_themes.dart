import 'package:flutter/material.dart';
import 'package:qr_care/core/app_color.dart';

ThemeData appthemes() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(16.0),
      //   borderSide: const BorderSide(
      //     color: Colors.white,
      //     width: 2,
      //   ),
      // ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:
            BorderSide(color: AppColors.mainColor, width: 2, strokeAlign: 4),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: AppColors.backgroundColor),
  );
}
