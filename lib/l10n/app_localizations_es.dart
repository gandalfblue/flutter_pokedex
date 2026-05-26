// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pokédex';

  @override
  String get searchHint => 'Buscar Pokémon...';

  @override
  String get statsLabel => 'Estadísticas Base';

  @override
  String get abilitiesLabel => 'Habilidades';

  @override
  String get typesLabel => 'Tipos';

  @override
  String get heightLabel => 'Altura';

  @override
  String get weightLabel => 'Peso';

  @override
  String get errorMessage => 'Algo salió mal. Por favor inténtalo de nuevo.';

  @override
  String get networkErrorMessage =>
      'Sin conexión a internet. Por favor revisa tu red.';

  @override
  String get retryButton => 'Reintentar';

  @override
  String get noResultsFound => 'No se encontraron Pokémon.';

  @override
  String get loadingMessage => 'Cargando...';

  @override
  String pokedexNumber(String number) {
    return '#$number';
  }

  @override
  String get homeSubtitle => 'Busca tu Pokémon favorito';

  @override
  String get filtersLabel => 'Filtros: ';

  @override
  String get filterGenPrefix => 'Gen ';

  @override
  String get filterHeightSmall => 'Altura: Pequeño';

  @override
  String get filterHeightMedium => 'Altura: Mediano';

  @override
  String get filterHeightLarge => 'Altura: Grande';

  @override
  String get filterWeightLight => 'Peso: Ligero';

  @override
  String get filterWeightMedium => 'Peso: Mediano';

  @override
  String get filterWeightHeavy => 'Peso: Pesado';

  @override
  String get errorLoadTitle => 'Algo salió mal...';

  @override
  String get errorLoadMessage =>
      'No pudimos cargar la información en este momento. Verifica tu conexión e intenta nuevamente.';

  @override
  String get detailErrorTitle => 'No se pudo cargar el Pokémon';

  @override
  String get detailWeightLabel => 'PESO';

  @override
  String get detailHeightLabel => 'ALTURA';

  @override
  String get detailCategoryLabel => 'CATEGORÍA';

  @override
  String get detailAbilityLabel => 'HABILIDAD';

  @override
  String get detailGenderLabel => 'GÉNERO';

  @override
  String get detailWeaknessesLabel => 'DEBILIDADES';

  @override
  String get detailWeaknessesError => 'No se pudieron cargar las debilidades';

  @override
  String get detailNoWeaknesses => 'Sin debilidades conocidas';

  @override
  String get detailNa => 'N/A';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmptyTitle =>
      'No has marcado ningún Pokémon como favorito';

  @override
  String get favoritesEmptyMessage =>
      'Haz clic en el ícono de corazón de tus Pokémon favoritos y aparecerán aquí.';

  @override
  String favoritesCount(int count) {
    return '$count Pokémon guardados';
  }

  @override
  String favoritesRemovedSnackbar(String name) {
    return '$name eliminado de favoritos';
  }

  @override
  String get favoritesUndoButton => 'Deshacer';

  @override
  String get onboardingContinue => 'Continuar';

  @override
  String get onboardingStart => 'Empezamos';

  @override
  String get onboardingOneTitleText => 'Todos los Pokémon en un solo lugar';

  @override
  String get onboardingOneBodyText =>
      'Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo.';

  @override
  String get onboardingTwoTitleText => 'Mantén tu Pokédex actualizada';

  @override
  String get onboardingTwoBodyText =>
      'Registra y gestiona todos tus Pokémon. Revisa tus colecciones y muchas más en la aplicación.';

  @override
  String get filterModalTitle => 'Filtra por tus preferencias';

  @override
  String get filterModalClearAll => 'Limpiar todo';

  @override
  String get filterModalApply => 'Aplicar filtros';

  @override
  String get filterModalViewAll => 'Ver todos';

  @override
  String get filterTypeSelectHint => 'Selecciona uno o más tipos';

  @override
  String filterTypeSelected(int count) {
    return '$count tipo(s) seleccionado(s)';
  }

  @override
  String get filterGenerationHint => 'Selecciona una generación';

  @override
  String get filterHeightHint => 'Selecciona un rango de altura';

  @override
  String get filterWeightHint => 'Selecciona un rango de peso';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileTrainerLabel => 'Entrenador';

  @override
  String get profileEditName => 'Editar nombre';

  @override
  String get profileEditNameHint => 'Nombre del entrenador';

  @override
  String get profileSave => 'Guardar';

  @override
  String get profileCancel => 'Cancelar';

  @override
  String get profileStatViewed => 'Vistos';

  @override
  String get profileStatFavorites => 'Favoritos';

  @override
  String get profileStatLevel => 'Nivel';

  @override
  String get profileFavoriteTypeLabel => 'Tipo favorito';

  @override
  String get profileFavoriteTypeNone => 'Aún no hay favoritos';

  @override
  String get profileAchievementsTitle => 'Logros';

  @override
  String get profileAchFirstSteps => 'Primeros Pasos';

  @override
  String get profileAchFirstStepsSub => 'Ve tu primer Pokémon';

  @override
  String get profileAchExplorer => 'Explorador';

  @override
  String get profileAchExplorerSub => 'Ve 10 Pokémon';

  @override
  String get profileAchCollector => 'Coleccionista';

  @override
  String get profileAchCollectorSub => 'Agrega 5 a favoritos';

  @override
  String get profileAchMaster => 'Maestro Pokémon';

  @override
  String get profileAchMasterSub => 'Ve 50 Pokémon';

  @override
  String get profileAvatarSectionTitle => 'Elegir avatar';

  @override
  String get profileAboutTitle => 'Acerca de';

  @override
  String get profileAboutVersion => 'Versión 1.0.0';

  @override
  String get profileAboutData => 'Datos de PokéAPI';

  @override
  String get loginTitle => 'Iniciar Sesión';

  @override
  String get loginSubtitle => 'Ingresa tus credenciales para continuar';

  @override
  String get loginUsernameHint => 'Nombre de usuario';

  @override
  String get loginEmailHint => 'Correo electrónico';

  @override
  String get loginPasswordHint => 'Contraseña';

  @override
  String get loginButton => 'Iniciar Sesión';

  @override
  String get loginNoAccount => '¿No tienes cuenta?';

  @override
  String get loginRegisterLink => 'Regístrate';

  @override
  String get loginErrorEmpty => 'Por favor completa todos los campos.';

  @override
  String get loginErrorInvalid => 'Usuario o contraseña incorrectos.';

  @override
  String get registerTitle => 'Crear Cuenta';

  @override
  String get registerSubtitle => 'Únete al mundo Pokédex';

  @override
  String get registerUsernameHint => 'Nombre de usuario';

  @override
  String get registerEmailHint => 'Correo electrónico';

  @override
  String get registerPasswordHint => 'Contraseña';

  @override
  String get registerConfirmPasswordHint => 'Confirmar contraseña';

  @override
  String get registerGenderTitle => 'Elige tu tipo de entrenador';

  @override
  String get registerGenderTrainer => 'Entrenador';

  @override
  String get registerGenderTrainerFemale => 'Entrenadora';

  @override
  String get registerButton => 'Crear Cuenta';

  @override
  String get registerHaveAccount => '¿Ya tienes cuenta?';

  @override
  String get registerLoginLink => 'Inicia Sesión';

  @override
  String get registerErrorPasswordMismatch => 'Las contraseñas no coinciden.';

  @override
  String get registerPasswordHint2 =>
      'Mín. 10 caracteres, letras, números y un carácter especial';

  @override
  String get registerPasswordStrengthWeak => 'Contraseña débil';

  @override
  String get registerPasswordStrengthStrong => 'Contraseña segura';

  @override
  String get authLogout => 'Cerrar Sesión';

  @override
  String get authLogoutConfirm => '¿Estás seguro que quieres cerrar sesión?';

  @override
  String get authLogoutConfirmYes => 'Cerrar Sesión';

  @override
  String get authLogoutConfirmNo => 'Cancelar';

  @override
  String authWelcome(String name) {
    return '¡Bienvenido, $name!';
  }

  @override
  String get authErrorUsernameRequired => 'El nombre de usuario es requerido.';

  @override
  String get authErrorInvalidEmail => 'Ingresa un correo electrónico válido.';

  @override
  String get authErrorWeakPassword =>
      'La contraseña debe tener mínimo 10 caracteres, letras, números y un carácter especial.';

  @override
  String get authErrorUsernameTaken => 'El nombre de usuario ya está en uso.';

  @override
  String get authErrorEmailTaken => 'El correo ya está registrado.';
}
