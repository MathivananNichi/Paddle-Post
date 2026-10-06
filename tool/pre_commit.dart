import 'dart:io';

/// Pre-commit script for PaddlePost.
///
/// Runs the essential checks before committing:
/// 1. Dart format with line-length 100
/// 2. Flutter analyze (static analysis & linter)
/// 3. Flutter test
///
/// Can be executed manually (`dart run tool/pre_commit.dart`) or installed into
/// `.git/hooks/pre-commit` (`dart run tool/pre_commit.dart --install`).
Future<void> main(List<String> args) async {
  if (args.contains('--install')) {
    _installGitHook();
    return;
  }

  stdout.writeln('Running pre-commit checks (line-length: 100)...\n');

  // 1. Format check with line-length 100
  stdout.write('1. Checking format (line-length: 100)... ');
  final formatResult = await Process.run('dart', [
    'format',
    '--line-length',
    '100',
    '--output=none',
    '--set-exit-if-changed',
    '.',
  ], runInShell: true);

  if (formatResult.exitCode != 0) {
    stdout.writeln('FAILED');
    stderr.writeln(formatResult.stdout);
    stderr.writeln(formatResult.stderr);
    stderr.writeln('Run `dart format --line-length 100 .` to format the code.');
    exit(1);
  }
  stdout.writeln('PASSED');

  // 2. Static analysis
  stdout.write('2. Running static analysis (flutter analyze)... ');
  final analyzeResult = await Process.run('flutter', ['analyze'], runInShell: true);

  if (analyzeResult.exitCode != 0) {
    stdout.writeln('FAILED');
    stderr.writeln(analyzeResult.stdout);
    stderr.writeln(analyzeResult.stderr);
    exit(1);
  }
  stdout.writeln('PASSED');

  // 3. Tests
  stdout.write('3. Running tests (flutter test)... ');
  final testResult = await Process.run('flutter', ['test'], runInShell: true);

  if (testResult.exitCode != 0) {
    stdout.writeln('FAILED');
    stderr.writeln(testResult.stdout);
    stderr.writeln(testResult.stderr);
    exit(1);
  }
  stdout.writeln('PASSED');

  stdout.writeln('\nAll pre-commit checks passed successfully!');
}

void _installGitHook() {
  final hooksDir = Directory('.git/hooks');
  if (!hooksDir.existsSync()) {
    stderr.writeln('Error: .git/hooks directory not found.');
    exit(1);
  }

  final preCommitFile = File('.git/hooks/pre-commit');
  const hookScript = '''#!/bin/sh
# Git pre-commit hook for PaddlePost
dart run tool/pre_commit.dart
''';

  preCommitFile.writeAsStringSync(hookScript);
  if (!Platform.isWindows) {
    Process.runSync('chmod', ['+x', preCommitFile.path]);
  }
  stdout.writeln('Pre-commit hook installed to .git/hooks/pre-commit');
}
