import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/cleanup_item.dart';

class CleanupItemTile extends StatelessWidget {
  final CleanupItem item;
  final VoidCallback onTap;

  const CleanupItemTile({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: item.isSelected
                    ? AppColors.primary
                    : AppColors.border.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: _buildThumbnail(),
            ),
          ),
          if (item.isSelected)
            Positioned(
              right: -2,
              bottom: -2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        item.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: item.isSelected ? AppColors.primary : AppColors.textPrimary,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            _formatSize(item.size),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          const Text('•', style: TextStyle(color: AppColors.textTertiary)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item.path.split('/').last,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
      trailing: Checkbox(
        value: item.isSelected,
        onChanged: (_) => onTap(),
        activeColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  Widget _buildThumbnail() {
    // If we have a path and it's an image/video, try to load it.
    // For now, we use a simple icon based on extension if no thumbUrl is provided.
    final ext = item.name.split('.').last.toLowerCase();

    if (item.thumbUrl != null && item.thumbUrl!.startsWith('/')) {
      // Local path
      // return Image.file(File(item.thumbUrl!), fit: BoxFit.cover);
    }

    IconData icon;
    Color color;

    switch (ext) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'webp':
        icon = Icons.image_outlined;
        color = Colors.blue;
      case 'mp4':
      case 'mkv':
      case 'mov':
        icon = Icons.video_library_outlined;
        color = Colors.orange;
      case 'mp3':
      case 'wav':
      case 'm4a':
        icon = Icons.audiotrack_outlined;
        color = Colors.purple;
      case 'pdf':
        icon = Icons.picture_as_pdf_outlined;
        color = Colors.red;
      case 'zip':
      case 'rar':
      case '7z':
        icon = Icons.archive_outlined;
        color = Colors.amber;
      default:
        icon = Icons.insert_drive_file_outlined;
        color = Colors.grey;
    }

    return Container(
      color: color.withValues(alpha: 0.1),
      child: Icon(icon, color: color, size: 24),
    );
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
