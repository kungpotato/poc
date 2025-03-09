import 'dart:async';

import 'package:poc/dialog/alert_request.dart';
import 'package:poc/dialog/alert_response.dart';

class DialogService {
  late Function(AlertRequest) _showDialogListener;
  Completer<dynamic>? _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog(AlertRequest req) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(req);
    return _dialogCompleter!.future as Future<AlertResponse>;
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }
}
