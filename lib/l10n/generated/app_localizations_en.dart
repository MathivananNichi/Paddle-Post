// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Paddle Post';

  @override
  String get scoringCompanion => 'Scoring Companion';

  @override
  String get startingUp => 'Starting Up';

  @override
  String get oneTimeSetup => 'ONE-TIME SETUP';

  @override
  String get connectPaddlePostTitle => 'Let\'s connect your PaddlePost.';

  @override
  String get connectStep1 => 'Switch on the scoring unit. The light on the base comes on.';

  @override
  String get connectStep2 => 'Keep this phone close to the base.';

  @override
  String get connectDevice => 'Connect';

  @override
  String get lookingForDevice => 'Looking for PaddlePost...';

  @override
  String get findMyPaddlePost => 'Find my PaddlePost';

  @override
  String get pair => 'Pair';

  @override
  String get pairing => 'Pairing...';

  @override
  String get paired => 'Paired';

  @override
  String get pairedSuccessfully => 'Paired successfully';

  @override
  String get unpair => 'Unpair';

  @override
  String get foundIt => 'Found it.';

  @override
  String get tapModuleToPair => 'Tap your module to pair. You only do this once on this phone.';

  @override
  String get youreAllSet => 'You\'re all set.';

  @override
  String reconnectOnItsOwn(String deviceName) {
    return 'This phone will reconnect to $deviceName on its own from now on. No setup before games.';
  }

  @override
  String get lookingForYourModule => 'Looking for your module…';

  @override
  String get thisTakesAFewSeconds => 'This takes a few seconds.';

  @override
  String get letsPlay => 'Let\'s play';

  @override
  String get signInAppBarTitle => 'Sign in';

  @override
  String get loginWelcome => 'Welcome back';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get signInButton => 'Sign in';

  @override
  String get usersTitle => 'Users';

  @override
  String get signOutTooltip => 'Sign out';

  @override
  String get usersEmpty => 'No users found';

  @override
  String get toggleThemeTooltip => 'Toggle theme';

  @override
  String get retryButton => 'Retry';

  @override
  String get failureServer => 'Something went wrong on the server';

  @override
  String get failureNetwork => 'No internet connection';

  @override
  String get failureTimeout => 'The connection has timed out';

  @override
  String get failureUnauthorized => 'Session expired, please sign in';

  @override
  String get failureCache => 'Failed to read local data';

  @override
  String get failureUnknown => 'An unexpected error occurred';

  @override
  String get soundOn => 'Sound on';

  @override
  String get soundOff => 'Sound off';

  @override
  String get settings => 'Settings';

  @override
  String signalStrongBattery(String batteryPercent) {
    return 'Signal strong · Battery $batteryPercent';
  }

  @override
  String get standardGame => 'STANDARD GAME';

  @override
  String get player1 => 'Player 1';

  @override
  String get player2 => 'Player 2';

  @override
  String get vs => 'vs';

  @override
  String get pointsToWin => 'points to win';

  @override
  String get winBy => 'win by';

  @override
  String get toReturn => 'to return';

  @override
  String get startGame => 'Start game';

  @override
  String get customGame => 'Custom game';

  @override
  String get customGameSubtitle => 'Shorter game or your own names';

  @override
  String get lastMatch => 'LAST MATCH';

  @override
  String lastMatchTime(String time) {
    return 'LAST MATCH · $time';
  }

  @override
  String get allMatches => 'All matches';
}
