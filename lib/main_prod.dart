import 'package:paddle_post/bootstrap.dart';
import 'package:paddle_post/core/core.dart';

/// Entry point for the **prod** flavor.
///
/// Run with `flutter run -t lib/main_prod.dart`.
Future<void> main() => bootstrap(Flavor.prod);
