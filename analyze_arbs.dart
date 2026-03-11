import 'dart:convert';
import 'dart:io';

void main() async {
  final dir = Directory('lib/l10n');
  final files = await dir.list().where((f) => f.path.endsWith('.arb')).toList();
  
  final out = File(r'C:\Users\lebac\.gemini\antigravity\brain\aa8fa852-d911-437f-b9ee-dfd1fbaa10fc\analysis_results.md');
  final buffer = StringBuffer();
  
  buffer.writeln('# Localization Placeholder Analysis');
  buffer.writeln('This document lists all auto-generated suffixes found inside the translation files.');
  
  int totalFound = 0;
  
  for (final file in files) {
    if (file is File) {
      final content = await file.readAsString();
      final Map<String, dynamic> data = jsonDecode(content);
      
      final locale = data['@@locale'] as String?;
      if (locale == null || locale == 'en' || locale == 'vi') continue; // Skip en and vi which we know are clean
      
      final suffixRegex = RegExp(r'\([a-z_]{2,5}\)$', caseSensitive: false);
      final placeholders = <String, String>{};
      
      data.forEach((key, value) {
        if (value is String && suffixRegex.hasMatch(value)) {
          placeholders[key] = value;
        }
      });
      
      if (placeholders.isNotEmpty) {
        buffer.writeln('\n### Locale: `$locale`');
        buffer.writeln('- **Total placeholders found:** ${placeholders.length}');
        buffer.writeln('- **Examples:**');
        
        int count = 0;
        placeholders.forEach((key, value) {
          if (count < 5) { // Show up to 5 examples
            buffer.writeln('  - `$key`: "$value"');
          }
          count++;
        });
        
        totalFound += placeholders.length;
      }
    }
  }
  
  buffer.writeln('\n---\n**TOTAL PLACEHOLDERS ACROSS 10 LANGUAGES:** $totalFound');
  await out.writeAsString(buffer.toString());
  print('Analysis saved to analysis_results.md');
}
