import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_chart_plus/k_chart_plus.dart';
import 'package:poc/providers/ws_provider.dart';
import 'package:poc/screens/order_book/order_book.dart';

class DepthPage extends ConsumerStatefulWidget {
  const DepthPage({super.key});

  @override
  ConsumerState<DepthPage> createState() => _DepthPageState();
}

class _DepthPageState extends ConsumerState<DepthPage> {
  @override
  Widget build(BuildContext context) {
    final asyncBook = ref.watch(orderBookProvider('btcusdt'));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Depth')),
        body: asyncBook.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (data) {
            return DepthChart(
              data.bids.toDepthBids,
              data.asks.toDepthAsks,
              ChartColors(),
            );
          },
        ),
      ),
    );
  }
}
