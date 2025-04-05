import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/top_gain/provider.dart';

class CoinTile extends ConsumerStatefulWidget {
  const CoinTile({required this.coinId, super.key});

  final String coinId;

  @override
  ConsumerState<CoinTile> createState() => _CoinTileState();
}

class _CoinTileState extends ConsumerState<CoinTile>
    with AutomaticKeepAliveClientMixin {
  bool _highlight = false;
  late double? _lastPercentChange;

  @override
  void initState() {
    super.initState();
    final coin = ref.read(binanceCoinProvider(widget.coinId));
    _lastPercentChange = coin?.percentChange;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final coin = ref.watch(binanceCoinProvider(widget.coinId));

    // Highlight if percentChange changed
    if (coin?.percentChange != null &&
        _lastPercentChange != coin?.percentChange) {
      _highlight = true;
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) setState(() => _highlight = false);
      });
      _lastPercentChange = coin!.percentChange;
    }

    return AnimatedContainer(
      duration: Duration.zero,
      color:
          _highlight ? Colors.green.withValues(alpha: 0.1) : Colors.transparent,
      child:
          coin != null
              ? ListTile(
                title: Text(coin.symbol),
                subtitle: Text('Price: ${coin.lastPrice.toStringAsFixed(2)}'),
                trailing: Text(
                  '${coin.percentChange >= 0 ? '+' : ''}${coin.percentChange.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: coin.percentChange >= 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              : const SizedBox(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
