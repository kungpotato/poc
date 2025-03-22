import 'package:flutter/material.dart';
import 'package:poc/enum/overlay_type.dart';

class AlertRequest {
  AlertRequest({
    required this.title,
    required this.formattedText,
    required this.buttonTitle,
    required this.type,
    this.countdownSeconds,
    this.linkUrl,
    this.linkLabel,
    this.isCenterCountdown = false,
    this.child,
  });

  final String title;
  final String formattedText;
  final String buttonTitle;
  final OverlayTypeType type;
  final int? countdownSeconds;
  final String? linkUrl;
  final String? linkLabel;
  final bool isCenterCountdown;
  final Widget? child;
}

class AlertResponse {
  AlertResponse({required this.confirmed});

  final bool confirmed;
}
