import 'package:k_chart_plus/k_chart_plus.dart';

class OrderBook {
  OrderBook({required this.price, required this.quantity});

  factory OrderBook.fromJson(List<dynamic> json) {
    return OrderBook(
      price: double.parse(json[0] as String),
      quantity: double.parse(json[1] as String),
    );
  }

  double price;
  double quantity;
}

class OrderBookSnapshot {
  OrderBookSnapshot({
    required this.lastUpdateId,
    required this.bids,
    required this.asks,
  });

  factory OrderBookSnapshot.fromJson(Map<String, dynamic> json) {
    return OrderBookSnapshot(
      lastUpdateId: json['lastUpdateId'] as int,
      bids:
          (json['bids'] as List)
              .map((e) => OrderBook.fromJson(e as List))
              .toList(),
      asks:
          (json['asks'] as List)
              .map((e) => OrderBook.fromJson(e as List))
              .toList(),
    );
  }

  final int lastUpdateId;
  final List<OrderBook> bids;
  final List<OrderBook> asks;
}

extension DepthEntityUtils on List<OrderBook> {
  List<DepthEntity> get toDepthBids {
    final List<DepthEntity> bids = [];
    double amount = 0;
    final newBids = [...this];
    newBids.sort((left, right) => left.price.compareTo(right.price));
    for (final item in newBids) {
      amount += item.quantity;
      item.quantity = amount;
      bids.insert(0, DepthEntity(item.price, item.quantity));
    }
    return bids;
  }

  List<DepthEntity> get toDepthAsks {
    final List<DepthEntity> asks = [];
    double amount = 0;
    final newAsks = [...this];
    amount = 0.0;
    newAsks.sort((left, right) => left.price.compareTo(right.price));
    for (final item in newAsks.reversed) {
      amount += item.quantity;
      item.quantity = amount;
      asks.add(DepthEntity(item.price, item.quantity));
    }
    return asks;
  }
}
