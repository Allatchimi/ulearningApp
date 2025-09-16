// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lessonVideosControllerHash() =>
    r'7ff98a9578b8051e0fe75300cb8d7b9f98419676';

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

/// See also [lessonVideosController].
@ProviderFor(lessonVideosController)
const lessonVideosControllerProvider = LessonVideosControllerFamily();

/// See also [lessonVideosController].
class LessonVideosControllerFamily
    extends Family<AsyncValue<List<LessonVideoItem>>> {
  /// See also [lessonVideosController].
  const LessonVideosControllerFamily();

  /// See also [lessonVideosController].
  LessonVideosControllerProvider call({
    required int lessonId,
  }) {
    return LessonVideosControllerProvider(
      lessonId: lessonId,
    );
  }

  @override
  LessonVideosControllerProvider getProviderOverride(
    covariant LessonVideosControllerProvider provider,
  ) {
    return call(
      lessonId: provider.lessonId,
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
  String? get name => r'lessonVideosControllerProvider';
}

/// See also [lessonVideosController].
class LessonVideosControllerProvider
    extends AutoDisposeFutureProvider<List<LessonVideoItem>> {
  /// See also [lessonVideosController].
  LessonVideosControllerProvider({
    required int lessonId,
  }) : this._internal(
          (ref) => lessonVideosController(
            ref as LessonVideosControllerRef,
            lessonId: lessonId,
          ),
          from: lessonVideosControllerProvider,
          name: r'lessonVideosControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lessonVideosControllerHash,
          dependencies: LessonVideosControllerFamily._dependencies,
          allTransitiveDependencies:
              LessonVideosControllerFamily._allTransitiveDependencies,
          lessonId: lessonId,
        );

  LessonVideosControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lessonId,
  }) : super.internal();

  final int lessonId;

  @override
  Override overrideWith(
    FutureOr<List<LessonVideoItem>> Function(LessonVideosControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LessonVideosControllerProvider._internal(
        (ref) => create(ref as LessonVideosControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lessonId: lessonId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LessonVideoItem>> createElement() {
    return _LessonVideosControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonVideosControllerProvider &&
        other.lessonId == lessonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lessonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LessonVideosControllerRef
    on AutoDisposeFutureProviderRef<List<LessonVideoItem>> {
  /// The parameter `lessonId` of this provider.
  int get lessonId;
}

class _LessonVideosControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<LessonVideoItem>>
    with LessonVideosControllerRef {
  _LessonVideosControllerProviderElement(super.provider);

  @override
  int get lessonId => (origin as LessonVideosControllerProvider).lessonId;
}

String _$currentVideoStateHash() => r'b8f176d66bb053cd70430064f4af4b274297ad13';

/// See also [CurrentVideoState].
@ProviderFor(CurrentVideoState)
final currentVideoStateProvider =
    AutoDisposeNotifierProvider<CurrentVideoState, CurrentVideo>.internal(
  CurrentVideoState.new,
  name: r'currentVideoStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentVideoStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentVideoState = AutoDisposeNotifier<CurrentVideo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
