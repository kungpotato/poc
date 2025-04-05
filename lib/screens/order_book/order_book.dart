class OrderBook {
  OrderBook({required this.price, required this.quantity});

  factory OrderBook.fromJson(List<dynamic> json) {
    return OrderBook(
      price: double.parse(json[0] as String),
      quantity: double.parse(json[1] as String),
    );
  }

  final double price;
  final double quantity;
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
