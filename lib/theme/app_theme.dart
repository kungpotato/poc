import 'package:color_type_converter/color_type_converter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/theme/app_appbar.dart';
import 'package:poc/theme/dark_color.dart';
import 'package:poc/theme/generated_tokens/kp_color.dart';
import 'package:poc/theme/light_color.dart';
import 'package:poc/theme/text_theme.dart';

const inputDecoration = InputDecorationTheme(
  border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  focusColor: KpColor.primaryLight,
  filled: true,
  isDense: true,
  labelStyle: TextStyle(color: Colors.black87, fontSize: 14),
  hintStyle: TextStyle(color: Colors.black87, fontSize: 14),
  fillColor: KpColor.surfaceLight,
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  focusedErrorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  outlineBorder: BorderSide(color: Colors.grey),
  prefixStyle: TextStyle(color: KpColor.primaryLight),
  prefixIconColor: Colors.grey,
);

class MyThemes {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    iconTheme: const IconThemeData(color: Colors.white, size: 16),
    listTileTheme: const ListTileThemeData(tileColor: Colors.white),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(KpColor.primaryLight),
    ),
    primaryColor: KpColor.primaryLight,
    primarySwatch: ColorConverter<MaterialColor>().convert(
      KpColor.primaryLight,
    ),
    fontFamily: GoogleFonts.prompt().fontFamily,
    appBarTheme: AppAppbar.appbar,
    scaffoldBackgroundColor: KpColor.backgroundLight,
    buttonTheme: ButtonThemeData(
      buttonColor: KpColor.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: KpColor.primaryLight),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    dividerTheme: const DividerThemeData(space: 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KpColor.primaryLight,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.black,
      ),
    ),
    textTheme: textTheme,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: KpColor.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: KpColor.primaryLight,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: inputDecoration,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: KpColor.primaryLight,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: KpColor.surfaceLight,
      headerBackgroundColor: KpColor.primaryLight,
      todayBorder: BorderSide(color: KpColor.primaryLight),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        foregroundColor: KpColor.primaryLight,
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: inputDecoration,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: KpColor.primaryLight,
      extendedTextStyle: TextStyle(color: Colors.white),
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    iconTheme: const IconThemeData(color: Colors.white, size: 16),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(KpColor.primaryDark),
    ),
    primaryColor: KpColor.primaryDark,
    primarySwatch: ColorConverter<MaterialColor>().convert(KpColor.primaryDark),
    fontFamily: GoogleFonts.prompt().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: KpColor.surfaceDark,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.prompt(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: KpColor.backgroundDark,
    listTileTheme: const ListTileThemeData(tileColor: KpColor.surfaceDark),
    buttonTheme: ButtonThemeData(
      buttonColor: KpColor.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: KpColor.primaryDark),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KpColor.primaryDark,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white70,
      ),
    ),
    dividerTheme: const DividerThemeData(space: 1),
    textTheme: textTheme,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: KpColor.primaryDark,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: KpColor.primaryDark,
      unselectedItemColor: Colors.white60,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: inputDecoration.copyWith(
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white60),
      fillColor: Colors.black54,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: KpColor.primaryDark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: KpColor.primaryDark,
      foregroundColor: Colors.white,
    ),
  );
}
