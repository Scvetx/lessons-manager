// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_init_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appInitHash() => r'c709556702a346cc4d7c9b033da5ebdbd2d7aab2';

/// Provider which runc an async operation for:
/// - Initializing Firebase instance.
/// - Initializing providers before running the app
///   (push notifications, router provider etc).
/// - Initializing local database
///   (Hive and other local databases which will be used).
///
/// Copied from [appInit].
@ProviderFor(appInit)
final appInitProvider = FutureProvider<void>.internal(
  appInit,
  name: r'appInitProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appInitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppInitRef = FutureProviderRef<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
