import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/top_gain/coin_tile.dart';
import 'package:poc/screens/top_gain/provider.dart';

class TopGainersPage extends ConsumerWidget {
  const TopGainersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(topGainerOrderProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Top Gainers')),
      body: ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, index) {
          final coinId = order[index];
          return RepaintBoundary(child: CoinTile(coinId: coinId));
        },
      ),
    );
  }
}
