import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/router/route_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/file_utils.dart';
import '../../../../core/widgets/error_view.dart';
import '../controllers/media_explorer_controller.dart';

class MediaExplorerScreen extends ConsumerStatefulWidget {
  final String initialType;
  const MediaExplorerScreen({super.key, this.initialType = 'audio'});

  @override
  ConsumerState<MediaExplorerScreen> createState() =>
      _MediaExplorerScreenState();
}

class _MediaExplorerScreenState extends ConsumerState<MediaExplorerScreen> {
  late String _selectedType;
  late PageController _pageController;
  late List<_TabItem> _tabs;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabs = [
      _TabItem(
        type: 'audio',
        label: context.l10n.audio,
        icon: Icons.audiotrack_rounded,
      ),
      _TabItem(
        type: 'video',
        label: context.l10n.videos,
        icon: Icons.movie_rounded,
      ),
      _TabItem(
        type: 'documents',
        label: context.l10n.documentsAndFiles,
        icon: Icons.description_rounded,
      ),
    ];
    
    // Only set up the PageController and selected type the first time
    if (!_isInitialized) {
      _selectedType = widget.initialType;
      final initialIndex = _tabs
          .indexWhere((t) => t.type == _selectedType)
          .clamp(0, 2);
      _pageController = PageController(initialPage: initialIndex);
      _isInitialized = true;
    }
  }

  @override
  void initState() {
    super.initState();
    // Move _tabs access out of here as context is not fully available yet for l10n
  }

  @override
  void didUpdateWidget(MediaExplorerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialType != oldWidget.initialType &&
        widget.initialType != _selectedType) {
      _selectedType = widget.initialType;
      final index = _tabs
          .indexWhere((t) => t.type == _selectedType)
          .clamp(0, 2);
      // Wait for build to complete before animating page controller
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(String type) {
    final index = _tabs.indexWhere((t) => t.type == type);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() => _selectedType = type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        backgroundColor: context.appSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Media Explorer',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 16,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(RouteConstants.settings),
          ),
          const Gap(8),
        ],
      ),
      body: Column(
        children: [
          // ─── Pill Tab Bar ───
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: context.appSurfaceContainer,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Row(
                children: _tabs.map((tab) {
                  final isActive = _selectedType == tab.type;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => _onTabTapped(tab.type),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isActive
                              ? context.appSurface
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          boxShadow: isActive
                              ? [
                                  BoxShadow(
                                    color: context.appShadow.withValues(
                                      alpha: 0.3,
                                    ),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              tab.icon,
                              size: 16,
                              color: isActive
                                  ? context.colorScheme.primary
                                  : context.appTextTertiary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              tab.label,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isActive
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isActive
                                    ? context.colorScheme.primary
                                    : context.appTextSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // ─── PageView (swipe between tabs) ───
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _selectedType = _tabs[index].type);
              },
              children: _tabs
                  .map(
                    (tab) =>
                        _MediaListView(key: ValueKey(tab.type), type: tab.type),
                  )
                  .toList(),
            ),
          ),
        ],
      ),

      // ─── Floating Bottom Action ───
      bottomNavigationBar: _FloatingActionPanel(type: _selectedType),
    );
  }
}

// ── Tab Item Model ──
class _TabItem {
  final String type;
  final String label;
  final IconData icon;
  const _TabItem({required this.type, required this.label, required this.icon});
}

// ══════════════════════════════════════════════════════════════
// ── Media List View (per tab) ──
// ══════════════════════════════════════════════════════════════
class _MediaListView extends ConsumerStatefulWidget {
  final String type;
  const _MediaListView({super.key, required this.type});

  @override
  ConsumerState<_MediaListView> createState() => _MediaListViewState();
}

class _MediaListViewState extends ConsumerState<_MediaListView>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      ref
          .read(mediaExplorerControllerProvider(widget.type).notifier)
          .loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required by AutomaticKeepAliveClientMixin
    final state = ref.watch(mediaExplorerControllerProvider(widget.type));
    final controller = ref.read(
      mediaExplorerControllerProvider(widget.type).notifier,
    );

    return state.when(
      loading: () => Center(
        child: CircularProgressIndicator(color: context.colorScheme.primary),
      ),
      error: (err, st) => ErrorView(message: err.toString()),
      data: (files) {
        if (files.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _iconForType(widget.type),
                  size: 64,
                  color: context.appTextTertiary.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'No files found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.appTextSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Run a scan from Dashboard first',
                  style: TextStyle(
                    fontSize: 13,
                    color: context.appTextTertiary,
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            // ── Header Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withValues(
                        alpha: 0.08,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${files.length} items',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      final allSelected = files.every((f) => f.isSelected);
                      if (allSelected) {
                        controller.deselectAll();
                      } else {
                        controller.selectAll();
                      }
                    },
                    icon: Icon(
                      files.every((f) => f.isSelected)
                          ? Icons.deselect_rounded
                          : Icons.select_all_rounded,
                      size: 18,
                    ),
                    label: Text(
                      files.every((f) => f.isSelected)
                          ? 'Deselect All'
                          : 'Select All',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: context.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ],
              ),
            ),

            // ── Scrollable List ──
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  itemCount: files.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final file = files[index];
                    return _MediaItemCard(
                      file: file,
                      type: widget.type,
                      onTap: () => controller.toggleSelection(file.id),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'audio':
        return Icons.audiotrack_rounded;
      case 'video':
        return Icons.movie_rounded;
      default:
        return Icons.description_rounded;
    }
  }
}

