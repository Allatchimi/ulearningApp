// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseLessonDetailControllerHash() =>
    r'94e200ce7039ef0ef4870d1ba75852e8672c7967';

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

/// See also [courseLessonDetailController].
@ProviderFor(courseLessonDetailController)
const courseLessonDetailControllerProvider =
    CourseLessonDetailControllerFamily();

/// See also [courseLessonDetailController].
class CourseLessonDetailControllerFamily
    extends Family<AsyncValue<List<LessonVideoItem>?>> {
  /// See also [courseLessonDetailController].
  const CourseLessonDetailControllerFamily();

  /// See also [courseLessonDetailController].
  CourseLessonDetailControllerProvider call({
    required int index,
  }) {
    return CourseLessonDetailControllerProvider(
      index: index,
    );
  }

  @override
  CourseLessonDetailControllerProvider getProviderOverride(
    covariant CourseLessonDetailControllerProvider provider,
  ) {
    return call(
      index: provider.index,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'courseLessonDetailControllerProvider';
}

/// See also [courseLessonDetailController].
class CourseLessonDetailControllerProvider
    extends AutoDisposeFutureProvider<List<LessonVideoItem>?> {
  /// See also [courseLessonDetailController].
  CourseLessonDetailControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => courseLessonDetailController(
            ref as CourseLessonDetailControllerRef,
            index: index,
          ),
          from: courseLessonDetailControllerProvider,
          name: r'courseLessonDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseLessonDetailControllerHash,
          dependencies: CourseLessonDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseLessonDetailControllerFamily._allTransitiveDependencies,
          index: index,
        );

  CourseLessonDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<List<LessonVideoItem>?> Function(
            CourseLessonDetailControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseLessonDetailControllerProvider._internal(
        (ref) => create(ref as CourseLessonDetailControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LessonVideoItem>?> createElement() {
    return _CourseLessonDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseLessonDetailControllerProvider &&
        other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CourseLessonDetailControllerRef
    on AutoDisposeFutureProviderRef<List<LessonVideoItem>?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _CourseLessonDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<LessonVideoItem>?>
    with CourseLessonDetailControllerRef {
  _CourseLessonDetailControllerProviderElement(super.provider);

  @override
  int get index => (origin as CourseLessonDetailControllerProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
