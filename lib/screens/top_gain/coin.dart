import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.g.dart';

@JsonSerializable()
class BinanceCoin {
  BinanceCoin({
    required this.symbol,
    required this.lastPrice,
    required this.percentChange,
  });

  factory BinanceCoin.fromJson(Map<String, dynamic> json) =>
      _$BinanceCoinFromJson(json);

  @JsonKey(name: 's')
  final String symbol;
  @JsonKey(name: 'l', fromJson: double.parse)
  final double lastPrice;
  @JsonKey(name: 'P', fromJson: double.parse)
  final double percentChange;

  Map<String, dynamic> toJson() => _$BinanceCoinToJson(this);
}
