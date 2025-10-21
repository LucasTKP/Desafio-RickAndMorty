import 'package:desafio_rickandmorty/ui/core/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static const String fontFamily = 'Outfit';

  static TextTheme text(BuildContext context) {
    return Theme.of(context).textTheme.copyWith(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
    );
  }

  static ProgressIndicatorThemeData progressIndicatorTheme(BuildContext context) {
    return const ProgressIndicatorThemeData();
  }

  static AppBarTheme appBarTheme(BuildContext context) {
    return AppBarTheme(
      backgroundColor: ThemeColors.primary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: ThemeColors.white,
      ),
      iconTheme: const IconThemeData(
        color: ThemeColors.white,
      ),
    );
  }

  static BottomSheetThemeData bottomSheetTheme(BuildContext context) {
    return BottomSheetThemeData(
      backgroundColor: ThemeColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
