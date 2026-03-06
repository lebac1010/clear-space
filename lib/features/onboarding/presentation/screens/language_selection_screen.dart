import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';

import '../../../../core/router/route_constants.dart';
import '../../../../core/services/app_settings_service.dart';
import '../../../../core/widgets/app_button.dart';

class LanguageSelectionScreen extends ConsumerStatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  ConsumerState<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState
    extends ConsumerState<LanguageSelectionScreen> {
  String _selectedLanguageCode = 'en';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentLocale = ref.read(localeControllerProvider);
      setState(() {
        _selectedLanguageCode = currentLocale.languageCode;
      });
    });
  }

  Future<void> _continue() async {
    final settings = ref.read(appSettingsServiceProvider);
    await ref
        .read(localeControllerProvider.notifier)
        .setLocale(_selectedLanguageCode);
    await settings.setLanguageSelected(true);

    if (mounted) {
      context.go(RouteConstants.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final languages = [
      {
        'code': 'en',
        'emoji': '🇺🇸',
        'title': 'English (US)',
        'subtitle': 'English (US)',
      },
      {
        'code': 'en_GB',
        'emoji': '🇬🇧',
        'title': 'English (UK)',
        'subtitle': 'English (UK)',
      },
      {
        'code': 'es',
        'emoji': '🇲🇽',
        'title': 'Español (Latinoamérica)',
        'subtitle': 'Spanish (Latin America)',
      },
      {
        'code': 'es_ES',
        'emoji': '🇪🇸',
        'title': 'Español (España)',
        'subtitle': 'Spanish (Spain)',
      },
      {
        'code': 'pt',
        'emoji': '🇧🇷',
        'title': 'Português (Brasil)',
        'subtitle': 'Portuguese (Brazil)',
      },
      {
        'code': 'hi',
        'emoji': '🇮🇳',
        'title': 'हिन्दी',
        'subtitle': 'Hindi (India)',
      },
      {
        'code': 'id',
        'emoji': '🇮🇩',
        'title': 'Bahasa Indonesia',
        'subtitle': 'Indonesian',
      },
      {'code': 'tr', 'emoji': '🇹🇷', 'title': 'Türkçe', 'subtitle': 'Turkish'},
      {'code': 'de', 'emoji': '🇩🇪', 'title': 'Deutsch', 'subtitle': 'German'},
      {
        'code': 'fr',
        'emoji': '🇫🇷',
        'title': 'Français',
        'subtitle': 'French',
      },
      {
        'code': 'fil',
        'emoji': '🇵🇭',
        'title': 'Filipino',
        'subtitle': 'Filipino',
      },
      {
        'code': 'vi',
        'emoji': '🇻🇳',
        'title': 'Tiếng Việt',
        'subtitle': 'Vietnamese',
      },
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(40),
              Text(
                'Select Your Language\nChọn Ngôn Ngữ',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Gap(16),
              Text(
                'You can change this later in Settings.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap(40),

              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  separatorBuilder: (_, __) => const Gap(12),
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    return _LanguageTile(
                      emoji: lang['emoji']!,
                      title: lang['title']!,
                      subtitle: lang['subtitle']!,
                      isSelected: _selectedLanguageCode == lang['code'],
                      onTap: () =>
                          setState(() => _selectedLanguageCode = lang['code']!),
                    );
                  },
                ),
              ),

              const Gap(16),
              AppButton(
                text: l10n?.continueText ?? 'Continue',
                isFullWidth: true,
                onPressed: _continue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IgnorePointer(
      ignoring: isSelected,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.colorScheme.primary.withValues(alpha: 0.1)
                : theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outlineVariant,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: theme.colorScheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
