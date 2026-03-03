import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/services/app_settings_service.dart';

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
            'App Version: $_appVersion\nOS: ${Platform.operatingSystem} ${Platform.operatingSystemVersion}\n\nPlease describe your issue below:\n\n',
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
      final storeUrl = Platform.isIOS
          ? 'https://clearspace.com/download/ios'
          : 'https://play.google.com/store/apps/details?id=com.lebac.storage_dashboard.clear_space';

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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Similar Photo Sensitivity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Choose how strictly the app identifies similar photos. '
                    'A stricter setting means photos must look nearly identical to be flagged.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildSensitivityOption(
                  context,
                  ref,
                  'Strict (95% Match)',
                  3,
                  currentValue,
                ),
                _buildSensitivityOption(
                  context,
                  ref,
                  'Normal (85% Match)',
                  5,
                  currentValue,
                ),
                _buildSensitivityOption(
                  context,
                  ref,
                  'Loose (75% Match)',
                  8,
                  currentValue,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSensitivityOption(
    BuildContext context,
    WidgetRef ref,
    String title,
    int value,
    int currentValue,
  ) {
    final isSelected = value == currentValue;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : AppColors.textPrimary,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
            )
          : null,
      onTap: () async {
        final appSettings = ref.read(appSettingsServiceProvider);
        await appSettings.setSimilarPhotoSensitivity(value);
        if (context.mounted) {
          Navigator.pop(context); // Close bottom sheet
          // Update surgical state provider to trigger isolated rebuild instead of root setState
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
    );
  }

  // Micro-optimization: Isolated reactive state to prevent root scaffold global rebuilds
  late final StateProvider<int> _sensitivityLocalProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize standard provider with cached state
    _sensitivityLocalProvider = StateProvider<int>((ref) {
      return ref.read(appSettingsServiceProvider).getSimilarPhotoSensitivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          const _SettingsHeader(title: 'Support & Engagement'),

          _SettingsTile(
            icon: Icons.mark_email_read_outlined,
            title: 'Send Feedback / Bug Report',
            subtitle: 'Let us know how we can improve',
            color: Colors.blue,
            onTap: _sendFeedbackEmail,
          ),

          _SettingsTile(
            icon: Icons.star_rate_rounded,
            title: 'Rate Us 5 Stars',
            subtitle: 'Help others find Clear Space',
            color: Colors.orange,
            onTap: _requestReview,
          ),

          _SettingsTile(
            icon: Icons.ios_share_rounded,
            title: 'Share with Friends',
            subtitle: 'Recommend the app via messages',
            color: Colors.green,
            onTap: _shareApp,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(height: 32),
          ),

          const _SettingsHeader(title: 'Scan Preferences'),

          Consumer(
            builder: (context, ref, child) {
              final currentSensitivity = ref.watch(_sensitivityLocalProvider);

              String subtitle = 'Normal (85% Match)';
              if (currentSensitivity <= 3) subtitle = 'Strict (95% Match)';
              if (currentSensitivity >= 8) subtitle = 'Loose (75% Match)';

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple.withValues(alpha: 0.1),
                  child: const Icon(
                    Icons.tune_outlined,
                    color: Colors.purple,
                    size: 20,
                  ),
                ),
                title: const Text('Similar Photo Sensitivity'),
                subtitle: Text(subtitle),
                trailing: const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: AppColors.textTertiary,
                ),
                onTap: () {
                  _showSensitivityDialog(context, ref, currentSensitivity);
                },
              );
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(height: 32),
          ),

          const _SettingsHeader(title: 'Legal & App Info'),

          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            subtitle: 'How we protect your data',
            color: Colors.grey,
            onTap: () =>
                _openLink('https://policies.google.com/privacy'), // Placeholder
          ),

          _SettingsTile(
            icon: Icons.description_outlined,
            title: 'Terms of Service',
            subtitle: 'Rules and guidelines',
            color: Colors.grey,
            onTap: () =>
                _openLink('https://policies.google.com/terms'), // Placeholder
          ),

          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.withValues(alpha: 0.1),
              child: const Icon(
                Icons.info_outline,
                color: Colors.grey,
                size: 20,
              ),
            ),
            title: const Text('App Version'),
            subtitle: Text(_appVersion),
            onTap: () {
              // Easter egg could go here
            },
          ),

          const SizedBox(height: 48), // Bottom padding
        ],
      ),
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  final String title;

  const _SettingsHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.1),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        size: 20,
        color: AppColors.textTertiary,
      ),
      onTap: onTap,
    );
  }
}
