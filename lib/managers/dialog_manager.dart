import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/dialog/alert_request.dart';
import 'package:poc/dialog/alert_response.dart';
import 'package:poc/dialog/dialog_service.dart';
import 'package:poc/providers/dialog_provider.dart';
import 'package:poc/widgets/countdown_text.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogManager extends ConsumerStatefulWidget {
  const DialogManager({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends ConsumerState<DialogManager> {
  late DialogService _dialogService;

  @override
  void initState() {
    super.initState();
    _dialogService = ref.read(dialogServiceProvider);
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    IconData icon;
    Color iconColor;

    switch (request.type) {
      case DialogType.error:
        icon = Icons.error;
        iconColor = Colors.red;
      case DialogType.warning:
        icon = Icons.warning;
        iconColor = Colors.orange;
      case DialogType.success:
        icon = Icons.check_circle;
        iconColor = Colors.green;
    }

    showDialog(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder: (context, setState) {
              List<InlineSpan> buildTextSpans() {
                final List<InlineSpan> spans = [];
                final RegExp regex = RegExp(r'(\{\{1\}\}|\{\{2\}\})');
                final matches = regex.allMatches(request.formattedText);
                int lastIndex = 0;

                for (final match in matches) {
                  if (match.start > lastIndex) {
                    spans.add(
                      TextSpan(
                        text: request.formattedText.substring(
                          lastIndex,
                          match.start,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }

                  if (match.group(0) == '{{1}}') {
                    if (request.isCenterCountdown == true) {
                      spans.add(
                        WidgetSpan(
                          child: Center(
                            child: CountdownText(
                              countdownSeconds: request.countdownSeconds ?? 0,
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
                            countdownSeconds: request.countdownSeconds ?? 0,
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
                        text: request.linkLabel,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.blue),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => launchUrl(Uri.parse(request.linkUrl!)),
                      ),
                    );
                  }

                  lastIndex = match.end;
                }

                if (lastIndex < request.formattedText.length) {
                  spans.add(
                    TextSpan(text: request.formattedText.substring(lastIndex)),
                  );
                }

                return spans;
              }

              return AlertDialog(
                title: Row(
                  children: [
                    Icon(icon, color: iconColor, size: 30),
                    const SizedBox(width: 8),
                    Text(request.title),
                  ],
                ),
                content: RichText(
                  text: TextSpan(children: buildTextSpans()),
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
