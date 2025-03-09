import 'package:color_type_converter/color_type_converter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/theme/app_appbar.dart';
import 'package:poc/theme/app_color.dart';
import 'package:poc/theme/dark_color.dart';
import 'package:poc/theme/light_color.dart';
import 'package:poc/theme/text_theme.dart' show textTheme;

final inputDecoration = InputDecorationTheme(
  border: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusColor: KpColorSeed.instance.primary,
  filled: true,
  isDense: true,
  // contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
  labelStyle: const TextStyle(color: Colors.black87, fontSize: 14),
  hintStyle: const TextStyle(color: Colors.black87, fontSize: 14),
  fillColor: KpColorSeed.instance.surfaceLight,
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedErrorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  outlineBorder: const BorderSide(color: Colors.grey),
  prefixStyle: TextStyle(color: KpColorSeed.instance.primary),
  prefixIconColor: Colors.grey,
);

class MyThemes {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: lightColorScheme,
    iconTheme: const IconThemeData(color: Colors.white, size: 16),
    listTileTheme: const ListTileThemeData(tileColor: Colors.white),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(KpColorSeed.instance.primary),
    ),
    primaryColor: KpColorSeed.instance.primary,
    primarySwatch: ColorConverter<MaterialColor>().convert(
      KpColorSeed.instance.primary,
    ),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.light,
    appBarTheme: AppAppbar.appbar,
    scaffoldBackgroundColor: KpColorSeed.instance.scaffoldLight,
    buttonTheme: ButtonThemeData(
      buttonColor: KpColorSeed.instance.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: KpColorSeed.instance.primary),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    dividerTheme: const DividerThemeData(space: 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KpColorSeed.instance.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.black,
      ),
    ),
    textTheme: textTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: KpColorSeed.instance.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: KpColorSeed.instance.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: inputDecoration,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: KpColorSeed.instance.primary,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: KpColorSeed.instance.surfaceLight,
      headerBackgroundColor: KpColorSeed.instance.primary,
      todayBorder: BorderSide(color: KpColorSeed.instance.primary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        foregroundColor: KpColorSeed.instance.primary,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: inputDecoration,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: KpColorSeed.instance.primary,
      extendedTextStyle: const TextStyle(color: Colors.white),
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme: darkColorScheme,
    iconTheme: const IconThemeData(color: Colors.white, size: 16),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(KpColorSeed.instance.primary),
    ),
    primaryColor: KpColorSeed.instance.primary,
    primarySwatch: ColorConverter<MaterialColor>().convert(
      KpColorSeed.instance.primary,
    ),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: KpColorSeed.instance.surfaceDark,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: KpColorSeed.instance.scaffoldDark,
    listTileTheme: ListTileThemeData(
      tileColor: KpColorSeed.instance.surfaceDark,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: KpColorSeed.instance.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: KpColorSeed.instance.primary),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KpColorSeed.instance.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white70,
      ),
    ),
    dividerTheme: const DividerThemeData(space: 1),
    textTheme: textTheme,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: KpColorSeed.instance.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: KpColorSeed.instance.primary,
      unselectedItemColor: Colors.white60,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: inputDecoration.copyWith(
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white60),
      fillColor: Colors.black54,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: KpColorSeed.instance.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: KpColorSeed.instance.primary,
      foregroundColor: Colors.white,
    ),
  );
}
