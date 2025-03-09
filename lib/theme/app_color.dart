import 'package:flutter/material.dart';

class KpColorSeed {
  KpColorSeed._();

  static final KpColorSeed _instance = KpColorSeed._();

  static KpColorSeed get instance => _instance;

  Color? _primary;
  Color? _secondary;

  Color get primary => _primary ?? const Color(0xff0d7c66);

  set primary(Color val) => _primary = val;

  Color get secondary => _secondary ?? const Color(0xff41b3a2);

  set secondary(Color val) => _secondary = val;

  Color get tertiary => const Color(0xff6c757d);

  Color get danger => const Color(0xffdc3545);

  Color get success => const Color(0xff28a745);

  Color get warning => const Color(0xffffc107);

  Color get info => _primary ?? const Color(0xff17a2b8);

  Color get front => const Color(0xff2c3333);

  Color get surfaceLight => const Color(0xfff5f5f5);

  Color get surfaceDark => const Color(0xff2d2d2d);

  Color get scaffoldLight => const Color(0xffeae9e9);
  Color get scaffoldDark => const Color(0xff414141);
}