// ══════════════════════════════════════════════════════════════
// ── Premium Media Item Card ──
// ══════════════════════════════════════════════════════════════
class _MediaItemCard extends StatelessWidget {
  final dynamic file;
  final String type;
  final VoidCallback onTap;

  const _MediaItemCard({
    required this.file,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = file.isSelected;

    return Material(
      color: isSelected
          ? context.colorScheme.primary.withValues(alpha: 0.08)
          : context.appSurface,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: isSelected
                  ? context.colorScheme.primary.withValues(alpha: 0.3)
                  : context.appBorder.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // ── Tinted Icon Avatar ──
              _IconAvatar(type: type, isSelected: isSelected),
              const SizedBox(width: 12),

              // ── File Info ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? context.colorScheme.primary
                            : context.appTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          FileUtils.formatSize(file.size),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: context.appTextSecondary,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '•',
                          style: TextStyle(color: context.appTextTertiary),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            _formattedDate(file.dateModified),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 11,
                              color: context.appTextTertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ── Selection Indicator ──
              const SizedBox(width: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? context.colorScheme.primary
                      : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.appTextTertiary,
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        size: 14,
                        color: context.colorScheme.onPrimary,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formattedDate(int epochSeconds) {
    try {
      final dt = DateTime.fromMillisecondsSinceEpoch(epochSeconds * 1000);
      return DateFormat.yMMMd().format(dt);
    } catch (_) {
      return '';
    }
  }
}

// ══════════════════════════════════════════════════════════════
// ── Tinted Icon Avatar ──
// ══════════════════════════════════════════════════════════════
class _IconAvatar extends StatelessWidget {
  final String type;
  final bool isSelected;
  const _IconAvatar({required this.type, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final (IconData icon, Color color) = switch (type) {
      'audio' => (Icons.audiotrack_rounded, context.customColors.purple),
      'video' => (Icons.movie_rounded, const Color(0xFFE57373)),
      _ => (Icons.description_rounded, context.customColors.orange),
    };

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(
          color: isSelected
              ? context.colorScheme.primary.withValues(alpha: 0.3)
              : color.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Icon(icon, color: color, size: 22),
    );
  }
}

// ══════════════════════════════════════════════════════════════
// ── Floating Bottom Action Panel ──
// ══════════════════════════════════════════════════════════════
class _FloatingActionPanel extends ConsumerWidget {
  final String type;
  const _FloatingActionPanel({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mediaExplorerControllerProvider(type));

    if (state.value == null) return const SizedBox.shrink();

    final selectedFiles = state.value!.where((f) => f.isSelected).toList();
    if (selectedFiles.isEmpty) return const SizedBox.shrink();

    final selectedCount = selectedFiles.length;
    final selectedSize = selectedFiles.fold<int>(0, (sum, f) => sum + f.size);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: context.appSurface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: context.appShadow.withValues(alpha: 0.45),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.06),
            blurRadius: 30,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // ── Info Column ──
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$selectedCount',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Text(
                    'selected',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // ── Size Info ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FileUtils.formatSize(selectedSize),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: context.appTextPrimary,
                    ),
                  ),
                  Text(
                    'will be freed',
                    style: TextStyle(
                      fontSize: 12,
                      color: context.appTextSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // ── Delete Button ──
            FilledButton.icon(
              onPressed: () =>
                  _showDeleteConfirmation(context, ref, selectedCount),
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              label: Text(context.l10n.delete),
              style: FilledButton.styleFrom(
                backgroundColor: context.colorScheme.error,
                foregroundColor: context.colorScheme.onError,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, int count) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colorScheme.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                color: context.colorScheme.error,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(context.l10n.deleteFilesQuestion),
          ],
        ),
        content: Text(
          'Are you sure you want to delete $count selected files?\n\n'
          'Items will be moved to Trash if supported, or permanently deleted.',
          style: TextStyle(color: context.appTextSecondary, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          FilledButton.icon(
            onPressed: () async {
              Navigator.pop(context);
              await ref
                  .read(mediaExplorerControllerProvider(type).notifier)
                  .deleteSelected();
            },
            icon: const Icon(Icons.delete_outline_rounded, size: 18),
            label: Text(context.l10n.delete),
            style: FilledButton.styleFrom(
              backgroundColor: context.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
