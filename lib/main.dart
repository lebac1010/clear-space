import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

import 'core/ads/ad_service.dart';
import 'core/theme/app_theme.dart';
import 'core/services/app_settings_service.dart';
import 'core/router/app_router.dart';
import 'features/dashboard/data/providers/storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load SharedPreferences synchronously before app starts
  // This ensures router has immediate access to onboarding state
  final prefs = await SharedPreferences.getInstance();
  await AppAdService.instance.initialize();

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
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final locale = ref.watch(localeControllerProvider);
    final themeMode = ref.watch(themeModeControllerProvider);

    return MaterialApp.router(
      routerConfig: router,
      onGenerateTitle: (context) =>
          AppLocalizations.of(context)?.appTitle ?? 'Clear Space',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
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
