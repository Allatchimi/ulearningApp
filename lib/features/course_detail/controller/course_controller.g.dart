// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseDetailControllerHash() =>
    r'f5e753acfc55d504d5daf9c170db0957e6e97076';

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

/// See also [courseDetailController].
@ProviderFor(courseDetailController)
const courseDetailControllerProvider = CourseDetailControllerFamily();

/// See also [courseDetailController].
class CourseDetailControllerFamily extends Family<AsyncValue<CourseItem?>> {
  /// See also [courseDetailController].
  const CourseDetailControllerFamily();

  /// See also [courseDetailController].
  CourseDetailControllerProvider call({
    required int index,
  }) {
    return CourseDetailControllerProvider(
      index: index,
    );
  }

  @override
  CourseDetailControllerProvider getProviderOverride(
    covariant CourseDetailControllerProvider provider,
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
  String? get name => r'courseDetailControllerProvider';
}

/// See also [courseDetailController].
class CourseDetailControllerProvider
    extends AutoDisposeFutureProvider<CourseItem?> {
  /// See also [courseDetailController].
  CourseDetailControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => courseDetailController(
            ref as CourseDetailControllerRef,
            index: index,
          ),
          from: courseDetailControllerProvider,
          name: r'courseDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseDetailControllerHash,
          dependencies: CourseDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseDetailControllerFamily._allTransitiveDependencies,
          index: index,
        );

  CourseDetailControllerProvider._internal(
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
    FutureOr<CourseItem?> Function(CourseDetailControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseDetailControllerProvider._internal(
        (ref) => create(ref as CourseDetailControllerRef),
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
  AutoDisposeFutureProviderElement<CourseItem?> createElement() {
    return _CourseDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseDetailControllerProvider && other.index == index;
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
mixin CourseDetailControllerRef on AutoDisposeFutureProviderRef<CourseItem?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _CourseDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<CourseItem?>
    with CourseDetailControllerRef {
  _CourseDetailControllerProviderElement(super.provider);

  @override
  int get index => (origin as CourseDetailControllerProvider).index;
}

String _$courseLessonListControllerHash() =>
    r'281f5387e50c20a5f04a2353e6c63e203ed26a70';

/// See also [courseLessonListController].
@ProviderFor(courseLessonListController)
const courseLessonListControllerProvider = CourseLessonListControllerFamily();

/// See also [courseLessonListController].
class CourseLessonListControllerFamily
    extends Family<AsyncValue<List<Lesson>?>> {
  /// See also [courseLessonListController].
  const CourseLessonListControllerFamily();

  /// See also [courseLessonListController].
  CourseLessonListControllerProvider call({
    required int index,
  }) {
    return CourseLessonListControllerProvider(
      index: index,
    );
  }

  @override
  CourseLessonListControllerProvider getProviderOverride(
    covariant CourseLessonListControllerProvider provider,
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
  String? get name => r'courseLessonListControllerProvider';
}

/// See also [courseLessonListController].
class CourseLessonListControllerProvider
    extends AutoDisposeFutureProvider<List<Lesson>?> {
  /// See also [courseLessonListController].
  CourseLessonListControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => courseLessonListController(
            ref as CourseLessonListControllerRef,
            index: index,
          ),
          from: courseLessonListControllerProvider,
          name: r'courseLessonListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseLessonListControllerHash,
          dependencies: CourseLessonListControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseLessonListControllerFamily._allTransitiveDependencies,
          index: index,
        );

  CourseLessonListControllerProvider._internal(
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
    FutureOr<List<Lesson>?> Function(CourseLessonListControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseLessonListControllerProvider._internal(
        (ref) => create(ref as CourseLessonListControllerRef),
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
  AutoDisposeFutureProviderElement<List<Lesson>?> createElement() {
    return _CourseLessonListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseLessonListControllerProvider && other.index == index;
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
mixin CourseLessonListControllerRef
    on AutoDisposeFutureProviderRef<List<Lesson>?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _CourseLessonListControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<Lesson>?>
    with CourseLessonListControllerRef {
  _CourseLessonListControllerProviderElement(super.provider);

  @override
  int get index => (origin as CourseLessonListControllerProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
