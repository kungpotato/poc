// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BinanceCoin _$BinanceCoinFromJson(Map<String, dynamic> json) => BinanceCoin(
  symbol: json['s'] as String,
  lastPrice: double.parse(json['l'] as String),
  percentChange: double.parse(json['P'] as String),
);

Map<String, dynamic> _$BinanceCoinToJson(BinanceCoin instance) =>
    <String, dynamic>{
      's': instance.symbol,
      'l': instance.lastPrice,
      'P': instance.percentChange,
    };
