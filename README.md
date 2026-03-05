# 📱 Flutter Pokédex

> Aplicación móvil desarrollada en **Flutter** que consume la [PokéAPI](https://pokeapi.co/) para mostrar información detallada de Pokémon. 
> Implementa **Clean Architecture**, gestión de estado con **Riverpod**, internacionalización en español e inglés, autenticación local y múltiples capas de seguridad.

---

## 📸 Pantallas principales

| Splash | Onboarding | Lista | Detalle | Favoritos | Perfil |
|--------|-----------|-------|---------|-----------|--------|
| Animación Pokébola | Introducción al app | Grid paginado con búsqueda y filtros | Stats, tipos, debilidades | Swipe para eliminar | Login / Registro / Perfil del entrenador |

---

## 🚀 Instrucciones para correr el proyecto

### Prerrequisitos

| Herramienta | Versión mínima |
|-------------|----------------|
| Flutter SDK | `3.6.0` o superior |
| Dart SDK    | `3.6.0` o superior |
| Android SDK | API 21+ (Android 5.0) |
| Xcode       | 15+ (solo para iOS/macOS) |
| Git         | Cualquier versión reciente |

### 1. Clonar el repositorio

```bash
git clone https://github.com/<tu-usuario>/flutter_pokedex.git
cd flutter_pokedex
```

### Nota: estar en la rama develop o feature/pokedex

### 2. Instalar dependencias

```bash
flutter pub get
```

### 3. Generar código (Freezed · Riverpod · JSON)

> Este paso es obligatorio. El proyecto usa generación de código para modelos inmutables, providers y serialización JSON.

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Generar archivos de localización (l10n)

```bash
flutter gen-l10n
```

> También se genera automáticamente al ejecutar `flutter run`.

### 5. Ejecutar la aplicación

```bash
# Modo debug (dispositivo o emulador conectado)
flutter run

# Android específico
flutter run -d android

# iOS específico (requiere macOS + Xcode)
flutter run -d ios

# Modo release
flutter run --release
```

### 6. Ejecutar los tests

```bash
# Todos los tests
flutter test

# Solo tests unitarios con cobertura
flutter test --coverage

# Un test específico
flutter test test/features/domain/usecases/get_pokemon_list_usecase_test.dart
```

### Variables de entorno

La aplicación **no requiere** variables de entorno ni API keys. Consume la PokéAPI de forma pública y gratuita.

---

## 🏛️ Arquitectura

El proyecto sigue **Clean Architecture** de Robert C. Martin dividida en tres capas bien delimitadas:

```
lib/
├── core/                          # Transversal a toda la app
│   ├── constants/                 # ApiConstants, AppConstants, PokemonConstants
│   ├── errors/                    # Exceptions + Failures (sealed classes)
│   ├── network/                   # DioClient con interceptores
│   ├── router/                    # AppRouter (GoRouter + redirección por auth)
│   ├── theme/                     # AppTheme (light/dark)
│   └── utils/                     # Either<L,R>, PokemonTypeUtils
│
├── features/
│   ├── data/                      # Capa de Datos
│   │   ├── datasources/           # PokemonRemoteDataSource (interfaz + impl)
│   │   ├── models/                # DTOs Freezed + JSON serializable
│   │   └── repositories/         # PokemonRepositoryImpl
│   │
│   ├── domain/                    # Capa de Dominio (sin dependencias externas)
│   │   ├── entities/              # Entidades de negocio (Freezed)
│   │   ├── repositories/         # Contratos abstractos
│   │   └── usecases/              # GetPokemonList, GetDetail, Search, Weaknesses
│   │
│   └── presentation/              # Capa de Presentación
│       ├── pages/                 # Splash, Onboarding, List, Detail, Favorites,
│       │                          # Profile, Login, Register, Error
│       ├── providers/             # Estado con Riverpod (Notifiers + Freezed)
│       └── widgets/               # Widgets reutilizables
│
└── l10n/                          # Internacionalización (en / es)
    ├── app_en.arb
    └── app_es.arb
```

### Flujo de datos

```
UI (Page/Widget)
   └─► Provider (Riverpod Notifier)
         └─► UseCase (dominio)
               └─► Repository (contrato abstracto)
                     └─► RepositoryImpl (datos)
                           └─► DataSource → PokéAPI (Dio)
```

### Patrones de diseño utilizados

| Patrón | Dónde se aplica |
|--------|----------------|
| **Repository Pattern** | `PokemonRepository` / `PokemonRepositoryImpl` |
| **Use Case / Interactor** | `GetPokemonListUseCase`, `GetPokemonDetailUseCase`, `SearchPokemonUseCase`, `GetTypeWeaknessesUseCase` |
| **Factory** | `DioClient.create()` |
| **Observer** | Riverpod `Notifier` + `keepAlive` |
| **Either Monad** | `Either<Failure, T>` para manejo funcional de errores |
| **Sealed Classes** | `Failure` (server / network / cache / unknown) |
| **Strategy** | `PokemonTypeUtils` (comportamiento por tipo) |
| **Decorator** | Interceptores de Dio (`_LoggingInterceptor`, `_ErrorInterceptor`) |
| **Singleton** | Providers con `keepAlive: true` |

---

## 🛠️ Tecnologías utilizadas

### Core

| Tecnología | Versión | Uso |
|-----------|---------|-----|
| **Flutter** | `≥3.6.0` | Framework principal de UI |
| **Dart** | `≥3.6.0` | Lenguaje de programación |

### Gestión de estado

| Paquete | Versión | Uso |
|---------|---------|-----|
| `flutter_riverpod` | `^2.6.1` | Gestión de estado reactiva |
| `riverpod_annotation` + `riverpod_generator` | `^2.6.x` | Generación de providers con anotaciones |

### Modelos e inmutabilidad

| Paquete | Versión | Uso |
|---------|---------|-----|
| `freezed_annotation` + `freezed` | `^2.4.x / ^2.5.x` | Modelos inmutables con copyWith, pattern matching |
| `json_annotation` + `json_serializable` | `^4.9.x / ^6.9.x` | Serialización/deserialización JSON |

### Red

| Paquete | Versión | Uso |
|---------|---------|-----|
| `dio` | `^5.7.0` | Cliente HTTP con interceptores y timeouts |
| `cached_network_image` | `^3.4.1` | Caché de imágenes de red |

### Navegación

| Paquete | Versión | Uso |
|---------|---------|-----|
| `go_router` | `^14.6.2` | Enrutamiento declarativo con redirecciones |

### Internacionalización

| Paquete | Versión | Uso |
|---------|---------|-----|
| `flutter_localizations` | SDK | Delegates de localización |
| `intl` | `^0.19.0` | Formateo de fechas/números |

### UI / Assets

| Paquete | Versión | Uso |
|---------|---------|-----|
| `flutter_svg` | `^2.2.2` | Renderizado de SVG |
| `cupertino_icons` | `^1.0.8` | Iconos estilo iOS |

### Testing

| Paquete | Versión | Uso |
|---------|---------|-----|
| `flutter_test` | SDK | Framework base de tests |
| `mocktail` | `^1.0.4` | Mocks tipados sin generación de código |

### Generación de código

| Paquete | Uso |
|---------|-----|
| `build_runner` | Orquestador de generación |
| `freezed` | Genera código para modelos inmutables |
| `riverpod_generator` | Genera providers desde anotaciones |
| `json_serializable` | Genera `fromJson`/`toJson` |

---

## 🔒 Capas de seguridad

El proyecto implementa múltiples capas de seguridad en diferentes niveles de la arquitectura:

### 1. 🔐 Validación de contraseñas robusta

**Dónde:** `AuthNotifier._isStrongPassword()` y `PasswordStrengthIndicatorWidget`

La política de contraseñas exige todos los criterios simultáneamente:

- ✅ Mínimo **10 caracteres**
- ✅ Al menos **una letra** (mayúscula o minúscula)
- ✅ Al menos **un número**
- ✅ Al menos **un carácter especial** (`!@#$%^&*(),.?":{}|<>_-+=[]\/`)

El indicador visual de fortaleza (`LinearProgressIndicator`) guía al usuario en tiempo real con colores: rojo → naranja → amarillo → verde, según los criterios cumplidos.

```dart
static bool _isStrongPassword(String password) {
  if (password.length < 10) return false;
  if (!password.contains(RegExp(r'[a-zA-Z]'))) return false;
  if (!password.contains(RegExp(r'[0-9]'))) return false;
  if (!password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=\[\]\\\/]'))) return false;
  return true;
}
```

---

### 2. 📧 Validación de email con expresión regular

**Dónde:** `AuthNotifier._isValidEmail()`

Valida el formato del correo antes del registro para prevenir datos malformados:

```dart
bool _isValidEmail(String email) =>
    RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$').hasMatch(email.trim());
```

---

### 3. 🚧 Control de acceso por rutas (Route Guard)

**Dónde:** `AppRouter` → función `redirect` de GoRouter

Implementa un **guard de autenticación** que intercepta la navegación:

- Si el usuario **no está autenticado** e intenta acceder a `/profile` → redirige a `/login`
- Si el usuario **ya está autenticado** e intenta acceder a `/login` o `/register` → redirige a `/profile`

```dart
redirect: (context, state) {
  final isLoggedIn = container.read(authNotifierProvider).isLoggedIn;
  if (loc == AppRoutes.profile && !isLoggedIn) return AppRoutes.login;
  if (isLoggedIn && (loc == AppRoutes.login || loc == AppRoutes.register)) return AppRoutes.profile;
  return null;
},
```

El router se actualiza reactivamente mediante `_AuthNotifierListenable`, garantizando que cualquier cambio en el estado de autenticación se refleje inmediatamente en la navegación.

---

### 4. 🔎 Unicidad de usuarios (sin duplicados)

**Dónde:** `AuthNotifier.register()`

Antes de registrar un nuevo usuario se verifican dos restricciones:

- El **nombre de usuario** no puede estar ya registrado (case-insensitive)
- El **correo electrónico** no puede estar ya registrado (case-insensitive, normalizado a minúsculas)

```dart
if (_users.any((u) => u.username.toLowerCase() == username.toLowerCase()))
  return l10n.authErrorUsernameTaken;
if (_users.any((u) => u.email.toLowerCase() == email.toLowerCase()))
  return l10n.authErrorEmailTaken;
```
