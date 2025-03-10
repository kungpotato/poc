import 'package:poc/enum/overlay_type.dart';

class SnackBarRequest {
  SnackBarRequest({
    required this.message,
    required this.type,
    this.durationSeconds = 3,
  });

  final String message;
  final int durationSeconds;
  final OverlayTypeType type;
}
