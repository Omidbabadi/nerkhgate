// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_adapter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pricesAdapterHash() => r'f1962e91dbb946962fa81531236ebacf89613c58';

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

abstract class _$PricesAdapter
    extends BuildlessAutoDisposeNotifier<PricesState> {
  late final GlobalKey<State<StatefulWidget>>? familyKey;

  PricesState build([GlobalKey<State<StatefulWidget>>? familyKey]);
}

/// See also [PricesAdapter].
@ProviderFor(PricesAdapter)
const pricesAdapterProvider = PricesAdapterFamily();

/// See also [PricesAdapter].
class PricesAdapterFamily extends Family<PricesState> {
  /// See also [PricesAdapter].
  const PricesAdapterFamily();

  /// See also [PricesAdapter].
  PricesAdapterProvider call([GlobalKey<State<StatefulWidget>>? familyKey]) {
    return PricesAdapterProvider(familyKey);
  }

  @override
  PricesAdapterProvider getProviderOverride(
    covariant PricesAdapterProvider provider,
  ) {
    return call(provider.familyKey);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pricesAdapterProvider';
}

/// See also [PricesAdapter].
class PricesAdapterProvider
    extends AutoDisposeNotifierProviderImpl<PricesAdapter, PricesState> {
  /// See also [PricesAdapter].
  PricesAdapterProvider([GlobalKey<State<StatefulWidget>>? familyKey])
    : this._internal(
        () => PricesAdapter()..familyKey = familyKey,
        from: pricesAdapterProvider,
        name: r'pricesAdapterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pricesAdapterHash,
        dependencies: PricesAdapterFamily._dependencies,
        allTransitiveDependencies:
            PricesAdapterFamily._allTransitiveDependencies,
        familyKey: familyKey,
      );

  PricesAdapterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.familyKey,
  }) : super.internal();

  final GlobalKey<State<StatefulWidget>>? familyKey;

  @override
  PricesState runNotifierBuild(covariant PricesAdapter notifier) {
    return notifier.build(familyKey);
  }

  @override
  Override overrideWith(PricesAdapter Function() create) {
    return ProviderOverride(
      origin: this,
      override: PricesAdapterProvider._internal(
        () => create()..familyKey = familyKey,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        familyKey: familyKey,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PricesAdapter, PricesState>
  createElement() {
    return _PricesAdapterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PricesAdapterProvider && other.familyKey == familyKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, familyKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PricesAdapterRef on AutoDisposeNotifierProviderRef<PricesState> {
  /// The parameter `familyKey` of this provider.
  GlobalKey<State<StatefulWidget>>? get familyKey;
}

class _PricesAdapterProviderElement
    extends AutoDisposeNotifierProviderElement<PricesAdapter, PricesState>
    with PricesAdapterRef {
  _PricesAdapterProviderElement(super.provider);

  @override
  GlobalKey<State<StatefulWidget>>? get familyKey =>
      (origin as PricesAdapterProvider).familyKey;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
