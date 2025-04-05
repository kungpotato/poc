import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum WebSocketStatus {
  idle,
  connecting,
  connected,
  paused,
  disconnected,
  error,
  reconnecting,
}

class SmartWebSocketService {
  SmartWebSocketService(this.url);

  final String url;

  WebSocketChannel? _channel;
  final _eventSubject = PublishSubject<Map<String, dynamic>>();
  final _statusSubject = BehaviorSubject<WebSocketStatus>.seeded(
    WebSocketStatus.idle,
  );

  bool _isPaused = false;
  bool _isDisposed = false;

  int _retryCount = 0;
  final int _maxRetries = 5;
  final Duration _initialRetryDelay = const Duration(seconds: 3);

  Stream<Map<String, dynamic>> get stream =>
      _eventSubject.stream.asBroadcastStream();

  Stream<WebSocketStatus> get statusStream =>
      _statusSubject.stream.asBroadcastStream();

  void connect() {
    _retryCount = 0;
    if (_channel != null || _isDisposed) return;

    _statusSubject.add(WebSocketStatus.connecting);

    _channel = WebSocketChannel.connect(Uri.parse(url));

    _channel!.stream.listen(
      _onMessage,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );

    _statusSubject.add(WebSocketStatus.connected);
  }

  void _onMessage(dynamic data) {
    // print(data);
    if (_isPaused) return;
    try {
      final json = jsonDecode(data as String);
      if (json is Map<String, dynamic>) {
        _eventSubject.add(json);
      } else if (json is List) {
        for (final item in json) {
          if (item is Map<String, dynamic>) {
            _eventSubject.add(item);
          }
        }
      }
    } catch (err) {
      print(err);
    }
  }

  void send(Map<String, dynamic> data) {
    if (_channel != null) {
      _channel!.sink.add(jsonEncode(data));
    }
  }

  void pause() {
    _isPaused = true;
    _statusSubject.add(WebSocketStatus.paused);
  }

  void resume() {
    _isPaused = false;
    _statusSubject.add(WebSocketStatus.connected);
  }

  void _onDone() {
    _statusSubject.add(WebSocketStatus.disconnected);
    _retry();
  }

  void _onError(dynamic e) {
    _statusSubject.add(WebSocketStatus.error);
    _retry();
  }

  Future<void> _retry() async {
    if (_isDisposed || _retryCount >= _maxRetries) {
      if (_retryCount >= _maxRetries) {
        _statusSubject.add(WebSocketStatus.error);
      }
      return;
    }

    _retryCount++;
    _statusSubject.add(WebSocketStatus.reconnecting);

    final delay = _initialRetryDelay * _retryCount;
    await Future.delayed(delay);

    if (!_isDisposed) {
      _channel = null;
      connect();
    }
  }

  void dispose() {
    _isDisposed = true;
    _channel?.sink.close();
    _eventSubject.close();
    _statusSubject.close();
  }
}
