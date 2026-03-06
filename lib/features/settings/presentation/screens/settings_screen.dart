import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_constants.dart';
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

      SharePlus.instance.share(
        ShareParams(
          text:
              'Hey! Check out Clear Space. It helped me clean up gigabytes of junk files instantly! Download here: $storeUrl',
          title: 'Keep your phone clean with Clear Space',
        ),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Share functionality unavailable.')),
      );
    }
  }

  String _getLanguageName(Locale locale) {
    final code = locale.toString();
    switch (code) {
      case 'en':
        return 'English (US)';
      case 'en_GB':
        return 'English (UK)';
      case 'es':
        return 'Español (Latinoamérica)';
      case 'es_ES':
        return 'Español (España)';
      case 'pt':
        return 'Português (Brasil)';
      case 'hi':
        return 'हिन्दी';
      case 'id':
        return 'Bahasa Indonesia';
      case 'tr':
        return 'Türkçe';
      case 'de':
        return 'Deutsch';
      case 'fr':
        return 'Français';
      case 'fil':
        return 'Filipino';
      case 'vi':
        return 'Tiếng Việt';
      default:
        return 'English (US)';
    }
  }

  void _showLanguageDialog(
    BuildContext context,
    WidgetRef ref,
    Locale currentLocale,
  ) {
    final languages = [
      {'code': 'en', 'emoji': '🇺🇸', 'title': 'English (US)'},
      {'code': 'en_GB', 'emoji': '🇬🇧', 'title': 'English (UK)'},
      {'code': 'es', 'emoji': '🇲🇽', 'title': 'Español'},
      {'code': 'es_ES', 'emoji': '🇪🇸', 'title': 'Español (España)'},
      {'code': 'pt', 'emoji': '🇧🇷', 'title': 'Português'},
      {'code': 'hi', 'emoji': '🇮🇳', 'title': 'हिन्दी'},
      {'code': 'id', 'emoji': '🇮🇩', 'title': 'Bahasa Indonesia'},
      {'code': 'tr', 'emoji': '🇹🇷', 'title': 'Türkçe'},
      {'code': 'de', 'emoji': '🇩🇪', 'title': 'Deutsch'},
      {'code': 'fr', 'emoji': '🇫🇷', 'title': 'Français'},
      {'code': 'fil', 'emoji': '🇵🇭', 'title': 'Filipino'},
      {'code': 'vi', 'emoji': '🇻🇳', 'title': 'Tiếng Việt'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(AppSpacing.lg),
                    Expanded(
                      child: AppCard(
                        padding: EdgeInsets.zero,
                        child: ListView.separated(
                          controller: scrollController,
                          itemCount: languages.length,
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: context.appBorder,
                            indent: 16,
                            endIndent: 16,
                          ),
                          itemBuilder: (context, index) {
                            final lang = languages[index];
                            final isSelected =
                                currentLocale.toString() == lang['code'];

                            return ListTile(
                              leading: Text(
                                lang['emoji']!,
                                style: const TextStyle(fontSize: 22),
                              ),
                              title: Text(lang['title']!),
                              trailing: isSelected
                                  ? Icon(
                                      Icons.check,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    )
                                  : null,
                              onTap: () {
                                ref
                                    .read(localeControllerProvider.notifier)
                                    .setLocale(lang['code']!);
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showThemeDialog(
    BuildContext context,
    WidgetRef ref,
    ThemeMode currentTheme,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                'Theme',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap(AppSpacing.lg),
              AppCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.brightness_auto,
                        color: context.appTextPrimary,
                      ),
                      title: const Text('System Default'),
                      trailing: currentTheme == ThemeMode.system
                          ? Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        ref
                            .read(themeModeControllerProvider.notifier)
                            .setThemeMode(ThemeMode.system);
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      height: 1,
                      color: context.appBorder,
                      indent: 56,
                      endIndent: 16,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.light_mode,
                        color: context.appTextPrimary,
                      ),
                      title: const Text('Light'),
                      trailing: currentTheme == ThemeMode.light
                          ? Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        ref
                            .read(themeModeControllerProvider.notifier)
                            .setThemeMode(ThemeMode.light);
                        Navigator.pop(context);
                      },
                    ),
                    Divider(
                      height: 1,
                      color: context.appBorder,
                      indent: 56,
                      endIndent: 16,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dark_mode,
                        color: context.appTextPrimary,
                      ),
                      title: const Text('Dark'),
                      trailing: currentTheme == ThemeMode.dark
                          ? Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        ref
                            .read(themeModeControllerProvider.notifier)
                            .setThemeMode(ThemeMode.dark);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSensitivityDialog(
    BuildContext context,
    WidgetRef ref,
    int currentValue,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.appSurface,
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
                      color: context.appBorder,
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
                        Divider(
                          height: 1,
                          color: context.appBorder,
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
                        Divider(
                          height: 1,
                          color: context.appBorder,
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
                    : context.appSurfaceContainer,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primary : context.appTextSecondary,
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
                          : context.appTextPrimary,
                      fontSize: 15,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    description,
                    style: TextStyle(
                      color: context.appTextSecondary,
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
      backgroundColor: context.appSurface,
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
                      color: context.appBorder,
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
                            Divider(
                              height: 1,
                              color: context.appBorder,
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
                    : context.appSurfaceContainer,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(
                Icons.folder_zip_outlined,
                color: isSelected ? AppColors.primary : context.appTextSecondary,
                size: 22,
              ),
            ),
            const Gap(AppSpacing.md),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? AppColors.primary : context.appTextPrimary,
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
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: context.appBackground,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.lg,
        ),
        children: [
          // ── Appearance & Language ──
          const _SectionHeader(title: 'Appearance & Language'),
          const Gap(AppSpacing.sm),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final currentLocale = ref.watch(localeControllerProvider);

                    return _SettingsTile(
                      icon: Icons.language_rounded,
                      title: 'Language',
                      subtitle: _getLanguageName(currentLocale),
                      color: AppColors.primary,
                      onTap: () =>
                          _showLanguageDialog(context, ref, currentLocale),
                    );
                  },
                ),
                Divider(height: 1, color: context.appBorder, indent: 70),
                Consumer(
                  builder: (context, ref, child) {
                    final currentTheme = ref.watch(themeModeControllerProvider);
                    String themeName = 'System Default';
                    if (currentTheme == ThemeMode.light) themeName = 'Light';
                    if (currentTheme == ThemeMode.dark) themeName = 'Dark';

                    return _SettingsTile(
                      icon: Icons.palette_rounded,
                      title: 'Theme',
                      subtitle: themeName,
                      color: context.customColors.purple,
                      onTap: () => _showThemeDialog(context, ref, currentTheme),
                    );
                  },
                ),
              ],
            ),
          ),

          const Gap(AppSpacing.lg),

          // ── Support & Engagement ──
          const _SectionHeader(title: 'Support & Engagement'),
          const Gap(AppSpacing.sm),

          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.history_rounded,
                  title: 'Cleanup History',
                  subtitle: 'View your past cleaning activities',
                  color: AppColors.primary,
                  onTap: () => context.push(RouteConstants.history),
                ),
                Divider(height: 1, color: context.appBorder, indent: 70),
                _SettingsTile(
                  icon: Icons.mark_email_read_outlined,
                  title: 'Send Feedback',
                  subtitle: 'Report bugs or suggest improvements',
                  color: AppColors.primary,
                  onTap: _sendFeedbackEmail,
                ),
                Divider(height: 1, color: context.appBorder, indent: 70),
                _SettingsTile(
                  icon: Icons.star_rounded,
                  title: 'Rate Us 5 Stars',
                  subtitle: 'Help others find Clear Space',
                  color: AppColors.warning,
                  onTap: _requestReview,
                ),
                Divider(height: 1, color: context.appBorder, indent: 70),
                _SettingsTile(
                  icon: Icons.share_rounded,
                  title: 'Share with Friends',
                  subtitle: 'Recommend the app via messages',
                  color: context.customColors.success,
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
                      color: context.customColors.purple,
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
                Divider(height: 1, color: context.appBorder, indent: 70),
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
                      color: context.customColors.orange,
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
                  color: context.customColors.secondary,
                  onTap: () => _openLink(
                    'https://policies.google.com/privacy',
                  ), // Placeholder
                ),
                Divider(height: 1, color: context.appBorder, indent: 70),
                _SettingsTile(
                  icon: Icons.description_outlined,
                  title: 'Terms of Service',
                  subtitle: 'Rules and guidelines',
                  color: context.customColors.secondary,
                  onTap: () => _openLink(
                    'https://policies.google.com/terms',
                  ), // Placeholder
                ),
                Divider(height: 1, color: context.appBorder, indent: 70),
                _SettingsTile(
                  icon: Icons.info_outline_rounded,
                  title: 'App Version',
                  subtitle: _appVersion,
                  color: context.customColors.secondary,
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
                    color: context.appTextTertiary,
                  ),
                ),
                const Gap(AppSpacing.xs),
                Text(
                  'Made with ❤️ for a cleaner phone',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.appTextTertiary,
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
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: context.appTextSecondary,
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
                    style: TextStyle(
                      color: context.appTextSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            if (showChevron)
              Icon(
                Icons.chevron_right_rounded,
                color: context.appTextTertiary,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
