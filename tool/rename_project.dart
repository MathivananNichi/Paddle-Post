// Rebrands this base project into a new app.
//
// Usage:
//   dart run tool/rename_project.dart --package-name=com.company.app --app-name="My App"
//
// Replaces the placeholder package id (com.example.flutter_base_project),
// display name (Flutter Base Project) and Dart package name
// (flutter_base_project) across pubspec.yaml, all Dart source, and the
// Android/iOS/macOS/Linux/Windows/web platform folders, then moves
// MainActivity.kt to match the new Android package path.
//
// Run once, right after cloning, from the repository root.
import 'dart:io';

void main(List<String> args) {
  final params = <String, String>{};
  for (final arg in args) {
    final eq = arg.indexOf('=');
    if (arg.startsWith('--') && eq != -1) {
      params[arg.substring(2, eq)] = arg.substring(eq + 1);
    }
  }

  final packageName = params['package-name'];
  final appName = params['app-name'];

  if (packageName == null || appName == null || appName.trim().isEmpty) {
    stderr.writeln(
      'Usage: dart run tool/rename_project.dart '
      '--package-name=com.company.app --app-name="My App"',
    );
    exit(1);
  }

  final packageNamePattern = RegExp(
    r'^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$',
  );
  if (!packageNamePattern.hasMatch(packageName)) {
    stderr.writeln(
      'Invalid --package-name "$packageName". '
      'Expected reverse-DNS form, e.g. com.company.app',
    );
    exit(1);
  }

  if (!File('pubspec.yaml').existsSync()) {
    stderr.writeln('Run this from the repository root (pubspec.yaml not found).');
    exit(1);
  }

  final dartName = _toDartName(appName);
  final segments = packageName.split('.');
  final companyId = segments.sublist(0, segments.length - 1).join('.');

  // Longest/most-specific patterns first so a shorter pattern can't
  // partially rewrite a longer one before it gets its turn.
  final replacements = <MapEntry<String, String>>[
    MapEntry('com.example.flutterBaseProject', packageName),
    MapEntry('com.example.flutter_base_project', packageName),
    MapEntry('com.example', companyId),
    MapEntry('Flutter Base Project', appName),
    MapEntry('flutter_base_project', dartName),
  ];

  // The launcher label is a plain project-name string in the manifest
  // (not the "Flutter Base Project" display string), so the generic
  // dart-name rule above would otherwise turn it into the Dart package
  // name instead of the human-readable app name. Fix it up first.
  final manifest = File('android/app/src/main/AndroidManifest.xml');
  if (manifest.existsSync()) {
    final content = manifest.readAsStringSync();
    final updated = content.replaceAll(
      'android:label="flutter_base_project"',
      'android:label="$appName"',
    );
    if (updated != content) manifest.writeAsStringSync(updated);
  }

  final explicitFiles = <String>[
    'pubspec.yaml',
    'README.md',
    'lib/l10n/app_en.arb',
    'android/app/build.gradle.kts',
    'android/app/src/main/AndroidManifest.xml',
    'ios/Runner/Info.plist',
    'ios/Runner.xcodeproj/project.pbxproj',
    'macos/Runner/Configs/AppInfo.xcconfig',
    'macos/Runner.xcodeproj/project.pbxproj',
    'macos/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme',
    'linux/CMakeLists.txt',
    'linux/runner/my_application.cc',
    'windows/CMakeLists.txt',
    'windows/runner/Runner.rc',
    'windows/runner/main.cpp',
    'web/manifest.json',
    'web/index.html',
  ];

  var changedFiles = 0;

  for (final relPath in explicitFiles) {
    final file = File(relPath);
    if (!file.existsSync()) continue;
    if (_applyReplacements(file, replacements)) changedFiles++;
  }

  for (final dirName in ['lib', 'test']) {
    final dir = Directory(dirName);
    if (!dir.existsSync()) continue;
    for (final entity in dir.listSync(recursive: true)) {
      if (entity is File && entity.path.endsWith('.dart')) {
        if (_applyReplacements(entity, replacements)) changedFiles++;
      }
    }
  }

  _moveMainActivity(packageName);

  stdout.writeln('Done. Updated $changedFiles file(s).');
  stdout.writeln('  Package name : $packageName');
  stdout.writeln('  App name     : $appName');
  stdout.writeln('  Dart package : $dartName');
  stdout.writeln();

  // A new Dart package name can re-sort before/after `package:flutter`
  // imports, tripping the directives_ordering lint. `pub get` refreshes
  // the package config for the new name, and `dart fix` auto-reorders
  // imports, so the project analyzes clean immediately.
  _run('flutter', ['pub', 'get']);
  _run('dart', ['fix', '--apply']);

  stdout.writeln();
  stdout.writeln('Remaining steps:');
  stdout.writeln('  flutter gen-l10n');
  stdout.writeln('  dart run build_runner build --delete-conflicting-outputs');
  stdout.writeln('  flutter analyze');
  stdout.writeln('  flutter test');
}

void _run(String executable, List<String> arguments) {
  stdout.writeln('Running $executable ${arguments.join(' ')}...');
  try {
    final result = Process.runSync(executable, arguments);
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  } on ProcessException {
    stderr.writeln('Could not run "$executable" — please run it manually.');
  }
}

bool _applyReplacements(File file, List<MapEntry<String, String>> replacements) {
  final original = file.readAsStringSync();
  var updated = original;
  for (final replacement in replacements) {
    updated = updated.replaceAll(replacement.key, replacement.value);
  }
  if (updated != original) {
    file.writeAsStringSync(updated);
    return true;
  }
  return false;
}

void _moveMainActivity(String packageName) {
  final oldDir = Directory(
    'android/app/src/main/kotlin/com/example/flutter_base_project',
  );
  final oldFile = File('${oldDir.path}/MainActivity.kt');
  if (!oldFile.existsSync()) return;

  _applyReplacements(oldFile, [
    MapEntry('com.example.flutter_base_project', packageName),
  ]);

  final newDir = Directory(
    'android/app/src/main/kotlin/${packageName.replaceAll('.', '/')}',
  );
  if (newDir.path == oldDir.path) return;

  newDir.createSync(recursive: true);
  oldFile.copySync('${newDir.path}/MainActivity.kt');
  oldDir.deleteSync(recursive: true);
  _removeEmptyParents(oldDir.parent);

  stdout.writeln('Moved MainActivity.kt to ${newDir.path}/');
}

void _removeEmptyParents(Directory dir) {
  if (!dir.existsSync() || dir.listSync().isNotEmpty) return;
  dir.deleteSync();
  _removeEmptyParents(dir.parent);
}

String _toDartName(String appName) {
  var name = appName.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '_');
  name = name.replaceAll(RegExp(r'^_+|_+$'), '');
  if (name.isEmpty) name = 'app';
  if (RegExp(r'^[0-9]').hasMatch(name)) name = 'app_$name';
  return name;
}
