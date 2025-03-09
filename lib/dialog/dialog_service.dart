import 'dart:async';

import 'package:poc/dialog/alert_request.dart';
import 'package:poc/dialog/alert_response.dart';

class DialogService {
  late Function(AlertRequest) _showDialogListener;
  Completer<dynamic>? _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog({
    required String title,
    required String description,
    String buttonTitle = 'OK',
  }) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(
      AlertRequest(
        title: title,
        description: description,
        buttonTitle: buttonTitle,
      ),
    );
    return _dialogCompleter!.future as Future<AlertResponse>;
  }

  void dialogComplete([AlertResponse? response]) {
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }
}
