import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Read the category query parameter from the URI
    final uri = Uri.parse(ModalRoute.of(context)?.settings.name ?? '');
    final category = uri.queryParameters['category'];

    final title = category != null
        ? 'Files: ${category[0].toUpperCase()}${category.substring(1)}'
        : 'All Files';

    final icon = switch (category) {
      'video' => Icons.movie_outlined,
      'audio' => Icons.audiotrack_outlined,
      'document' => Icons.folder_open_outlined,
      'apps' => Icons.dns_outlined,
      _ => Icons.storage_outlined,
    };

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: AppColors.textSecondary),
            const SizedBox(height: 16),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text(
              'File listing coming soon.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
