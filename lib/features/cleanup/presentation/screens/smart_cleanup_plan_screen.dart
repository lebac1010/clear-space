import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';

import '../controllers/smart_cleanup_controller.dart';

class SmartCleanupPlanScreen extends ConsumerWidget {
  const SmartCleanupPlanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(smartCleanupControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Smart Cleanup Plan'),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
      ),
      body: stateAsync.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Gap(16),
              Text('Analyzing safe-to-delete files...'),
            ],
          ),
        ),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (state) {
          if (state.isCompleted) {
            return _buildCompletionScreen(context, state.totalPotentialSavings);
          }

          // Empty State (Analysis complete but nothing to clean)
          if (state.duplicateCount == 0 && state.similarPhotoCount == 0) {
            return _buildEmptyState(context);
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Hero Header with Animation
                      _AnimatedHeroHeader(savings: state.totalPotentialSavings),

                      const Gap(48),

                      // Breakdown
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cleanup Breakdown',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Gap(16),

                      AppCard(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            _InteractiveBreakdownItem(
                              icon: Icons.copy_all_rounded,
                              color: AppColors.secondary,
                              title: 'Duplicate Files',
                              count: state.duplicateCount,
                              size: state.duplicateSize,
                              isSelected: state.duplicatesSelected,
                              onToggle: (val) {
                                ref
                                    .read(
                                      smartCleanupControllerProvider.notifier,
                                    )
                                    .toggleDuplicates(val ?? false);
                              },
                              onTap: () => context.goNamed(
                                'duplicates',
                                queryParameters: {'type': 'duplicate'},
                              ),
                            ),
                            const Divider(height: 1),
                            _InteractiveBreakdownItem(
                              icon: Icons.photo_library_rounded,
                              color: AppColors.primary,
                              title: 'Similar Photos',
                              count: state.similarPhotoCount,
                              size: state.similarPhotoSize,
                              isSelected: state.similarPhotosSelected,
                              onToggle: (val) {
                                ref
                                    .read(
                                      smartCleanupControllerProvider.notifier,
                                    )
                                    .toggleSimilarPhotos(val ?? false);
                              },
                              onTap: () => context.goNamed(
                                'duplicates',
                                queryParameters: {'type': 'similar'},
                              ),
                            ),
                            const Divider(height: 1),
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    size: 20,
                                    color: AppColors.textSecondary,
                                  ),
                                  Gap(12),
                                  Expanded(
                                    child: Text(
                                      'We automatically keep the best version of your photos and files.',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Action
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: AppButton(
                  text: state.isCleaning
                      ? 'Cleaning...'
                      : 'Clean Up ${FileUtils.formatSize(state.totalPotentialSavings)}',
                  isLoading: state.isCleaning,
                  icon: const Icon(Icons.cleaning_services_rounded),
                  onPressed:
                      state.isCleaning || state.totalPotentialSavings == 0
                      ? null
                      : () {
                          ref
                              .read(smartCleanupControllerProvider.notifier)
                              .executeCleanup();
                        },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCompletionScreen(BuildContext context, int savings) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 80,
            color: AppColors.success,
          ),
          const Gap(16),
          const Text(
            'Cleanup Complete!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          Text(
            // Logic note: If we tracked actual deleted bytes, use that.
            // For now, using potential savings which matches what was just deleted.
            'You saved ${FileUtils.formatSize(savings)}',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
          const Gap(32),
          AppButton(
            text: 'Return directly to Dashboard',
            onPressed: () => context.go('/dashboard'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.thumb_up_rounded,
              size: 64,
              color: AppColors.success,
            ),
          ),
          const Gap(24),
          const Text(
            "You're All Set!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          const Text(
            'No duplicate or similar files found.',
            style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
          ),
          const Gap(32),
          AppButton(
            text: 'Return to Dashboard',
            onPressed: () => context.go('/dashboard'),
          ),
        ],
      ),
    );
  }
}

class _AnimatedHeroHeader extends StatelessWidget {
  final int savings;

  const _AnimatedHeroHeader({required this.savings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
          width: 8,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Save',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
          // Animated counter
          TweenAnimationBuilder<int>(
            duration: const Duration(seconds: 1),
            tween: IntTween(begin: 0, end: savings),
            builder: (context, value, child) {
              return Text(
                FileUtils.formatSize(value),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _InteractiveBreakdownItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final int count;
  final int size;
  final bool isSelected;
  final ValueChanged<bool?> onToggle;
  final VoidCallback onTap;

  const _InteractiveBreakdownItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.count,
    required this.size,
    required this.isSelected,
    required this.onToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: onToggle,
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Gap(8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
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
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '$count items found',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  FileUtils.formatSize(size),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Gap(8),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
