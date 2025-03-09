import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/dialog/dialog_service.dart';

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService();
});
