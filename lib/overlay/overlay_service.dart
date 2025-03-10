import 'dart:async';

import 'package:poc/overlay/models/bottomsheet_model.dart';
import 'package:poc/overlay/models/dialog_model.dart';
import 'package:poc/overlay/models/snackbar_model.dart';

class OverlayService {
  late Function(AlertRequest) _showDialogListener;
  late Function(BottomSheetRequest) _showBottomSheetListener;
  late Function(SnackBarRequest) _showSnackBarListener;

  Completer<dynamic>? _dialogCompleter;
  Completer<dynamic>? _bottomSheetCompleter;

  void registerDialogListener(Function(AlertRequest) listener) {
    _showDialogListener = listener;
  }

  void registerBottomSheetListener(Function(BottomSheetRequest) listener) {
    _showBottomSheetListener = listener;
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

  Future<AlertResponse> showBottomSheet(BottomSheetRequest req) {
    _bottomSheetCompleter = Completer<AlertResponse>();
    _showBottomSheetListener(req);
    return _bottomSheetCompleter!.future as Future<AlertResponse>;
  }

  void showSnackBar(SnackBarRequest req) {
    _showSnackBarListener(req);
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }

  void bottomSheetComplete(AlertResponse response) {
    _bottomSheetCompleter?.complete(response);
    _bottomSheetCompleter = null;
  }
}
