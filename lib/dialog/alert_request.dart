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
  });

  final String title;
  final String
  formattedText; // Uses placeholders {{1}} (countdown) & {{2}} (link)
  final String buttonTitle;
  final DialogType type;
  final int? countdownSeconds;
  final String? linkUrl;
  final String? linkLabel;
}
