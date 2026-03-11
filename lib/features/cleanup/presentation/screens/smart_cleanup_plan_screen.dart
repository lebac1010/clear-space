import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/router/route_constants.dart';

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
      backgroundColor: context.appBackground,
      appBar: AppBar(
        title: Text(context.l10n.smartCleanupPlanTitle),
        backgroundColor: context.appBackground,
        elevation: 0,
        centerTitle: true,
      ),
      body: stateAsync.when(
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Gap(16),
              Text(context.l10n.analyzingSafeToDelete),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
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
                              color: context.customColors.secondary,
                              title: context.l10n.duplicateFiles,
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
                              onTap: () => context.push(
                                '${RouteConstants.smartDetail}?type=duplicate${state.duplicatesSelected ? '&autoSelect=true' : ''}',
                              ),
                            ),
                            const Divider(height: 1),
                            _InteractiveBreakdownItem(
                              icon: Icons.photo_library_rounded,
                              color: context.colorScheme.primary,
                              title: context.l10n.similarPhotos,
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
                              onTap: () => context.push(
                                '${RouteConstants.smartDetail}?type=similar${state.similarPhotosSelected ? '&autoSelect=true' : ''}',
                              ),
                            ),
                            const Divider(height: 1),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    size: 20,
                                    color: context.appTextSecondary,
                                  ),
                                  Gap(12),
                                  Expanded(
                                    child: Text(
                                      context.l10n.smartCleanupDesc,
                                      style: TextStyle(
                                        color: context.appTextSecondary,
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
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: context.appSurface,
                  boxShadow: [
                    BoxShadow(
                      color: context.appShadow.withValues(alpha: 0.35),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: AppButton(
                  text: state.isCleaning
                      ? context.l10n.cleaning
                      : context.l10n.cleanUpSize(
                          FileUtils.formatSize(state.totalPotentialSavings),
                        ),
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
          Icon(
            Icons.check_circle_outline_rounded,
            size: 80,
            color: context.customColors.success,
          ),
          const Gap(16),
          Text(
            context.l10n.cleanupComplete,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          Text(
            // Logic note: If we tracked actual deleted bytes, use that.
            // For now, using potential savings which matches what was just deleted.
            context.l10n.youSavedSize(FileUtils.formatSize(savings)),
            style: const TextStyle(
              fontSize: 16,
            ).copyWith(color: context.appTextSecondary),
          ),
          const Gap(32),
          AppButton(
            text: context.l10n.returnDirectlyToDashboard,
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
              color: context.customColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.thumb_up_rounded,
              size: 64,
              color: context.customColors.success,
            ),
          ),
          const Gap(24),
          const Text(
            "You're All Set!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          Text(
            context.l10n.noSmartCleanupItems,
            style: TextStyle(fontSize: 16),
          ),
          const Gap(32),
          AppButton(
            text: context.l10n.returnToDashboard,
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
      width: 200,
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: context.appSurface,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.2),
          width: 8,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.save,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: context.appTextSecondary),
            ),
            const Gap(4),
            // Animated counter with FittedBox to prevent overflow
            FittedBox(
              fit: BoxFit.scaleDown,
              child: TweenAnimationBuilder<int>(
                duration: const Duration(seconds: 1),
                tween: IntTween(begin: 0, end: savings),
                builder: (context, value, child) {
                  return Text(
                    FileUtils.formatSize(value),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
              activeColor: context.colorScheme.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Gap(2),
                  Text(
                    context.l10n.selectedCountSize(
                      count,
                      FileUtils.formatSize(size),
                    ),
                    style: TextStyle(
                      color: context.appTextSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(4),
            Icon(
              Icons.chevron_right,
              color: context.appTextSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
