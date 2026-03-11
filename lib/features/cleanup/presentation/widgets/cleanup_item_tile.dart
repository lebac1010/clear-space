import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../dashboard/data/providers/storage_provider.dart';
import '../../domain/entities/cleanup_item.dart';

/// Tile for displaying a cleanup item (duplicate/similar photo) with real thumbnail.
/// - Loads efficient thumbnails via native API (D2)
/// - Long-press to preview full image (D4)
class CleanupItemTile extends ConsumerStatefulWidget {
  final CleanupItem item;
  final VoidCallback onTap;

  const CleanupItemTile({super.key, required this.item, required this.onTap});

  @override
  ConsumerState<CleanupItemTile> createState() => _CleanupItemTileState();
}

class _CleanupItemTileState extends ConsumerState<CleanupItemTile> {
  Uint8List? _thumbBytes;
  bool _thumbLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadThumbnail();
  }

  bool get _isImageType {
    final ext = widget.item.name.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'webp', 'gif', 'bmp'].contains(ext);
  }

  /// Load efficient thumbnail via native API — returns ~10-30KB JPEG
  Future<void> _loadThumbnail() async {
    if (!_isImageType || widget.item.uri.isEmpty) {
      if (mounted) setState(() => _thumbLoaded = true);
      return;
    }

    try {
      final scanner = ref.read(nativeStorageScannerProvider);
      // [D2] Use thumbnail API instead of getPhotoBytes (full-res)
      final bytes = await scanner.getPhotoThumbnail(widget.item.uri);
      if (mounted) {
        setState(() {
          _thumbBytes = bytes;
          _thumbLoaded = true;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _thumbLoaded = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      leading: GestureDetector(
        // [D4] Long-press to preview — normal tap passes through to ListTile.onTap
        onLongPress: (_thumbBytes != null && _isImageType)
            ? () => _showPreview(context)
            : null,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: context.appSurfaceContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: widget.item.isSelected
                      ? AppColors.primary
                      : context.appBorder.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: _buildThumbnail(context),
              ),
            ),
            if (widget.item.isSelected)
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.appSurface,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: context.colorScheme.primary,
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
      ),
      title: Text(
        widget.item.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: widget.item.isSelected
              ? AppColors.primary
              : context.appTextPrimary,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            _formatSize(widget.item.size),
            style: TextStyle(
              fontSize: 12,
              color: context.appTextSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Text('•', style: TextStyle(color: context.appTextTertiary)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.item.path.split('/').last,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11, color: context.appTextTertiary),
            ),
          ),
        ],
      ),
      trailing: Checkbox(
        value: widget.item.isSelected,
        onChanged: (_) => widget.onTap(),
        activeColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    // Show real image thumbnail if loaded
    if (_thumbBytes != null) {
      return Image.memory(
        _thumbBytes!,
        fit: BoxFit.cover,
        cacheWidth: 200,
        errorBuilder: (_, __, ___) => _buildIconThumbnail(context),
      );
    }

    // Show loading indicator while thumbnail is being fetched
    if (!_thumbLoaded) {
      return Container(
        color: context.imagePlaceholderMuted,
        child: const Center(
          child: SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 1.5),
          ),
        ),
      );
    }

    return _buildIconThumbnail(context);
  }

  Widget _buildIconThumbnail(BuildContext context) {
    final ext = widget.item.name.split('.').last.toLowerCase();

    IconData icon;
    Color color;

    switch (ext) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'webp':
        icon = Icons.image_outlined;
        color = AppColors.primary;
      case 'mp4':
      case 'mkv':
      case 'mov':
        icon = Icons.video_library_outlined;
        color = context.customColors.orange;
      case 'mp3':
      case 'wav':
      case 'm4a':
        icon = Icons.audiotrack_outlined;
        color = context.customColors.purple;
      case 'pdf':
        icon = Icons.picture_as_pdf_outlined;
        color = context.colorScheme.error;
      case 'zip':
      case 'rar':
      case '7z':
        icon = Icons.archive_outlined;
        color = context.colorScheme.tertiary;
      default:
        icon = Icons.insert_drive_file_outlined;
        color = context.appTextSecondary;
    }

    return Container(
      color: color.withValues(alpha: 0.1),
      child: Icon(icon, color: color, size: 24),
    );
  }

  /// [D3] Show fullscreen preview — lazy-loads full-res image
  void _showPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          _FullImagePreviewDialog(item: widget.item, thumbBytes: _thumbBytes!),
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

/// [D3] Separate dialog widget that lazy-loads full-res image from thumbnail
class _FullImagePreviewDialog extends ConsumerStatefulWidget {
  final CleanupItem item;
  final Uint8List thumbBytes;

  const _FullImagePreviewDialog({required this.item, required this.thumbBytes});

  @override
  ConsumerState<_FullImagePreviewDialog> createState() =>
      _FullImagePreviewDialogState();
}

class _FullImagePreviewDialogState
    extends ConsumerState<_FullImagePreviewDialog> {
  Uint8List? _fullBytes;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadFullImage();
  }

  Future<void> _loadFullImage() async {
    try {
      final scanner = ref.read(nativeStorageScannerProvider);
      final bytes = await scanner.getPhotoBytes(widget.item.uri);
      if (mounted) {
        setState(() {
          _fullBytes = bytes;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayBytes = _fullBytes ?? widget.thumbBytes;

    return Dialog(
      backgroundColor: context.appOverlay,
      insetPadding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              child: Image.memory(displayBytes, fit: BoxFit.contain),
            ),
          ),
          // Loading indicator while full-res loads
          if (_loading)
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 28,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.appOverlay.withValues(alpha: 0.75),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_formatSize(widget.item.size)} • ${widget.item.path}',
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
