import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Centralized route path constants to avoid magic strings.
abstract class RouteConstants {
  static const String dashboard = '/dashboard';
  static const String cleanup = '/cleanup';
  static const String photos = '/photos';
  static const String files = '/files';
  static const String apps = '/apps';

  // Non-tab routes
  static const String contacts = '/contacts';
  static const String settings = '/settings';
  static const String duplicates = '/cleanup/duplicates';
  static const String largeFiles = '/cleanup/large-files';
  static const String smartCleanup = '/cleanup/smart';
  static const String junkFiles = '/cleanup/junk';
  static const String onboarding = '/onboarding';
  static const String smartDetail = '/smart-detail';
}

/// 404 Not Found Screen for unknown routes.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              '404 - Page Not Found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text('The page you are looking for does not exist.'),
            const SizedBox(height: 24),
            FilledButton(
              // [A8] Safely navigate to dashboard instead of pop (which fails at root)
              onPressed: () => context.go(RouteConstants.dashboard),
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
