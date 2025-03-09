

enum DialogType { error, warning, success }

class AlertRequest {
  AlertRequest({
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.type,
  });

  final String title;
  final String description;
  final String buttonTitle;
  final DialogType type;
}
