// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinWsHash() => r'4f04abe60b95d4611f4af76a3a2e94d4a19c59c9';

/// See also [coinWs].
@ProviderFor(coinWs)
final coinWsProvider = Provider<SmartWebSocketService>.internal(
  coinWs,
  name: r'coinWsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$coinWsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CoinWsRef = ProviderRef<SmartWebSocketService>;
String _$binanceMarketWsHash() => r'ed4a2ef5f19ffb46c3de0ad493566d3dff7e5c95';

/// See also [binanceMarketWs].
@ProviderFor(binanceMarketWs)
final binanceMarketWsProvider = Provider<SmartWebSocketService>.internal(
  binanceMarketWs,
  name: r'binanceMarketWsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$binanceMarketWsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BinanceMarketWsRef = ProviderRef<SmartWebSocketService>;
String _$binanceDepthWsHash() => r'88e09299137b09a96ab5d181975d3ef63a21f7f9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [binanceDepthWs].
@ProviderFor(binanceDepthWs)
const binanceDepthWsProvider = BinanceDepthWsFamily();

/// See also [binanceDepthWs].
class BinanceDepthWsFamily extends Family<SmartWebSocketService> {
  /// See also [binanceDepthWs].
  const BinanceDepthWsFamily();

  /// See also [binanceDepthWs].
  BinanceDepthWsProvider call(String symbol) {
    return BinanceDepthWsProvider(symbol);
  }

  @override
  BinanceDepthWsProvider getProviderOverride(
    covariant BinanceDepthWsProvider provider,
  ) {
    return call(provider.symbol);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'binanceDepthWsProvider';
}

/// See also [binanceDepthWs].
class BinanceDepthWsProvider
    extends AutoDisposeProvider<SmartWebSocketService> {
  /// See also [binanceDepthWs].
  BinanceDepthWsProvider(String symbol)
    : this._internal(
        (ref) => binanceDepthWs(ref as BinanceDepthWsRef, symbol),
        from: binanceDepthWsProvider,
        name: r'binanceDepthWsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$binanceDepthWsHash,
        dependencies: BinanceDepthWsFamily._dependencies,
        allTransitiveDependencies:
            BinanceDepthWsFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  BinanceDepthWsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.symbol,
  }) : super.internal();

  final String symbol;

  @override
  Override overrideWith(
    SmartWebSocketService Function(BinanceDepthWsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BinanceDepthWsProvider._internal(
        (ref) => create(ref as BinanceDepthWsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        symbol: symbol,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<SmartWebSocketService> createElement() {
    return _BinanceDepthWsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BinanceDepthWsProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BinanceDepthWsRef on AutoDisposeProviderRef<SmartWebSocketService> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _BinanceDepthWsProviderElement
    extends AutoDisposeProviderElement<SmartWebSocketService>
    with BinanceDepthWsRef {
  _BinanceDepthWsProviderElement(super.provider);

  @override
  String get symbol => (origin as BinanceDepthWsProvider).symbol;
}

String _$wsEventHash() => r'2e8ff6d3b2602d5960aaeac7cdef7e1c6397b6cc';

/// See also [wsEvent].
@ProviderFor(wsEvent)
const wsEventProvider = WsEventFamily();

/// See also [wsEvent].
class WsEventFamily extends Family<Raw<Stream<List<KpCoin>>>> {
  /// See also [wsEvent].
  const WsEventFamily();

  /// See also [wsEvent].
  WsEventProvider call(String eventType) {
    return WsEventProvider(eventType);
  }

  @override
  WsEventProvider getProviderOverride(covariant WsEventProvider provider) {
    return call(provider.eventType);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'wsEventProvider';
}

/// See also [wsEvent].
class WsEventProvider extends AutoDisposeProvider<Raw<Stream<List<KpCoin>>>> {
  /// See also [wsEvent].
  WsEventProvider(String eventType)
    : this._internal(
        (ref) => wsEvent(ref as WsEventRef, eventType),
        from: wsEventProvider,
        name: r'wsEventProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$wsEventHash,
        dependencies: WsEventFamily._dependencies,
        allTransitiveDependencies: WsEventFamily._allTransitiveDependencies,
        eventType: eventType,
      );

  WsEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventType,
  }) : super.internal();

  final String eventType;

  @override
  Override overrideWith(
    Raw<Stream<List<KpCoin>>> Function(WsEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WsEventProvider._internal(
        (ref) => create(ref as WsEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventType: eventType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Raw<Stream<List<KpCoin>>>> createElement() {
    return _WsEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WsEventProvider && other.eventType == eventType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WsEventRef on AutoDisposeProviderRef<Raw<Stream<List<KpCoin>>>> {
  /// The parameter `eventType` of this provider.
  String get eventType;
}

class _WsEventProviderElement
    extends AutoDisposeProviderElement<Raw<Stream<List<KpCoin>>>>
    with WsEventRef {
  _WsEventProviderElement(super.provider);

  @override
  String get eventType => (origin as WsEventProvider).eventType;
}

String _$binanceCoinMapHash() => r'71035bb55d56ad0ac35396cab9dcc966186d5a9e';

/// See also [binanceCoinMap].
@ProviderFor(binanceCoinMap)
final binanceCoinMapProvider =
    AutoDisposeStreamProvider<Map<String, BinanceCoin>>.internal(
      binanceCoinMap,
      name: r'binanceCoinMapProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$binanceCoinMapHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BinanceCoinMapRef =
    AutoDisposeStreamProviderRef<Map<String, BinanceCoin>>;
String _$orderBookHash() => r'631ba77c72729c1ced8e14577e5d5fb22523fac4';

/// See also [orderBook].
@ProviderFor(orderBook)
const orderBookProvider = OrderBookFamily();

/// See also [orderBook].
class OrderBookFamily extends Family<AsyncValue<OrderBookSnapshot>> {
  /// See also [orderBook].
  const OrderBookFamily();

  /// See also [orderBook].
  OrderBookProvider call(String symbol) {
    return OrderBookProvider(symbol);
  }

  @override
  OrderBookProvider getProviderOverride(covariant OrderBookProvider provider) {
    return call(provider.symbol);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderBookProvider';
}

/// See also [orderBook].
class OrderBookProvider extends AutoDisposeStreamProvider<OrderBookSnapshot> {
  /// See also [orderBook].
  OrderBookProvider(String symbol)
    : this._internal(
        (ref) => orderBook(ref as OrderBookRef, symbol),
        from: orderBookProvider,
        name: r'orderBookProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$orderBookHash,
        dependencies: OrderBookFamily._dependencies,
        allTransitiveDependencies: OrderBookFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  OrderBookProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.symbol,
  }) : super.internal();

  final String symbol;

  @override
  Override overrideWith(
    Stream<OrderBookSnapshot> Function(OrderBookRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OrderBookProvider._internal(
        (ref) => create(ref as OrderBookRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        symbol: symbol,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<OrderBookSnapshot> createElement() {
    return _OrderBookProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderBookProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OrderBookRef on AutoDisposeStreamProviderRef<OrderBookSnapshot> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _OrderBookProviderElement
    extends AutoDisposeStreamProviderElement<OrderBookSnapshot>
    with OrderBookRef {
  _OrderBookProviderElement(super.provider);

  @override
  String get symbol => (origin as OrderBookProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
