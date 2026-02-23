import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Global error handling — sync errors (widget build, layout, painting)
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      // TODO: Log to crashlytics or similar service
    }
  };

  // [A12] Async error handling — PlatformExceptions, unhandled Future errors
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('[AsyncError] $error');
    debugPrint('[AsyncError] $stack');
    if (kReleaseMode) {
      // TODO: Log to crashlytics or similar service
    }
    return true; // Prevent crash
  };

  runApp(
    ProviderScope(
      observers: kDebugMode ? [_RiverpodLogger()] : [],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Storage Dashboard',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Debug logger for Riverpod state changes.
class _RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('''
[Riverpod] Provider Updated
  provider: ${provider.name ?? provider.runtimeType}
  newValue: $newValue
''');
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    debugPrint(
      '[Riverpod] Provider Added: ${provider.name ?? provider.runtimeType}',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    debugPrint(
      '[Riverpod] Provider Disposed: ${provider.name ?? provider.runtimeType}',
    );
  }
}
