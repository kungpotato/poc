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
String _$wsEventHash() => r'2e8ff6d3b2602d5960aaeac7cdef7e1c6397b6cc';

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

String _$binanceCoinMapHash() => r'e2bb14eb573b62b10e3b19a9b0637b95f816991b';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
