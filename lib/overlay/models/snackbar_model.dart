import 'package:flutter/material.dart';
import 'package:poc/enum/overlay_type.dart';

class SnackBarRequest {
  SnackBarRequest({
    required this.title,
    required this.type,
    this.titleWidget,
    this.message = '',
    this.messageWidget = const SizedBox(),
    this.durationSeconds = 3,
  });

  final String title;
  final Widget? titleWidget;
  final String? message;
  final Widget? messageWidget;
  final int durationSeconds;
  final OverlayTypeType type;
}
