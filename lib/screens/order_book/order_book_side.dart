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

  Widget _buildTooltip(_OrderBookData data, bool isBid) {
    const rowHeight = 32.0;
    final index = (fingerPosition!.dy / rowHeight).floor();

    final cumulative =
        isBid
            ? data.reversedBids
                .take(index + 1)
                .fold<double>(0, (sum, b) => sum + b.quantity)
            : data.reversedAsks
                .take(index + 1)
                .fold<double>(0, (sum, a) => sum + a.quantity);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final left = min(fingerPosition!.dx + 8, screenWidth - 140);
    final top = max<double>(0, min(fingerPosition!.dy - 60, screenHeight - 60));

    return Positioned(
      left: left,
      top: top,
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // กล่อง tooltip
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${isBid ? 'Bid' : 'Ask'} Sum: ${cumulative.toStringAsFixed(4)}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            // หางสามเหลี่ยมตรงกลาง
            Center(
              child: CustomPaint(
                size: const Size(20, 10),
                painter: TooltipTrianglePainter(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _OrderBookData.from(widget.bids, widget.asks);
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
            itemCount: data.maxLength,
            itemBuilder: (context, index) {
              final bid =
                  index < data.reversedBids.length
                      ? data.reversedBids[index]
                      : null;
              final ask =
                  index < data.reversedAsks.length
                      ? data.reversedAsks[index]
                      : null;
              final bidBar =
                  index < data.bidCumulative.length
                      ? data.bidCumulative[index]
                      : 0.0;
              final askBar =
                  index < data.askCumulative.length
                      ? data.askCumulative[index]
                      : 0.0;

              return OrderBookRow(
                bid: bid,
                ask: ask,
                bidBar: bidBar,
                askBar: askBar,
              );
            },
          ),
          if (fingerPosition != null) ...[
            CustomPaint(
              size: Size.infinite,
              painter: TooltipLinePainter(
                position: fingerPosition!,
                isBidSide: isBid,
                maxRow: data.maxLength,
              ),
            ),
            _buildTooltip(data, isBid),
          ],
        ],
      ),
    );
  }
}

class TooltipTrianglePainter extends CustomPainter {
  TooltipTrianglePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path =
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width / 2, size.height)
          ..lineTo(size.width, 0)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TooltipTrianglePainter oldDelegate) => false;
}

class OrderBookRow extends StatelessWidget {
  const OrderBookRow({
    required this.bid,
    required this.ask,
    required this.bidBar,
    required this.askBar,
    super.key,
  });

  final OrderBook? bid;
  final OrderBook? ask;
  final double bidBar;
  final double askBar;

  @override
  Widget build(BuildContext context) {
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
                    child: Container(color: Colors.red.withValues(alpha: 0.2)),
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
                      Text(bid?.quantity.toStringAsFixed(4) ?? ''),
                      Text(
                        bid?.price.toStringAsFixed(2) ?? '',
                        style: const TextStyle(color: Colors.green),
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
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text(ask?.quantity.toStringAsFixed(4) ?? ''),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TooltipLinePainter extends CustomPainter {
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

    // Determine rectangle position
    final double rectTop = index * rowHeight;
    final double overlayHeight = size.height - rectTop;

    final Rect rect =
        isBidSide
            ? Rect.fromLTWH(
              0,
              0,
              size.width / 2,
              rectTop + rowHeight,
            ) // top to hovered row
            : Rect.fromLTWH(
              size.width / 2,
              rectTop,
              size.width / 2,
              overlayHeight, // hovered row to bottom
            );

    final overlayPaint = Paint()..color = Colors.black.withOpacity(0.1);

    canvas.drawRect(rect, overlayPaint);

    // Draw dashed line at hovered row
    final double dashedY = rectTop;

    final dashPaint =
        Paint()
          ..color = Colors.grey.withOpacity(0.3)
          ..strokeWidth = 2;

    const dashWidth = 4.0;
    const dashSpace = 1.0;

    double startX = isBidSide ? 0 : size.width / 2;
    final double endX = isBidSide ? size.width / 2 : size.width;

    while (startX < endX) {
      if (!isBidSide) {
        canvas.drawLine(
          Offset(startX, dashedY),
          Offset(startX + dashWidth, dashedY),
          dashPaint,
        );
      } else {
        canvas.drawLine(
          Offset(startX, dashedY + rowHeight),
          Offset(startX + dashWidth, dashedY + rowHeight),
          dashPaint,
        );
      }
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant TooltipLinePainter oldDelegate) {
    return oldDelegate.position != position ||
        oldDelegate.isBidSide != isBidSide;
  }
}

class _OrderBookData {
  _OrderBookData({
    required this.reversedBids,
    required this.reversedAsks,
    required this.bidCumulative,
    required this.askCumulative,
    required this.maxLength,
  });

  factory _OrderBookData.from(List<OrderBook> bids, List<OrderBook> asks) {
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

    return _OrderBookData(
      reversedBids: reversedBids,
      reversedAsks: reversedAsks,
      bidCumulative: bidCumulative,
      askCumulative: askCumulative,
      maxLength: maxLength,
    );
  }

  final List<OrderBook> reversedBids;
  final List<OrderBook> reversedAsks;
  final List<double> bidCumulative;
  final List<double> askCumulative;
  final int maxLength;
}
