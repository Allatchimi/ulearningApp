// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchCourseListHash() => r'96ebd8c6015d795d0d9c0675db9dd04f010550f2';

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

abstract class _$SearchCourseList
    extends BuildlessAutoDisposeAsyncNotifier<List<CourseItem>> {
  late final String keyword;

  FutureOr<List<CourseItem>> build(
    String keyword,
  );
}

/// See also [SearchCourseList].
@ProviderFor(SearchCourseList)
const searchCourseListProvider = SearchCourseListFamily();

/// See also [SearchCourseList].
class SearchCourseListFamily extends Family<AsyncValue<List<CourseItem>>> {
  /// See also [SearchCourseList].
  const SearchCourseListFamily();

  /// See also [SearchCourseList].
  SearchCourseListProvider call(
    String keyword,
  ) {
    return SearchCourseListProvider(
      keyword,
    );
  }

  @override
  SearchCourseListProvider getProviderOverride(
    covariant SearchCourseListProvider provider,
  ) {
    return call(
      provider.keyword,
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
  String? get name => r'searchCourseListProvider';
}

/// See also [SearchCourseList].
class SearchCourseListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchCourseList, List<CourseItem>> {
  /// See also [SearchCourseList].
  SearchCourseListProvider(
    String keyword,
  ) : this._internal(
          () => SearchCourseList()..keyword = keyword,
          from: searchCourseListProvider,
          name: r'searchCourseListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchCourseListHash,
          dependencies: SearchCourseListFamily._dependencies,
          allTransitiveDependencies:
              SearchCourseListFamily._allTransitiveDependencies,
          keyword: keyword,
        );

  SearchCourseListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyword,
  }) : super.internal();

  final String keyword;

  @override
  FutureOr<List<CourseItem>> runNotifierBuild(
    covariant SearchCourseList notifier,
  ) {
    return notifier.build(
      keyword,
    );
  }

  @override
  Override overrideWith(SearchCourseList Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchCourseListProvider._internal(
        () => create()..keyword = keyword,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        keyword: keyword,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchCourseList, List<CourseItem>>
      createElement() {
    return _SearchCourseListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchCourseListProvider && other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchCourseListRef
    on AutoDisposeAsyncNotifierProviderRef<List<CourseItem>> {
  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _SearchCourseListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchCourseList,
        List<CourseItem>> with SearchCourseListRef {
  _SearchCourseListProviderElement(super.provider);

  @override
  String get keyword => (origin as SearchCourseListProvider).keyword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
