import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_constants.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../dashboard/data/providers/storage_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // Disable swipe
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  _buildPage1(context),
                  _buildPage3(context, ref), // Permissions is now second
                  _buildPage2(context), // Features is now third
                ],
              ),
            ),
            // Bottom Indicator & Action Area
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  top: BorderSide(
                    color: AppColors.border.withValues(alpha: 0.5),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dot Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.primary
                              : AppColors.primary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),
                  if (_currentPage == 0)
                    AppButton(
                      text: 'Next',
                      isFullWidth: true,
                      onPressed: _nextPage,
                    )
                  else if (_currentPage == 1)
                    AppButton(
                      text: 'Grant Permission',
                      isFullWidth: true,
                      onPressed: () => _requestPermission(context, ref),
                    )
                  else
                    AppButton(
                      text: 'Get Started',
                      isFullWidth: true,
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () => _finishOnboarding(context, ref),
                    ),
                  const Gap(16),
                  const Text(
                    'By continuing, you agree to our Terms of Service & Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.cleaning_services_rounded,
                size: 80,
                color: AppColors.primary,
              ),
            ),
          ),
          const Gap(40),
          Text(
            'Clear Space',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(16),
          Text(
            'Welcome to the smartest way to keep your device clean, fast, and secure.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(40),
          Text(
            'Powerful Features',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(12),
          Text(
            'Everything you need to manage your storage efficiently.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
          const Gap(40),
          _buildFeatureItem(
            context,
            icon: Icons.pie_chart_rounded,
            color: AppColors.primary,
            title: 'Understand your storage',
            description:
                'Get a clear visual breakdown of what\'s taking up space.',
          ),
          const Gap(16),
          _buildFeatureItem(
            context,
            icon: Icons.security_rounded,
            color: AppColors.success,
            title: 'Clean safely',
            description:
                'Remove unnecessary files with safe deletion protocols.',
          ),
          const Gap(16),
          _buildFeatureItem(
            context,
            icon: Icons.rocket_launch_rounded,
            color: AppColors.purple,
            title: 'Free up space',
            description:
                'Instantly find and remove junk, large files, and duplicates.',
          ),
          const Gap(40),
        ],
      ),
    );
  }

  Widget _buildPage3(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.orange.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shield_outlined,
              size: 64,
              color: AppColors.orange,
            ),
          ),
          const Gap(32),
          Text(
            'Storage Access Required',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          Text(
            'Clear Space needs "All files access" to scan your device for duplicates, large files, and junk files.\n\nYou will be directed to System Settings to grant this permission when you tap Grant Permission.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Gap(4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _requestPermission(BuildContext context, WidgetRef ref) async {
    try {
      final repo = await ref.read(storageRepositoryProvider.future);
      // Request permissions immediately
      await repo.requestPermissions();
    } catch (_) {}

    if (mounted) {
      _nextPage();
    }
  }

  Future<void> _finishOnboarding(BuildContext context, WidgetRef ref) async {
    try {
      final settings = ref.read(appSettingsServiceProvider);
      await settings.setOnboardingCompleted(true);

      if (context.mounted) {
        context.go(RouteConstants.dashboard);
      }
    } catch (e) {
      if (context.mounted) {
        context.go(RouteConstants.dashboard);
      }
    }
  }
}
