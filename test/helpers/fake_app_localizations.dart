import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

/// Stub de [AppLocalizations] para usar en tests unitarios sin BuildContext.
/// Devuelve la clave como valor para verificar que se llamó la localización correcta.
class FakeAppLocalizations extends Fake implements AppLocalizations {
  // ── Auth – errores de registro ────────────────────────────────────────────
  @override
  String get authErrorUsernameRequired => 'authErrorUsernameRequired';
  @override
  String get authErrorInvalidEmail => 'authErrorInvalidEmail';
  @override
  String get authErrorWeakPassword => 'authErrorWeakPassword';
  @override
  String get authErrorUsernameTaken => 'authErrorUsernameTaken';
  @override
  String get authErrorEmailTaken => 'authErrorEmailTaken';

  // ── Auth – errores de login ───────────────────────────────────────────────
  @override
  String get loginErrorEmpty => 'loginErrorEmpty';
  @override
  String get loginErrorInvalid => 'loginErrorInvalid';
}
