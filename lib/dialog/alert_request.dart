enum DialogType { error, warning, success }

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
  });

  final String title;
  final String formattedText;
  final String buttonTitle;
  final DialogType type;
  final int? countdownSeconds;
  final String? linkUrl;
  final String? linkLabel;
  final bool isCenterCountdown;
}
