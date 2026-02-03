import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_action_tile.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/extensions/build_context_x.dart';

/// Dashboard screen displaying storage overview and cleanup suggestions.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Storage Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {
              // TODO: Navigate to settings
              debugPrint('Settings tapped');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Storage Summary Card
              _buildStorageCard(context),
              const SizedBox(height: AppSpacing.lg),

              Text('Cleanup Suggestions', style: context.textTheme.titleLarge),
              const SizedBox(height: AppSpacing.md),

              // Action Items
              AppActionTile(
                title: 'Duplicate Contacts',
                subtitle: 'Merge 5 duplicate contacts',
                icon: Icons.people_outline,
                onTap: () {
                  // TODO: Navigate to contacts cleanup
                  debugPrint('Duplicate Contacts tapped');
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              AppActionTile(
                title: 'Video Compression',
                subtitle: 'Save 1.2 GB space',
                icon: Icons.video_collection_outlined,
                onTap: () {
                  // TODO: Navigate to video compression
                  debugPrint('Video Compression tapped');
                },
              ),
              const SizedBox(height: AppSpacing.sm),
              AppActionTile(
                title: 'Large Files',
                subtitle: '12 files over 100 MB',
                icon: Icons.folder_outlined,
                onTap: () {
                  // TODO: Navigate to large files
                  debugPrint('Large Files tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStorageCard(BuildContext context) {
    // TODO: Replace with data from provider
    const usedPercentage = 75;
    const usedStorage = '64 GB';
    const totalStorage = '128 GB';

    return AppCard(
      color: AppColors.primary,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Text(
            '$usedPercentage% Used',
            style: context.textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '$usedStorage / $totalStorage',
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton.secondary(
            text: 'Analyze Details',
            onPressed: () {
              // TODO: Navigate to storage analysis
              debugPrint('Analyze Details tapped');
            },
          ),
        ],
      ),
    );
  }
}
