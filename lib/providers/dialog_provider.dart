import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/overlay/overlay_service.dart';

final overlayProvider = Provider<OverlayService>((ref) {
  return OverlayService();
});
