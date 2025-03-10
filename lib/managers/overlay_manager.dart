import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/enum/overlay_type.dart';
import 'package:poc/overlay/models/dialog_model.dart';
import 'package:poc/overlay/models/snackbar_model.dart';
import 'package:poc/overlay/overlay_service.dart';
import 'package:poc/providers/dialog_provider.dart';
import 'package:poc/widgets/countdown_text.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayManager extends ConsumerStatefulWidget {
  const OverlayManager({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<OverlayManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends ConsumerState<OverlayManager> {
  late OverlayService _dialogService;

  @override
  void initState() {
    super.initState();
    _dialogService = ref.read(overlayProvider);
    _dialogService.registerDialogListener(_showDialog);
    _dialogService.registerSnackBarListener(_showSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  List<InlineSpan> buildTextSpans({
    required String formattedText,
    required bool isCenterCountdown,
    required String linkLabel,
    int? countdownSeconds,
    String? linkUrl,
  }) {
    final List<InlineSpan> spans = [];
    final RegExp regex = RegExp(r'(\{\{1\}\}|\{\{2\}\})');
    final matches = regex.allMatches(formattedText);
    int lastIndex = 0;

    if (matches.isEmpty) {
      spans.add(
        TextSpan(
          text: formattedText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    } else {
      for (final match in matches) {
        if (match.start > lastIndex) {
          spans.add(
            TextSpan(
              text: formattedText.substring(lastIndex, match.start),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        if (match.group(0) == '{{1}}') {
          if (isCenterCountdown == true) {
            spans.add(
              WidgetSpan(
                child: Center(
                  child: CountdownText(
                    countdownSeconds: countdownSeconds ?? 0,
                    onComplete: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            );
          } else {
            spans.add(
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: CountdownText(
                  countdownSeconds: countdownSeconds ?? 0,
                  onComplete: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          }
        }

        if (match.group(0) == '{{2}}') {
          spans.add(
            TextSpan(
              text: linkLabel,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.blue),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () => launchUrl(Uri.parse(linkUrl!)),
            ),
          );
        }

        lastIndex = match.end;
      }

      if (lastIndex < formattedText.length) {
        spans.add(TextSpan(text: formattedText.substring(lastIndex)));
      }
    }

    return spans;
  }

  void _showSnackBar(SnackBarRequest request) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: const Key('value'),
        content: Text(request.message),
        duration: Duration(seconds: request.durationSeconds),
      ),
    );
  }

  void _showDialog(AlertRequest request) {
    IconData icon;
    Color iconColor;

    switch (request.type) {
      case OverlayTypeType.danger:
        icon = Icons.error;
        iconColor = Colors.red;
      case OverlayTypeType.warning:
        icon = Icons.warning;
        iconColor = Colors.orange;
      case OverlayTypeType.success:
        icon = Icons.check_circle;
        iconColor = Colors.green;
    }

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Row(
                  children: [
                    Icon(icon, color: iconColor, size: 30),
                    const SizedBox(width: 8),
                    Text(request.title),
                  ],
                ),
                content: RichText(
                  text: TextSpan(
                    children: buildTextSpans(
                      linkLabel: request.linkLabel ?? '',
                      formattedText: request.formattedText,
                      isCenterCountdown: request.isCenterCountdown,
                      countdownSeconds: request.countdownSeconds,
                      linkUrl: request.linkUrl,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _dialogService.dialogComplete(
                        AlertResponse(confirmed: false),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      _dialogService.dialogComplete(
                        AlertResponse(confirmed: true),
                      );
                      Navigator.pop(context);
                    },
                    child: Text(request.buttonTitle),
                  ),
                ],
              );
            },
          ),
    );
  }
}
