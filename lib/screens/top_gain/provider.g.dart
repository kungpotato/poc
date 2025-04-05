// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topGainerOrderHash() => r'54a36abb18b14a22419594d33e9e00c06c301752';

/// See also [topGainerOrder].
@ProviderFor(topGainerOrder)
final topGainerOrderProvider = AutoDisposeProvider<List<String>>.internal(
  topGainerOrder,
  name: r'topGainerOrderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$topGainerOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TopGainerOrderRef = AutoDisposeProviderRef<List<String>>;
String _$binanceCoinHash() => r'dab309dbe2fd9b39c385fc2646dc2a9c44e28bf9';

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

/// See also [binanceCoin].
@ProviderFor(binanceCoin)
const binanceCoinProvider = BinanceCoinFamily();

/// See also [binanceCoin].
class BinanceCoinFamily extends Family<BinanceCoin?> {
  /// See also [binanceCoin].
  const BinanceCoinFamily();

  /// See also [binanceCoin].
  BinanceCoinProvider call(String symbol) {
    return BinanceCoinProvider(symbol);
  }

  @override
  BinanceCoinProvider getProviderOverride(
    covariant BinanceCoinProvider provider,
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
  String? get name => r'binanceCoinProvider';
}

/// See also [binanceCoin].
class BinanceCoinProvider extends AutoDisposeProvider<BinanceCoin?> {
  /// See also [binanceCoin].
  BinanceCoinProvider(String symbol)
    : this._internal(
        (ref) => binanceCoin(ref as BinanceCoinRef, symbol),
        from: binanceCoinProvider,
        name: r'binanceCoinProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$binanceCoinHash,
        dependencies: BinanceCoinFamily._dependencies,
        allTransitiveDependencies: BinanceCoinFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  BinanceCoinProvider._internal(
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
  Override overrideWith(BinanceCoin? Function(BinanceCoinRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: BinanceCoinProvider._internal(
        (ref) => create(ref as BinanceCoinRef),
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
  AutoDisposeProviderElement<BinanceCoin?> createElement() {
    return _BinanceCoinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BinanceCoinProvider && other.symbol == symbol;
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
mixin BinanceCoinRef on AutoDisposeProviderRef<BinanceCoin?> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _BinanceCoinProviderElement
    extends AutoDisposeProviderElement<BinanceCoin?>
    with BinanceCoinRef {
  _BinanceCoinProviderElement(super.provider);

  @override
  String get symbol => (origin as BinanceCoinProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
