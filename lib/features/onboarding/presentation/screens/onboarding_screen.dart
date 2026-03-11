import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';

import '../../../../core/extensions/build_context_x.dart';
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: context.appBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(), // Disable swipe
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  _buildPage1(context, l10n),
                  _buildPage3(context, ref, l10n), // Permissions is now second
                  _buildPage2(context, l10n), // Features is now third
                ],
              ),
            ),
            // Bottom Indicator & Action Area
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.appSurface,
                border: Border(
                  top: BorderSide(
                    color: context.appBorder.withValues(alpha: 0.5),
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
                  Text(
                    l10n.termsDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: context.appTextTertiary,
                    ),
                  ),
                  const Gap(16),
                  if (_currentPage == 0)
                    AppButton(
                      text: l10n.next,
                      isFullWidth: true,
                      onPressed: _nextPage,
                    )
                  else if (_currentPage == 1)
                    AppButton(
                      text: l10n.grantPermission,
                      isFullWidth: true,
                      onPressed: () => _requestPermission(context, ref),
                    )
                  else
                    AppButton(
                      text: l10n.getStarted,
                      isFullWidth: true,
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () => _finishOnboarding(context, ref),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage1(BuildContext context, AppLocalizations l10n) {
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
            child: Center(
              child: Icon(
                Icons.cleaning_services_rounded,
                size: 80,
                color: context.colorScheme.primary,
              ),
            ),
          ),
          const Gap(40),
          Text(
            l10n.appTitle,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: context.appTextPrimary,
            ),
          ),
          const Gap(16),
          Text(
            l10n.onboardingWelcome,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: context.appTextSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2(BuildContext context, AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(40),
          Text(
            l10n.onboardingFeaturesTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.appTextPrimary,
            ),
          ),
          const Gap(12),
          Text(
            l10n.onboardingFeaturesDesc,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: context.appTextSecondary),
          ),
          const Gap(40),
          _buildFeatureItem(
            context,
            icon: Icons.pie_chart_rounded,
            color: AppColors.primary,
            title: l10n.feature1Title,
            description: l10n.feature1Desc,
          ),
          const Gap(16),
          _buildFeatureItem(
            context,
            icon: Icons.security_rounded,
            color: context.customColors.success,
            title: l10n.feature2Title,
            description: l10n.feature2Desc,
          ),
          const Gap(16),
          _buildFeatureItem(
            context,
            icon: Icons.rocket_launch_rounded,
            color: context.customColors.purple,
            title: l10n.feature3Title,
            description: l10n.feature3Desc,
          ),
          const Gap(40),
        ],
      ),
    );
  }

  Widget _buildPage3(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.customColors.orange.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shield_outlined,
              size: 64,
              color: context.customColors.orange,
            ),
          ),
          const Gap(32),
          Text(
            l10n.storageAccessRequired,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.appTextPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          Text(
            l10n.storageAccessDesc,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: context.appTextSecondary,
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
        color: context.appSurface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: context.appBorder.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: context.appShadow.withValues(alpha: 0.12),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: context.appTextPrimary,
                  ),
                ),
                const Gap(4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: context.appTextSecondary,
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
