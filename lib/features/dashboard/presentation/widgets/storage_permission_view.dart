import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../controllers/dashboard_controller.dart';

class StoragePermissionView extends ConsumerWidget {
  const StoragePermissionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shield_outlined,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            const Gap(24),
            Text(
              'Storage Access Required',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Gap(8),
            Text(
              'We need access to your storage to analyze and clean up files. Your data stays on your device.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(32),
            AppButton(
              text: 'Grant Access',
              onPressed: () {
                ref
                    .read(dashboardControllerProvider.notifier)
                    .requestPermission();
              },
            ),
          ],
        ),
      ),
    );
  }
}
