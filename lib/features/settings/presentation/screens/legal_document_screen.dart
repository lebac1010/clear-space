import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

class LegalDocumentScreen extends StatefulWidget {
  final String title;
  final String assetPath;

  const LegalDocumentScreen({
    super.key,
    required this.title,
    required this.assetPath,
  });

  @override
  State<LegalDocumentScreen> createState() => _LegalDocumentScreenState();
}

class _LegalDocumentScreenState extends State<LegalDocumentScreen> {
  late final Future<List<_LegalBlock>> _blocksFuture;

  @override
  void initState() {
    super.initState();
    _blocksFuture = _loadBlocks();
  }

  Future<List<_LegalBlock>> _loadBlocks() async {
    final html = await rootBundle.loadString(widget.assetPath);
    final matches = RegExp(
      r'<(h1|h2|p|li)>([\s\S]*?)</\1>',
      caseSensitive: false,
    ).allMatches(html);

    return matches
        .map(
          (match) => _LegalBlock(
            tag: match.group(1)!.toLowerCase(),
            text: _stripHtml(match.group(2) ?? ''),
          ),
        )
        .where((block) => block.text.isNotEmpty)
        .toList();
  }

  String _stripHtml(String input) {
    return input
        .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n')
        .replaceAll(RegExp(r'<[^>]+>'), '')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appBackground,
      appBar: AppBar(
        backgroundColor: context.appBackground,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<_LegalBlock>>(
        future: _blocksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text(
                  'Unable to load this document.',
                  style: TextStyle(color: context.appTextSecondary),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final blocks = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final block in blocks) _LegalBlockView(block: block),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _LegalBlock {
  final String tag;
  final String text;

  const _LegalBlock({
    required this.tag,
    required this.text,
  });
}

class _LegalBlockView extends StatelessWidget {
  final _LegalBlock block;

  const _LegalBlockView({required this.block});

  @override
  Widget build(BuildContext context) {
    switch (block.tag) {
      case 'h1':
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: Text(
            block.text,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.appTextPrimary,
            ),
          ),
        );
      case 'h2':
        return Padding(
          padding: const EdgeInsets.only(top: AppSpacing.md, bottom: AppSpacing.sm),
          child: Text(
            block.text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.appTextPrimary,
            ),
          ),
        );
      case 'li':
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const Gap(AppSpacing.sm),
              Expanded(
                child: Text(
                  block.text,
                  style: TextStyle(
                    height: 1.55,
                    color: context.appTextSecondary,
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: SelectableText(
            block.text,
            style: TextStyle(
              height: 1.6,
              color: context.appTextSecondary,
            ),
          ),
        );
    }
  }
}
