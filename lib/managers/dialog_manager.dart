import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/dialog/alert_request.dart';
import 'package:poc/dialog/alert_response.dart';
import 'package:poc/dialog/dialog_service.dart';
import 'package:poc/providers/dialog_provider.dart';

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
          (context) => AlertDialog(
            title: Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 8),
                Text(request.title),
              ],
            ),
            content: Text(request.description),
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
                  _dialogService.dialogComplete(AlertResponse(confirmed: true));
                  Navigator.pop(context);
                },
                child: Text(request.buttonTitle),
              ),
            ],
          ),
    );
  }
}
