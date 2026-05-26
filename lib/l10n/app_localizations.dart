import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get appTitle;

  /// Search bar placeholder
  ///
  /// In en, this message translates to:
  /// **'Search Pokémon...'**
  String get searchHint;

  /// Section label for base stats
  ///
  /// In en, this message translates to:
  /// **'Base Stats'**
  String get statsLabel;

  /// Section label for abilities
  ///
  /// In en, this message translates to:
  /// **'Abilities'**
  String get abilitiesLabel;

  /// Section label for types
  ///
  /// In en, this message translates to:
  /// **'Types'**
  String get typesLabel;

  /// Height field label
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get heightLabel;

  /// Weight field label
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weightLabel;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorMessage;

  /// Network error message
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network.'**
  String get networkErrorMessage;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// Empty search results message
  ///
  /// In en, this message translates to:
  /// **'No Pokémon found.'**
  String get noResultsFound;

  /// Loading indicator message
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingMessage;

  /// Pokédex number format
  ///
  /// In en, this message translates to:
  /// **'#{number}'**
  String pokedexNumber(String number);

  /// Subtitle below the home title
  ///
  /// In en, this message translates to:
  /// **'Find your favourite Pokémon'**
  String get homeSubtitle;

  /// Label before active filter chips
  ///
  /// In en, this message translates to:
  /// **'Filters: '**
  String get filtersLabel;

  /// Prefix for generation chip
  ///
  /// In en, this message translates to:
  /// **'Gen '**
  String get filterGenPrefix;

  /// Height chip – small
  ///
  /// In en, this message translates to:
  /// **'Height: Small'**
  String get filterHeightSmall;

  /// Height chip – medium
  ///
  /// In en, this message translates to:
  /// **'Height: Medium'**
  String get filterHeightMedium;

  /// Height chip – large
  ///
  /// In en, this message translates to:
  /// **'Height: Large'**
  String get filterHeightLarge;

  /// Weight chip – light
  ///
  /// In en, this message translates to:
  /// **'Weight: Light'**
  String get filterWeightLight;

  /// Weight chip – medium
  ///
  /// In en, this message translates to:
  /// **'Weight: Medium'**
  String get filterWeightMedium;

  /// Weight chip – heavy
  ///
  /// In en, this message translates to:
  /// **'Weight: Heavy'**
  String get filterWeightHeavy;

  /// Error title when list fails
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get errorLoadTitle;

  /// Error body when list fails
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load the information right now. Check your connection and try again.'**
  String get errorLoadMessage;

  /// Detail page error title
  ///
  /// In en, this message translates to:
  /// **'Could not load Pokémon'**
  String get detailErrorTitle;

  /// Weight label in detail
  ///
  /// In en, this message translates to:
  /// **'WEIGHT'**
  String get detailWeightLabel;

  /// Height label in detail
  ///
  /// In en, this message translates to:
  /// **'HEIGHT'**
  String get detailHeightLabel;

  /// Category label in detail
  ///
  /// In en, this message translates to:
  /// **'CATEGORY'**
  String get detailCategoryLabel;

  /// Ability label in detail
  ///
  /// In en, this message translates to:
  /// **'ABILITY'**
  String get detailAbilityLabel;

  /// Gender section label
  ///
  /// In en, this message translates to:
  /// **'GENDER'**
  String get detailGenderLabel;

  /// Weaknesses section label
  ///
  /// In en, this message translates to:
  /// **'WEAKNESSES'**
  String get detailWeaknessesLabel;

  /// Weaknesses error message
  ///
  /// In en, this message translates to:
  /// **'Could not load weaknesses'**
  String get detailWeaknessesError;

  /// Empty weaknesses message
  ///
  /// In en, this message translates to:
  /// **'No known weaknesses'**
  String get detailNoWeaknesses;

  /// Not available placeholder
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get detailNa;

  /// Favorites page title
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// Empty state title on favorites
  ///
  /// In en, this message translates to:
  /// **'You haven\'t marked any Pokémon as favourite'**
  String get favoritesEmptyTitle;

  /// Empty state message on favorites
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon on your favourite Pokémon and they will appear here.'**
  String get favoritesEmptyMessage;

  /// Count of saved favourite Pokémon
  ///
  /// In en, this message translates to:
  /// **'{count} Pokémon saved'**
  String favoritesCount(int count);

  /// Snackbar when a favourite is removed
  ///
  /// In en, this message translates to:
  /// **'{name} removed from favourites'**
  String favoritesRemovedSnackbar(String name);

  /// Undo in favorites snackbar
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get favoritesUndoButton;

  /// Onboarding continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinue;

  /// Onboarding final button
  ///
  /// In en, this message translates to:
  /// **'Let\'s go!'**
  String get onboardingStart;

  /// Onboarding screen 1 title
  ///
  /// In en, this message translates to:
  /// **'All Pokémon in one place'**
  String get onboardingOneTitleText;

  /// Onboarding screen 1 body
  ///
  /// In en, this message translates to:
  /// **'Access a wide list of Pokémon from all generations created by Nintendo.'**
  String get onboardingOneBodyText;

  /// Onboarding screen 2 title
  ///
  /// In en, this message translates to:
  /// **'Keep your Pokédex up to date'**
  String get onboardingTwoTitleText;

  /// Onboarding screen 2 body
  ///
  /// In en, this message translates to:
  /// **'Record and manage all your Pokémon. Review your collections and much more in the app.'**
  String get onboardingTwoBodyText;

  /// Filter modal title
  ///
  /// In en, this message translates to:
  /// **'Filter by your preferences'**
  String get filterModalTitle;

  /// Clear all filters button
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get filterModalClearAll;

  /// Apply filters button
  ///
  /// In en, this message translates to:
  /// **'Apply filters'**
  String get filterModalApply;

  /// View all button
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get filterModalViewAll;

  /// Hint when no type selected
  ///
  /// In en, this message translates to:
  /// **'Select one or more types'**
  String get filterTypeSelectHint;

  /// How many types are selected
  ///
  /// In en, this message translates to:
  /// **'{count} type(s) selected'**
  String filterTypeSelected(int count);

  /// Hint for generation filter
  ///
  /// In en, this message translates to:
  /// **'Select a generation'**
  String get filterGenerationHint;

  /// Hint for height filter
  ///
  /// In en, this message translates to:
  /// **'Select a height range'**
  String get filterHeightHint;

  /// Hint for weight filter
  ///
  /// In en, this message translates to:
  /// **'Select a weight range'**
  String get filterWeightHint;

  /// Profile page title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// Trainer subtitle label
  ///
  /// In en, this message translates to:
  /// **'Trainer'**
  String get profileTrainerLabel;

  /// Edit name button tooltip
  ///
  /// In en, this message translates to:
  /// **'Edit name'**
  String get profileEditName;

  /// Edit name text field hint
  ///
  /// In en, this message translates to:
  /// **'Trainer name'**
  String get profileEditNameHint;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profileSave;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileCancel;

  /// Pokémon viewed stat label
  ///
  /// In en, this message translates to:
  /// **'Viewed'**
  String get profileStatViewed;

  /// Favorites stat label
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get profileStatFavorites;

  /// Trainer level stat label
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get profileStatLevel;

  /// Favourite type section label
  ///
  /// In en, this message translates to:
  /// **'Favourite type'**
  String get profileFavoriteTypeLabel;

  /// Message when no favourite type
  ///
  /// In en, this message translates to:
  /// **'No favourites yet'**
  String get profileFavoriteTypeNone;

  /// Achievements section title
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get profileAchievementsTitle;

  /// Achievement: first steps title
  ///
  /// In en, this message translates to:
  /// **'First Steps'**
  String get profileAchFirstSteps;

  /// Achievement: first steps subtitle
  ///
  /// In en, this message translates to:
  /// **'View your first Pokémon'**
  String get profileAchFirstStepsSub;

  /// Achievement: explorer title
  ///
  /// In en, this message translates to:
  /// **'Explorer'**
  String get profileAchExplorer;

  /// Achievement: explorer subtitle
  ///
  /// In en, this message translates to:
  /// **'View 10 Pokémon'**
  String get profileAchExplorerSub;

  /// Achievement: collector title
  ///
  /// In en, this message translates to:
  /// **'Collector'**
  String get profileAchCollector;

  /// Achievement: collector subtitle
  ///
  /// In en, this message translates to:
  /// **'Add 5 to favourites'**
  String get profileAchCollectorSub;

  /// Achievement: master title
  ///
  /// In en, this message translates to:
  /// **'Pokémon Master'**
  String get profileAchMaster;

  /// Achievement: master subtitle
  ///
  /// In en, this message translates to:
  /// **'View 50 Pokémon'**
  String get profileAchMasterSub;

  /// Avatar picker section title
  ///
  /// In en, this message translates to:
  /// **'Choose avatar'**
  String get profileAvatarSectionTitle;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get profileAboutTitle;

  /// App version label
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get profileAboutVersion;

  /// Data source label
  ///
  /// In en, this message translates to:
  /// **'Data from PokéAPI'**
  String get profileAboutData;

  /// Login page title
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginTitle;

  /// Login page subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials to continue'**
  String get loginSubtitle;

  /// Username field hint
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get loginUsernameHint;

  /// Email field hint
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailHint;

  /// Password field hint
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordHint;

  /// Login button label
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginButton;

  /// No account prompt
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginNoAccount;

  /// Register link text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get loginRegisterLink;

  /// Empty fields error
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields.'**
  String get loginErrorEmpty;

  /// Wrong credentials error
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password.'**
  String get loginErrorInvalid;

  /// Register page title
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerTitle;

  /// Register page subtitle
  ///
  /// In en, this message translates to:
  /// **'Join the Pokédex world'**
  String get registerSubtitle;

  /// Register username hint
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get registerUsernameHint;

  /// Register email hint
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get registerEmailHint;

  /// Register password hint
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerPasswordHint;

  /// Confirm password hint
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get registerConfirmPasswordHint;

  /// Trainer gender selection title
  ///
  /// In en, this message translates to:
  /// **'Choose your trainer type'**
  String get registerGenderTitle;

  /// Male trainer option
  ///
  /// In en, this message translates to:
  /// **'Trainer'**
  String get registerGenderTrainer;

  /// Female trainer option
  ///
  /// In en, this message translates to:
  /// **'Trainer ♀'**
  String get registerGenderTrainerFemale;

  /// Register button label
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerButton;

  /// Have account prompt
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get registerHaveAccount;

  /// Login link text
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get registerLoginLink;

  /// Password mismatch error
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get registerErrorPasswordMismatch;

  /// Password strength hint
  ///
  /// In en, this message translates to:
  /// **'Min. 10 chars, letters, numbers & special character'**
  String get registerPasswordHint2;

  /// Weak password label
  ///
  /// In en, this message translates to:
  /// **'Weak password'**
  String get registerPasswordStrengthWeak;

  /// Strong password label
  ///
  /// In en, this message translates to:
  /// **'Strong password'**
  String get registerPasswordStrengthStrong;

  /// Logout button label
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get authLogout;

  /// Logout confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get authLogoutConfirm;

  /// Confirm logout
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get authLogoutConfirmYes;

  /// Cancel logout
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get authLogoutConfirmNo;

  /// Welcome message after login
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String authWelcome(String name);

  /// Register error: empty username
  ///
  /// In en, this message translates to:
  /// **'Username is required.'**
  String get authErrorUsernameRequired;

  /// Register error: invalid email
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address.'**
  String get authErrorInvalidEmail;

  /// Register error: weak password
  ///
  /// In en, this message translates to:
  /// **'Password must have at least 10 characters, letters, numbers and a special character.'**
  String get authErrorWeakPassword;

  /// Register error: duplicate username
  ///
  /// In en, this message translates to:
  /// **'Username is already taken.'**
  String get authErrorUsernameTaken;

  /// Register error: duplicate email
  ///
  /// In en, this message translates to:
  /// **'Email is already registered.'**
  String get authErrorEmailTaken;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
