import 'package:flutter_base_project/bootstrap.dart';
import 'package:flutter_base_project/core/config/app_config.dart';

/// Default entry point.
///
/// For multiple flavors, add `main_dev.dart` / `main_staging.dart` /
/// `main_prod.dart` that each call `bootstrap(Flavor.x)`, then run with
/// `flutter run -t lib/main_dev.dart`. This default uses the dev flavor.
Future<void> main() => bootstrap(Flavor.dev);
