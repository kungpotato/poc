import 'dart:async';

import 'package:poc/overlay/models/dialog_model.dart';
import 'package:poc/overlay/models/snackbar_model.dart';

class OverlayService {
  late Function(AlertRequest) _showDialogListener;
  late Function(SnackBarRequest) _showSnackBarListener;

  Completer<dynamic>? _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  void registerSnackBarListener(
    Function(SnackBarRequest) showSnackBarListener,
  ) {
    _showSnackBarListener = showSnackBarListener;
  }

  Future<AlertResponse> showDialog(AlertRequest req) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(req);
    return _dialogCompleter!.future as Future<AlertResponse>;
  }

  void showSnackBar(SnackBarRequest req) {
    _showSnackBarListener(req);
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }
}
