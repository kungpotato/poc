import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/providers/ws_provider.dart';
import 'package:poc/screens/order_book/order_book_side.dart';

class OrderBookPage extends ConsumerWidget {
  const OrderBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBook = ref.watch(orderBookProvider('btcusdt'));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Book'),
          actions: [
            IconButton(
              onPressed: () {
                context.push('/orderbook/depth');
              },
              icon: const Icon(Icons.area_chart),
            ),
          ],
        ),
        body: asyncBook.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (data) {
            return InteractiveOrderBookTriangleView(
              asks: data.asks,
              bids: data.bids,
            );
          },
        ),
      ),
    );
  }
}
