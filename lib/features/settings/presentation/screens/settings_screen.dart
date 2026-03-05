import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/widgets/app_card.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _appVersion = 'Loading...';
  final InAppReview _inAppReview = InAppReview.instance;

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (!mounted) return;
      setState(() {
        _appVersion = '${info.version} (Build ${info.buildNumber})';
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _appVersion = 'Version unavailable');
    }
  }

  // Moved out of function scope to prevent GC (Garbage Collection) thrashing on every tap.
  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  Future<void> _sendFeedbackEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@clearspace.com', // Replace with real support email
      query: _encodeQueryParameters(<String, String>{
        'subject': '[Clear Space] Bug Report / Feedback',
        'body':
            'App Version: $_appVersion\nOS: ${io.Platform.operatingSystem} ${io.Platform.operatingSystemVersion}\n\nPlease describe your issue below:\n\n',
      }),
    );

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Could not open email client. Please email us directly.',
            ),
          ),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email functionality restricted by device.'),
        ),
      );
    }
  }

  Future<void> _openLink(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch browser.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Browser access restricted on this device.'),
        ),
      );
    }
  }

  Future<void> _requestReview() async {
    try {
      if (await _inAppReview.isAvailable()) {
        await _inAppReview.requestReview();
      } else {
        // Fallback to store page if in-app review not available.
        // Removed literal '...' appStoreId to prevent native Exceptions.
        await _inAppReview.openStoreListing();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Store service temporarily unavailable.'),
          ),
        );
      }
    }
  }

  void _shareApp() {
    try {
      const storeUrl =
          'https://play.google.com/store/apps/details?id=com.lebac.storage_dashboard.clear_space';

      Share.share(
        'Hey! Check out Clear Space. It helped me clean up gigabytes of junk files instantly! Download here: $storeUrl',
        subject: 'Keep your phone clean with Clear Space',
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Share functionality unavailable.')),
      );
    }
  }

  void _showSensitivityDialog(
    BuildContext context,
    WidgetRef ref,
    int currentValue,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  Text(
                    'Similar Photo Sensitivity',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(AppSpacing.sm),
                  Text(
                    'Choose how strictly the app identifies similar photos. '
                    'A stricter setting means photos must look nearly identical to be flagged.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Gap(AppSpacing.lg),

                  // Options in a card
                  AppCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        _buildSensitivityOption(
                          context,
                          ref,
                          icon: Icons.filter_1_rounded,
                          title: 'Strict',
                          description: '95% Match — Nearly identical only',
                          value: 3,
                          currentValue: currentValue,
                        ),
                        const Divider(
                          height: 1,
                          color: AppColors.border,
                          indent: 70,
                        ),
                        _buildSensitivityOption(
                          context,
                          ref,
                          icon: Icons.filter_2_rounded,
                          title: 'Normal',
                          description: '85% Match — Recommended',
                          value: 5,
                          currentValue: currentValue,
                        ),
                        const Divider(
                          height: 1,
                          color: AppColors.border,
                          indent: 70,
                        ),
                        _buildSensitivityOption(
                          context,
                          ref,
                          icon: Icons.filter_3_rounded,
                          title: 'Loose',
                          description: '75% Match — Catches more variations',
                          value: 8,
                          currentValue: currentValue,
                        ),
                      ],
                    ),
                  ),
                  const Gap(AppSpacing.md),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSensitivityOption(
    BuildContext context,
    WidgetRef ref, {
    required IconData icon,
    required String title,
    required String description,
    required int value,
    required int currentValue,
  }) {
    final isSelected = value == currentValue;
    return InkWell(
      onTap: () async {
        final appSettings = ref.read(appSettingsServiceProvider);
        await appSettings.setSimilarPhotoSensitivity(value);
        if (context.mounted) {
          Navigator.pop(context);
          ref.read(_sensitivityLocalProvider.notifier).state = value;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Sensitivity setting updated. It will apply on the next scan.',
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                size: 22,
              ),
            ),
            const Gap(AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textPrimary,
                      fontSize: 15,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    description,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  void _showThresholdDialog(
    BuildContext context,
    WidgetRef ref,
    int currentValue,
  ) {
    final options = [
      {'label': '10MB', 'value': 10 * 1024 * 1024},
      {'label': '50MB', 'value': 50 * 1024 * 1024},
      {'label': '100MB', 'value': 100 * 1024 * 1024},
      {'label': '500MB', 'value': 500 * 1024 * 1024},
      {'label': '1GB', 'value': 1024 * 1024 * 1024},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text(
                    'Large File Threshold',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(AppSpacing.sm),
                  Text(
                    'Files larger than this value will be flagged for cleanup.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Gap(AppSpacing.lg),
                  AppCard(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        for (int i = 0; i < options.length; i++) ...[
                          _buildThresholdOption(
                            context,
                            ref,
                            title: options[i]['label'] as String,
                            value: options[i]['value'] as int,
                            currentValue: currentValue,
                          ),
                          if (i < options.length - 1)
                            const Divider(
                              height: 1,
                              color: AppColors.border,
                              indent: 70,
                            ),
                        ],
                      ],
                    ),
                  ),
                  const Gap(AppSpacing.md),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildThresholdOption(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required int value,
    required int currentValue,
  }) {
    final isSelected = value == currentValue;
    return InkWell(
      onTap: () async {
        final appSettings = ref.read(appSettingsServiceProvider);
        await appSettings.setLargeFileThreshold(value);
        if (context.mounted) {
          Navigator.pop(context);
          ref.read(_thresholdLocalProvider.notifier).state = value;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Threshold updated. It will apply on the next scan.',
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(
                Icons.folder_zip_outlined,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                size: 22,
              ),
            ),
            const Gap(AppSpacing.md),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                  fontSize: 15,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  // Micro-optimization: Isolated reactive state to prevent root scaffold global rebuilds
  late StateProvider<int> _sensitivityLocalProvider;
  late StateProvider<int> _thresholdLocalProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize providers with cached state
    _sensitivityLocalProvider = StateProvider<int>((ref) {
      return ref.read(appSettingsServiceProvider).getSimilarPhotoSensitivity();
    });
    _thresholdLocalProvider = StateProvider<int>((ref) {
      return ref.read(appSettingsServiceProvider).getLargeFileThreshold();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.lg,
        ),
        children: [
          // ── Support & Engagement ──
          const _SectionHeader(title: 'Support & Engagement'),
          const Gap(AppSpacing.sm),

          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.mark_email_read_outlined,
                  title: 'Send Feedback',
                  subtitle: 'Report bugs or suggest improvements',
                  color: AppColors.primary,
                  onTap: _sendFeedbackEmail,
                ),
                const Divider(height: 1, color: AppColors.border, indent: 70),
                _SettingsTile(
                  icon: Icons.star_rounded,
                  title: 'Rate Us 5 Stars',
                  subtitle: 'Help others find Clear Space',
                  color: AppColors.warning,
                  onTap: _requestReview,
                ),
                const Divider(height: 1, color: AppColors.border, indent: 70),
                _SettingsTile(
                  icon: Icons.share_rounded,
                  title: 'Share with Friends',
                  subtitle: 'Recommend the app via messages',
                  color: AppColors.success,
                  onTap: _shareApp,
                ),
              ],
            ),
          ),

          const Gap(AppSpacing.lg),

          // ── Scan Preferences ──
          const _SectionHeader(title: 'Scan Preferences'),
          const Gap(AppSpacing.sm),

          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final currentSensitivity = ref.watch(
                      _sensitivityLocalProvider,
                    );

                    String subtitle = 'Normal (85% Match)';
                    if (currentSensitivity <= 3) {
                      subtitle = 'Strict (95% Match)';
                    }
                    if (currentSensitivity >= 8) {
                      subtitle = 'Loose (75% Match)';
                    }

                    return _SettingsTile(
                      icon: Icons.tune_rounded,
                      title: 'Similar Photo Sensitivity',
                      subtitle: subtitle,
                      color: AppColors.purple,
                      onTap: () {
                        _showSensitivityDialog(
                          context,
                          ref,
                          currentSensitivity,
                        );
                      },
                    );
                  },
                ),
                const Divider(height: 1, color: AppColors.border, indent: 70),
                Consumer(
                  builder: (context, ref, child) {
                    final currentThreshold = ref.watch(_thresholdLocalProvider);

                    String label = '10MB';
                    if (currentThreshold >= 1024 * 1024 * 1024) {
                      label =
                          '${(currentThreshold / (1024 * 1024 * 1024)).toInt()}GB';
                    } else {
                      label = '${(currentThreshold / (1024 * 1024)).toInt()}MB';
                    }

                    final subtitle = 'Larger than $label';

                    return _SettingsTile(
                      icon: Icons.straighten_rounded,
                      title: 'Large File Threshold',
                      subtitle: subtitle,
                      color: AppColors.orange,
                      onTap: () {
                        _showThresholdDialog(context, ref, currentThreshold);
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const Gap(AppSpacing.lg),

          // ── Legal & App Info ──
          const _SectionHeader(title: 'Legal & App Info'),
          const Gap(AppSpacing.sm),

          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.shield_outlined,
                  title: 'Privacy Policy',
                  subtitle: 'How we protect your data',
                  color: AppColors.secondary,
                  onTap: () => _openLink(
                    'https://policies.google.com/privacy',
                  ), // Placeholder
                ),
                const Divider(height: 1, color: AppColors.border, indent: 70),
                _SettingsTile(
                  icon: Icons.description_outlined,
                  title: 'Terms of Service',
                  subtitle: 'Rules and guidelines',
                  color: AppColors.secondary,
                  onTap: () => _openLink(
                    'https://policies.google.com/terms',
                  ), // Placeholder
                ),
                const Divider(height: 1, color: AppColors.border, indent: 70),
                _SettingsTile(
                  icon: Icons.info_outline_rounded,
                  title: 'App Version',
                  subtitle: _appVersion,
                  color: AppColors.secondary,
                  showChevron: false,
                ),
              ],
            ),
          ),

          const Gap(AppSpacing.xl),

          // ── Footer ──
          Center(
            child: Column(
              children: [
                Text(
                  'Clear Space',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textTertiary,
                  ),
                ),
                const Gap(AppSpacing.xs),
                Text(
                  'Made with ❤️ for a cleaner phone',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),

          const Gap(AppSpacing.xl),
        ],
      ),
    );
  }
}

// ─── Sub-widgets ───────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;
  final bool showChevron;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const Gap(AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            if (showChevron)
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textTertiary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
