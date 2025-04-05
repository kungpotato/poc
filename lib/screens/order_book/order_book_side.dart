import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poc/screens/order_book/order_book.dart';

class InteractiveOrderBookTriangleView extends StatefulWidget {
  const InteractiveOrderBookTriangleView({
    required this.bids,
    required this.asks,
    super.key,
  });

  final List<OrderBook> bids;
  final List<OrderBook> asks;

  @override
  State<InteractiveOrderBookTriangleView> createState() =>
      _InteractiveOrderBookTriangleViewState();
}

class _InteractiveOrderBookTriangleViewState
    extends State<InteractiveOrderBookTriangleView> {
  Offset? fingerPosition;

  @override
  Widget build(BuildContext context) {
    final reversedBids = widget.bids.reversed.toList();
    final reversedAsks = widget.asks.reversed.toList();
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

    final isBid =
        (fingerPosition?.dx ?? 0) < MediaQuery.of(context).size.width / 2;

    return GestureDetector(
      onLongPressStart:
          (details) => setState(() => fingerPosition = details.localPosition),
      onLongPressMoveUpdate:
          (details) => setState(() => fingerPosition = details.localPosition),
      onLongPressEnd: (_) => setState(() => fingerPosition = null),
      child: Stack(
        children: [
          ListView.builder(
            itemCount: maxLength,
            itemBuilder: (context, index) {
              final bid =
                  index < reversedBids.length ? reversedBids[index] : null;
              final ask =
                  index < reversedAsks.length ? reversedAsks[index] : null;
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
          ),

          if (fingerPosition != null) ...[
            CustomPaint(
              size: Size.infinite,
              painter: TooltipLinePainter(
                position: fingerPosition!,
                isBidSide: isBid,
                maxRow: maxLength,
              ),
            ),
            Positioned(
              left: () {
                final screenWidth = MediaQuery.of(context).size.width;
                const tooltipWidth = 120.0;
                return min(fingerPosition!.dx + 8, screenWidth - tooltipWidth);
              }(),
              top: () {
                final screenHeight = MediaQuery.of(context).size.height;
                const tooltipHeight = 40.0;
                return max(
                  0,
                  min(fingerPosition!.dy - 40, screenHeight - tooltipHeight),
                ).toDouble();
              }(),
              child: Material(
                elevation: 4,
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Builder(
                    builder: (_) {
                      const rowHeight = 32.0;
                      final index = (fingerPosition!.dy / rowHeight).floor();
                      final isBid =
                          fingerPosition!.dx <
                          MediaQuery.of(context).size.width / 2;

                      final cumulative =
                          isBid
                              ? reversedBids
                                  .take(index + 1)
                                  .fold<double>(0, (sum, b) => sum + b.quantity)
                              : reversedAsks
                                  .take(index + 1)
                                  .fold<double>(
                                    0,
                                    (sum, a) => sum + a.quantity,
                                  );

                      return Text(
                        '${isBid ? 'Bid' : 'Ask'} Sum: ${cumulative.toStringAsFixed(4)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class TooltipLinePainter extends CustomPainter {
  // true = Bid, false = Ask

  TooltipLinePainter({
    required this.position,
    required this.maxRow,
    required this.isBidSide,
    this.rowHeight = 32.0,
  });

  final Offset position;
  final double rowHeight;
  final int maxRow;
  final bool isBidSide;

  @override
  void paint(Canvas canvas, Size size) {
    final index = (position.dy / rowHeight).floor().clamp(0, maxRow - 1);
    final overlayHeight = (index + 1) * rowHeight;

    final rect = Rect.fromLTWH(
      isBidSide ? 0 : size.width / 2,
      0,
      size.width / 2,
      overlayHeight,
    );

    final overlayPaint = Paint()..color = Colors.black.withValues(alpha: 0.1);

    canvas.drawRect(rect, overlayPaint);

    final dashedY = index * rowHeight;
    final dashPaint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.3)
          ..strokeWidth = 1;
    const dashWidth = 4.0;
    const dashSpace = 4.0;

    double startX = isBidSide ? 0 : size.width / 2;
    final endX = isBidSide ? size.width / 2 : size.width;

    while (startX < endX) {
      canvas.drawLine(
        Offset(startX, dashedY),
        Offset(startX + dashWidth, dashedY),
        dashPaint,
      );
      canvas.drawLine(
        Offset(startX, dashedY + rowHeight),
        Offset(startX + dashWidth, dashedY + rowHeight),
        dashPaint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant TooltipLinePainter oldDelegate) {
    return oldDelegate.position != position ||
        oldDelegate.isBidSide != isBidSide;
  }
}
