import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/order_book/order_book.dart';
import 'package:poc/screens/todo/todo_state.dart';
import 'package:poc/screens/top_gain/coin.dart';
import 'package:poc/service/ws_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'ws_provider.g.dart';

@Riverpod(keepAlive: false)
SmartWebSocketService coinWs(Ref ref) {
  final service = SmartWebSocketService(
    'wss://stream.binance.com:9443/ws/btcusdt@trade',
  );

  service.connect();
  ref.onCancel(service.pause);
  ref.onResume(service.resume);
  ref.onDispose(service.dispose);

  return service;
}

@Riverpod(keepAlive: false)
SmartWebSocketService binanceMarketWs(Ref ref) {
  final service = SmartWebSocketService(
    'wss://stream.binance.com:9443/ws/!ticker@arr',
  );

  service.connect();
  ref.onCancel(service.pause);
  ref.onResume(service.resume);
  ref.onDispose(service.dispose);

  return service;
}

@Riverpod(keepAlive: false)
SmartWebSocketService binanceDepthWs(Ref ref, String symbol) {
  final service = SmartWebSocketService(
    'wss://stream.binance.com:9443/ws/$symbol@depth20@100ms',
  );

  service.connect();
  ref.onCancel(service.pause);
  ref.onResume(service.resume);
  ref.onDispose(service.dispose);

  return service;
}

@riverpod
Raw<Stream<List<KpCoin>>> wsEvent(Ref ref, String eventType) {
  final ws = ref.watch(coinWsProvider);
  return ws.stream
      .bufferTime(const Duration(seconds: 3))
      .map(
        (event) =>
            event
                .where((element) => element['e'] == eventType)
                .map(
                  (e) => KpCoin(
                    price: double.parse(e['p'] as String),
                    symbol: e['s'] as String,
                  ),
                )
                .toList(),
      )
      .doOnError((p0, p1) {
        print(p0);
        print(p1);
      });
}

@riverpod
Stream<Map<String, BinanceCoin>> binanceCoinMap(Ref ref) {
  final channel = ref.watch(binanceMarketWsProvider);

  return channel.stream
      .bufferTime(const Duration(seconds: 3)) // ~60fps
      .where((buffer) => buffer.isNotEmpty)
      .map((bufferedEvents) {
        try {
          return <String, BinanceCoin>{
            for (final item in bufferedEvents)
              if (item['e'] == '24hrTicker')
                item['s'].toString(): BinanceCoin.fromJson(item),
          };
        } catch (e, stack) {
          print('❌ JSON decode failed: $e');
          print(stack);
          return <String, BinanceCoin>{};
        }
      })
      .doOnError((err, stack) {
        print('❌ Stream error: $err');
        print(stack);
      });
}

@riverpod
Stream<OrderBookSnapshot> orderBook(Ref ref, String symbol) {
  final channel = ref.watch(binanceDepthWsProvider(symbol));

  return channel.stream
      .bufferTime(const Duration(seconds: 1)) // ~60fps
      .where((buffer) => buffer.isNotEmpty)
      .map((buffer) {
        final latestJson = buffer.last;
        return OrderBookSnapshot.fromJson(latestJson);
      })
      .doOnError((err, stack) {
        print('❌ Stream error: $err');
        print(stack);
      });
}
