import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/providers/ws_provider.dart';
import 'package:poc/screens/top_gain/coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
List<String> topGainerOrder(Ref ref) {
  final map = ref.watch(binanceCoinMapProvider).value ?? {};
  final sorted =
      map.values.toList()
        ..sort((a, b) => b.percentChange.compareTo(a.percentChange));
  return sorted.map((c) => c.symbol).toList();
}

@riverpod
BinanceCoin? binanceCoin(Ref ref, String symbol) {
  final map = ref.watch(binanceCoinMapProvider).value ?? {};
  return map[symbol];
}
