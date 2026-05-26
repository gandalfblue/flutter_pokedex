// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get searchHint => 'Search Pokémon...';

  @override
  String get statsLabel => 'Base Stats';

  @override
  String get abilitiesLabel => 'Abilities';

  @override
  String get typesLabel => 'Types';

  @override
  String get heightLabel => 'Height';

  @override
  String get weightLabel => 'Weight';

  @override
  String get errorMessage => 'Something went wrong. Please try again.';

  @override
  String get networkErrorMessage =>
      'No internet connection. Please check your network.';

  @override
  String get retryButton => 'Retry';

  @override
  String get noResultsFound => 'No Pokémon found.';

  @override
  String get loadingMessage => 'Loading...';

  @override
  String pokedexNumber(String number) {
    return '#$number';
  }

  @override
  String get homeSubtitle => 'Find your favourite Pokémon';

  @override
  String get filtersLabel => 'Filters: ';

  @override
  String get filterGenPrefix => 'Gen ';

  @override
  String get filterHeightSmall => 'Height: Small';

  @override
  String get filterHeightMedium => 'Height: Medium';

  @override
  String get filterHeightLarge => 'Height: Large';

  @override
  String get filterWeightLight => 'Weight: Light';

  @override
  String get filterWeightMedium => 'Weight: Medium';

  @override
  String get filterWeightHeavy => 'Weight: Heavy';

  @override
  String get errorLoadTitle => 'Something went wrong...';

  @override
  String get errorLoadMessage =>
      'We couldn\'t load the information right now. Check your connection and try again.';

  @override
  String get detailErrorTitle => 'Could not load Pokémon';

  @override
  String get detailWeightLabel => 'WEIGHT';

  @override
  String get detailHeightLabel => 'HEIGHT';

  @override
  String get detailCategoryLabel => 'CATEGORY';

  @override
  String get detailAbilityLabel => 'ABILITY';

  @override
  String get detailGenderLabel => 'GENDER';

  @override
  String get detailWeaknessesLabel => 'WEAKNESSES';

  @override
  String get detailWeaknessesError => 'Could not load weaknesses';

  @override
  String get detailNoWeaknesses => 'No known weaknesses';

  @override
  String get detailNa => 'N/A';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmptyTitle =>
      'You haven\'t marked any Pokémon as favourite';

  @override
  String get favoritesEmptyMessage =>
      'Tap the heart icon on your favourite Pokémon and they will appear here.';

  @override
  String favoritesCount(int count) {
    return '$count Pokémon saved';
  }

  @override
  String favoritesRemovedSnackbar(String name) {
    return '$name removed from favourites';
  }

  @override
  String get favoritesUndoButton => 'Undo';

  @override
  String get onboardingContinue => 'Continue';

  @override
  String get onboardingStart => 'Let\'s go!';

  @override
  String get onboardingOneTitleText => 'All Pokémon in one place';

  @override
  String get onboardingOneBodyText =>
      'Access a wide list of Pokémon from all generations created by Nintendo.';

  @override
  String get onboardingTwoTitleText => 'Keep your Pokédex up to date';

  @override
  String get onboardingTwoBodyText =>
      'Record and manage all your Pokémon. Review your collections and much more in the app.';

  @override
  String get filterModalTitle => 'Filter by your preferences';

  @override
  String get filterModalClearAll => 'Clear all';

  @override
  String get filterModalApply => 'Apply filters';

  @override
  String get filterModalViewAll => 'View all';

  @override
  String get filterTypeSelectHint => 'Select one or more types';

  @override
  String filterTypeSelected(int count) {
    return '$count type(s) selected';
  }

  @override
  String get filterGenerationHint => 'Select a generation';

  @override
  String get filterHeightHint => 'Select a height range';

  @override
  String get filterWeightHint => 'Select a weight range';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileTrainerLabel => 'Trainer';

  @override
  String get profileEditName => 'Edit name';

  @override
  String get profileEditNameHint => 'Trainer name';

  @override
  String get profileSave => 'Save';

  @override
  String get profileCancel => 'Cancel';

  @override
  String get profileStatViewed => 'Viewed';

  @override
  String get profileStatFavorites => 'Favorites';

  @override
  String get profileStatLevel => 'Level';

  @override
  String get profileFavoriteTypeLabel => 'Favourite type';

  @override
  String get profileFavoriteTypeNone => 'No favourites yet';

  @override
  String get profileAchievementsTitle => 'Achievements';

  @override
  String get profileAchFirstSteps => 'First Steps';

  @override
  String get profileAchFirstStepsSub => 'View your first Pokémon';

  @override
  String get profileAchExplorer => 'Explorer';

  @override
  String get profileAchExplorerSub => 'View 10 Pokémon';

  @override
  String get profileAchCollector => 'Collector';

  @override
  String get profileAchCollectorSub => 'Add 5 to favourites';

  @override
  String get profileAchMaster => 'Pokémon Master';

  @override
  String get profileAchMasterSub => 'View 50 Pokémon';

  @override
  String get profileAvatarSectionTitle => 'Choose avatar';

  @override
  String get profileAboutTitle => 'About the app';

  @override
  String get profileAboutVersion => 'Version 1.0.0';

  @override
  String get profileAboutData => 'Data from PokéAPI';

  @override
  String get loginTitle => 'Sign In';

  @override
  String get loginSubtitle => 'Enter your credentials to continue';

  @override
  String get loginUsernameHint => 'Username';

  @override
  String get loginEmailHint => 'Email';

  @override
  String get loginPasswordHint => 'Password';

  @override
  String get loginButton => 'Sign In';

  @override
  String get loginNoAccount => 'Don\'t have an account?';

  @override
  String get loginRegisterLink => 'Register';

  @override
  String get loginErrorEmpty => 'Please fill in all fields.';

  @override
  String get loginErrorInvalid => 'Invalid username or password.';

  @override
  String get registerTitle => 'Create Account';

  @override
  String get registerSubtitle => 'Join the Pokédex world';

  @override
  String get registerUsernameHint => 'Username';

  @override
  String get registerEmailHint => 'Email';

  @override
  String get registerPasswordHint => 'Password';

  @override
  String get registerConfirmPasswordHint => 'Confirm Password';

  @override
  String get registerGenderTitle => 'Choose your trainer type';

  @override
  String get registerGenderTrainer => 'Trainer';

  @override
  String get registerGenderTrainerFemale => 'Trainer ♀';

  @override
  String get registerButton => 'Create Account';

  @override
  String get registerHaveAccount => 'Already have an account?';

  @override
  String get registerLoginLink => 'Sign In';

  @override
  String get registerErrorPasswordMismatch => 'Passwords do not match.';

  @override
  String get registerPasswordHint2 =>
      'Min. 10 chars, letters, numbers & special character';

  @override
  String get registerPasswordStrengthWeak => 'Weak password';

  @override
  String get registerPasswordStrengthStrong => 'Strong password';

  @override
  String get authLogout => 'Sign Out';

  @override
  String get authLogoutConfirm => 'Are you sure you want to sign out?';

  @override
  String get authLogoutConfirmYes => 'Sign Out';

  @override
  String get authLogoutConfirmNo => 'Cancel';

  @override
  String authWelcome(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get authErrorUsernameRequired => 'Username is required.';

  @override
  String get authErrorInvalidEmail => 'Enter a valid email address.';

  @override
  String get authErrorWeakPassword =>
      'Password must have at least 10 characters, letters, numbers and a special character.';

  @override
  String get authErrorUsernameTaken => 'Username is already taken.';

  @override
  String get authErrorEmailTaken => 'Email is already registered.';
}
