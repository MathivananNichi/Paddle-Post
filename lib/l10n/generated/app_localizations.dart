import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title shown by the OS (task switcher, etc.).
  ///
  /// In en, this message translates to:
  /// **'Paddle Post'**
  String get appTitle;

  /// Subtitle displayed beneath the app logo on the splash screen.
  ///
  /// In en, this message translates to:
  /// **'Scoring Companion'**
  String get scoringCompanion;

  /// Status text displayed above the progress indicator on the splash screen.
  ///
  /// In en, this message translates to:
  /// **'Starting Up'**
  String get startingUp;

  /// Overline tag displayed during the one-time device setup.
  ///
  /// In en, this message translates to:
  /// **'ONE-TIME SETUP'**
  String get oneTimeSetup;

  /// Main title on the connect PaddlePost screen.
  ///
  /// In en, this message translates to:
  /// **'Let\'s connect your PaddlePost.'**
  String get connectPaddlePostTitle;

  /// First instruction step for connecting PaddlePost.
  ///
  /// In en, this message translates to:
  /// **'Switch on the scoring unit. The light on the base comes on.'**
  String get connectStep1;

  /// Second instruction step for connecting PaddlePost.
  ///
  /// In en, this message translates to:
  /// **'Keep this phone close to the base.'**
  String get connectStep2;

  /// Button label to connect to the PaddlePost unit.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connectDevice;

  /// Loading state while discovering the PaddlePost unit.
  ///
  /// In en, this message translates to:
  /// **'Looking for PaddlePost...'**
  String get lookingForDevice;

  /// Action label or title to find and discover the PaddlePost device.
  ///
  /// In en, this message translates to:
  /// **'Find my PaddlePost'**
  String get findMyPaddlePost;

  /// Button label to pair with a device.
  ///
  /// In en, this message translates to:
  /// **'Pair'**
  String get pair;

  /// Status text while pairing with a device.
  ///
  /// In en, this message translates to:
  /// **'Pairing...'**
  String get pairing;

  /// Status label indicating a device is successfully paired.
  ///
  /// In en, this message translates to:
  /// **'Paired'**
  String get paired;

  /// Toast notification message when device is paired successfully.
  ///
  /// In en, this message translates to:
  /// **'Paired successfully'**
  String get pairedSuccessfully;

  /// Button label to unpair a device.
  ///
  /// In en, this message translates to:
  /// **'Unpair'**
  String get unpair;

  /// Title when the PaddlePost module is found.
  ///
  /// In en, this message translates to:
  /// **'Found it.'**
  String get foundIt;

  /// Instruction subtitle prompting the user to tap the module to pair.
  ///
  /// In en, this message translates to:
  /// **'Tap your module to pair. You only do this once on this phone.'**
  String get tapModuleToPair;

  /// Title displayed when device pairing is completed.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set.'**
  String get youreAllSet;

  /// Message informing the user that the phone will auto-reconnect to the device.
  ///
  /// In en, this message translates to:
  /// **'This phone will reconnect to {deviceName} on its own from now on. No setup before games.'**
  String reconnectOnItsOwn(String deviceName);

  /// Title displayed while searching for the module.
  ///
  /// In en, this message translates to:
  /// **'Looking for your module…'**
  String get lookingForYourModule;

  /// Subtitle displayed while search is in progress.
  ///
  /// In en, this message translates to:
  /// **'This takes a few seconds.'**
  String get thisTakesAFewSeconds;

  /// Button label to start playing after device setup is completed.
  ///
  /// In en, this message translates to:
  /// **'Let\'s play'**
  String get letsPlay;

  /// Login screen app bar title.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInAppBarTitle;

  /// Login screen headline.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginWelcome;

  /// Label for the email input field.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Label for the password input field.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Login submit button label.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInButton;

  /// Users list screen title.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get usersTitle;

  /// Tooltip for the sign-out action.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOutTooltip;

  /// Shown when the users list loads but is empty.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get usersEmpty;

  /// Tooltip for the theme-mode toggle action.
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get toggleThemeTooltip;

  /// Label for the retry action on error screens.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// Message for a server-side failure.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on the server'**
  String get failureServer;

  /// Message when the device is offline.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get failureNetwork;

  /// Message when a request times out.
  ///
  /// In en, this message translates to:
  /// **'The connection has timed out'**
  String get failureTimeout;

  /// Message when authentication is required or expired.
  ///
  /// In en, this message translates to:
  /// **'Session expired, please sign in'**
  String get failureUnauthorized;

  /// Message when a local storage operation fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to read local data'**
  String get failureCache;

  /// Message for an unanticipated failure.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get failureUnknown;

  /// Label for sound enabled status/action chip on home screen.
  ///
  /// In en, this message translates to:
  /// **'Sound on'**
  String get soundOn;

  /// Label for sound disabled status/action chip on home screen.
  ///
  /// In en, this message translates to:
  /// **'Sound off'**
  String get soundOff;

  /// Label for settings action chip on home screen.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Signal and battery status text for device card.
  ///
  /// In en, this message translates to:
  /// **'Signal strong · Battery {batteryPercent}'**
  String signalStrongBattery(String batteryPercent);

  /// Tag title for standard game mode.
  ///
  /// In en, this message translates to:
  /// **'STANDARD GAME'**
  String get standardGame;

  /// Label for Player 1.
  ///
  /// In en, this message translates to:
  /// **'Player 1'**
  String get player1;

  /// Label for Player 2.
  ///
  /// In en, this message translates to:
  /// **'Player 2'**
  String get player2;

  /// Versus abbreviation between players.
  ///
  /// In en, this message translates to:
  /// **'vs'**
  String get vs;

  /// Label for points needed to win standard game.
  ///
  /// In en, this message translates to:
  /// **'points to win'**
  String get pointsToWin;

  /// Label for margin of points required to win.
  ///
  /// In en, this message translates to:
  /// **'win by'**
  String get winBy;

  /// Label for return timer seconds.
  ///
  /// In en, this message translates to:
  /// **'to return'**
  String get toReturn;

  /// Button label to start a game.
  ///
  /// In en, this message translates to:
  /// **'Start game'**
  String get startGame;

  /// Title for custom game card.
  ///
  /// In en, this message translates to:
  /// **'Custom game'**
  String get customGame;

  /// Subtitle description for custom game card.
  ///
  /// In en, this message translates to:
  /// **'Shorter game or your own names'**
  String get customGameSubtitle;

  /// Title tag for last match card.
  ///
  /// In en, this message translates to:
  /// **'LAST MATCH'**
  String get lastMatch;

  /// Last match title with timestamp.
  ///
  /// In en, this message translates to:
  /// **'LAST MATCH · {time}'**
  String lastMatchTime(String time);

  /// Link label to view all match history.
  ///
  /// In en, this message translates to:
  /// **'All matches'**
  String get allMatches;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
