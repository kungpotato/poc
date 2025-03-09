import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

void changeLocale(WidgetRef ref, Locale locale) {
  ref.read(localeProvider.notifier).state = locale;
}