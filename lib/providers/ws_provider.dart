import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/todo/todo_state.dart';
import 'package:poc/service/ws_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'ws_provider.g.dart';

@Riverpod(keepAlive: true)
SmartWebSocketService smartWs(Ref ref) {
  final service = SmartWebSocketService(
    'wss://stream.binance.com:9443/ws/btcusdt@trade',
  );

  service.connect();
  ref.onCancel(service.pause);
  ref.onResume(service.resume);
  ref.onDispose(service.dispose);

  return service;
}

@riverpod
Raw<Stream<List<Coin>>> wsEvent(Ref ref, String eventType) {
  final ws = ref.watch(smartWsProvider);
  return ws.stream
      .bufferTime(const Duration(seconds: 3))
      .map(
        (event) =>
            event
                .where((element) => element['e'] == eventType)
                .map(
                  (e) => Coin(
                    price: double.parse(e['p'] as String),
                    symbol: e['s'] as String,
                  ),
                )
                .toList(),
      )
      .doOnData((event) => print(event.length))
      .doOnError((p0, p1) {
        print(p0);
        print(p1);
      });
}
