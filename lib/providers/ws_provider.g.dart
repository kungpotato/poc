// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$smartWsHash() => r'200652d41a932c8036c7cc4941c0022024b96815';

/// See also [smartWs].
@ProviderFor(smartWs)
final smartWsProvider = Provider<SmartWebSocketService>.internal(
  smartWs,
  name: r'smartWsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$smartWsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SmartWsRef = ProviderRef<SmartWebSocketService>;
String _$wsEventHash() => r'e120d9099af960ab9921ef50927dadc9c8a7153f';

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
class WsEventFamily extends Family<Raw<Stream<dynamic>>> {
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
class WsEventProvider extends AutoDisposeProvider<Raw<Stream<dynamic>>> {
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
    Raw<Stream<dynamic>> Function(WsEventRef provider) create,
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
  AutoDisposeProviderElement<Raw<Stream<dynamic>>> createElement() {
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
mixin WsEventRef on AutoDisposeProviderRef<Raw<Stream<dynamic>>> {
  /// The parameter `eventType` of this provider.
  String get eventType;
}

class _WsEventProviderElement
    extends AutoDisposeProviderElement<Raw<Stream<dynamic>>>
    with WsEventRef {
  _WsEventProviderElement(super.provider);

  @override
  String get eventType => (origin as WsEventProvider).eventType;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
