import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poc/screens/order_book/order_book.dart';

class OrderBookTriangleView extends StatelessWidget {
  const OrderBookTriangleView({
    required this.bids,
    required this.asks,
    super.key,
  });

  final List<OrderBook> bids;
  final List<OrderBook> asks;

  @override
  Widget build(BuildContext context) {
    final reversedBids = bids.reversed.toList();
    final reversedAsks = asks.reversed.toList();

    final maxLength = max(reversedBids.length, reversedAsks.length);

    final bidVolume = reversedBids.fold<double>(
      0,
      (sum, e) => sum + e.quantity,
    );
    final askVolume = reversedAsks.fold<double>(
      0,
      (sum, e) => sum + e.quantity,
    );

    final bidCumulative = <double>[];
    double sumBid = 0;
    for (final b in reversedBids) {
      sumBid += b.quantity;
      bidCumulative.add(sumBid / bidVolume);
    }

    final askCumulative = <double>[];
    double sumAsk = 0;
    for (final a in reversedAsks) {
      sumAsk += a.quantity;
      askCumulative.add(sumAsk / askVolume);
    }

    return ListView.builder(
      itemCount: maxLength,
      itemBuilder: (context, index) {
        final bid = index < reversedBids.length ? reversedBids[index] : null;
        final ask = index < reversedAsks.length ? reversedAsks[index] : null;

        final bidBar =
            index < bidCumulative.length
                ? bidCumulative[index].clamp(0.0, 1.0)
                : 0.0;
        final askBar =
            index < askCumulative.length
                ? askCumulative[index].clamp(0.0, 1.0)
                : 0.0;

        return SizedBox(
          height: 32,
          child: Stack(
            children: [
              Row(
                children: [
                  // Bid bar (left)
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FractionallySizedBox(
                        widthFactor: bidBar,
                        alignment: Alignment.centerRight,
                        child: Container(
                          color: Colors.green.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                  ),
                  // Ask bar (right)
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: askBar,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          color: Colors.red.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // ✅ Bid: Qty | Price
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bid?.quantity.toStringAsFixed(4) ?? '',
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            bid?.price.toStringAsFixed(2) ?? '',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ✅ Ask: Price | Qty
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ask?.price.toStringAsFixed(2) ?? '',
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            ask?.quantity.toStringAsFixed(4) ?? '',
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
