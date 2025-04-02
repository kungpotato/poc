import 'package:flutter/material.dart';
import 'package:poc/theme/generated_tokens/kp_font.dart';

final textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: KpFont.sizeXl.toDouble(),
    fontWeight: FontWeight.w700,
    fontFamily: KpFont.familyHeading,
  ),
  titleMedium: TextStyle(
    fontSize: KpFont.sizeLg.toDouble(),
    fontWeight: FontWeight.w500,
    fontFamily: KpFont.familyHeading,
  ),
  titleSmall: TextStyle(
    fontSize: KpFont.sizeMd.toDouble(),
    fontWeight: FontWeight.w500,
    fontFamily: KpFont.familyBase,
  ),
  bodyLarge: TextStyle(
    fontSize: KpFont.sizeMd.toDouble(),
    fontWeight: FontWeight.w400,
    fontFamily: KpFont.familyBase,
  ),
  bodyMedium: TextStyle(
    fontSize: KpFont.sizeSm.toDouble(),
    fontWeight: FontWeight.w400,
    fontFamily: KpFont.familyBase,
  ),
  bodySmall: TextStyle(
    fontSize: KpFont.sizeXs.toDouble(),
    fontWeight: FontWeight.w400,
    fontFamily: KpFont.familyBase,
  ),
  displayLarge: TextStyle(
    fontSize: KpFont.sizeXxl.toDouble(),
    fontWeight: FontWeight.w700,
    fontFamily: KpFont.familyHeading,
  ),
  displayMedium: TextStyle(
    fontSize: KpFont.sizeXl.toDouble(),
    fontWeight: FontWeight.w700,
    fontFamily: KpFont.familyHeading,
  ),
  displaySmall: TextStyle(
    fontSize: KpFont.sizeLg.toDouble(),
    fontWeight: FontWeight.w700,
    fontFamily: KpFont.familyHeading,
  ),
  headlineLarge: TextStyle(
    fontSize: KpFont.sizeXl.toDouble(),
    fontWeight: FontWeight.w700,
    fontFamily: KpFont.familyHeading,
  ),
  headlineMedium: TextStyle(
    fontSize: KpFont.sizeLg.toDouble(),
    fontWeight: FontWeight.w500,
    fontFamily: KpFont.familyHeading,
  ),
  headlineSmall: TextStyle(
    fontSize: KpFont.sizeMd.toDouble(),
    fontWeight: FontWeight.w500,
    fontFamily: KpFont.familyHeading,
  ),
  labelLarge: TextStyle(
    fontSize: KpFont.sizeSm.toDouble(),
    fontWeight: FontWeight.w500,
    fontFamily: KpFont.familyBase,
  ),
  labelMedium: TextStyle(
    fontSize: KpFont.sizeXs.toDouble(),
    fontWeight: FontWeight.w500,
    fontFamily: KpFont.familyBase,
  ),
  labelSmall: TextStyle(
    fontSize: KpFont.sizeXs.toDouble(),
    fontWeight: FontWeight.w400,
    fontFamily: KpFont.familyBase,
  ),
);
