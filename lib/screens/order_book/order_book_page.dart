import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/providers/ws_provider.dart';
import 'package:poc/screens/order_book/order_book_side.dart';

class OrderBookPage extends ConsumerWidget {
  const OrderBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBook = ref.watch(orderBookProvider('btcusdt'));

    return Scaffold(
      appBar: AppBar(title: const Text('Order Book')),
      body: asyncBook.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (data) {
          return OrderBookTriangleView(asks: data.asks, bids: data.bids);
        },
      ),
    );
  }
}
