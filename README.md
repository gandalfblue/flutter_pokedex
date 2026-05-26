# 📱 Flutter Pokédex

> Aplicación móvil desarrollada en **Flutter** que consume la [PokéAPI](https://pokeapi.co/) para mostrar información detallada de Pokémon. 
> Implementa **Clean Architecture**, gestión de estado con **Riverpod**, internacionalización en español e inglés, autenticación con Firebase y múltiples capas de seguridad.

---

## 📸 Pantallas principales

| Splash | Onboarding | Lista | Detalle | Favoritos | Perfil | Login | Registro |
|--------|-----------|-------|---------|-----------|--------|-------|----------|
| Animación Pokébola | Introducción al app | Grid paginado con búsqueda y filtros | Stats, tipos, debilidades, descripción | Swipe para eliminar | Perfil del entrenador | Correo y contraseña | Crear cuenta con rol |

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

> Este paso es **OBLIGATORIO**. El proyecto usa generación de código para modelos inmutables, providers y serialización JSON.

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

La aplicación **no requiere** variables de entorno ni API keys. Consume la PokéAPI de forma pública y gratuita. Sin embargo, para la autenticación con Firebase:

- Se incluye automáticamente `google-services.json` (Android) y configuración en `FirebaseOptions`
- Configura Firebase en tu console: https://firebase.google.com/

---

## 🏛️ Arquitectura

El proyecto sigue **Clean Architecture** de Robert C. Martin dividida en tres capas bien delimitadas:

```
lib/
├── core/                          # Transversal a toda la app
│   ├── constants/                 # ApiConstants, AppConstants, PokemonConstants
│   ├── database/                  # Drift (SQLite) para persistencia local
│   ├── errors/                    # Exceptions + Failures (sealed classes)
│   ├── network/                   # DioClient con interceptores
│   ├── router/                    # AppRouter (GoRouter + redirección por auth)
│   ├── theme/                     # AppTheme (light/dark con Material Design 3)
│   └── utils/                     # Either<L,R>, PokemonTypeUtils, Helpers
│
├── features/
│   ├── data/                      # Capa de Datos
│   │   ├── datasources/           # PokemonRemoteDataSource (interfaz + impl)
│   │   ├── models/                # DTOs Freezed + JSON serializable
│   │   └── repositories/          # PokemonRepositoryImpl + AuthRepositoryImpl
│   │
│   ├── domain/                    # Capa de Dominio (sin dependencias externas)
│   │   ├── entities/              # Entidades de negocio (Freezed)
│   │   ├── repositories/          # Contratos abstractos
│   │   └── usecases/              # GetPokemonList, GetDetail, Search, Weaknesses, Auth
│   │
│   └── presentation/              # Capa de Presentación
│       ├── pages/                 # Splash, Onboarding, List, Detail, Favorites,
│       │                          # Profile, Login, Register, Error
│       ├── providers/             # Estado con Riverpod (Notifiers + Freezed)
│       └── widgets/               # Widgets reutilizables (Cards, Chips, etc.)
│
└── l10n/                          # Internacionalización (en / es)
    ├── app_en.arb                 # Strings en inglés
    └── app_es.arb                 # Strings en español
```

### Flujo de datos (Unidireccional)

```
UI (Page/Widget)
   └─► Provider (Riverpod Notifier)
         └─► UseCase (dominio)
               └─► Repository (contrato abstracto)
                     └─► RepositoryImpl (datos)
                           └─► DataSource → PokéAPI (Dio) / Firebase
```

### Patrones de diseño utilizados

| Patrón | Dónde se aplica |
|--------|----------------|
| **Repository Pattern** | `PokemonRepository` / `PokemonRepositoryImpl` / `AuthRepository` |
| **Use Case / Interactor** | `GetPokemonListUseCase`, `GetPokemonDetailUseCase`, `SearchPokemonUseCase`, `GetTypeWeaknessesUseCase`, `LoginUseCase`, `RegisterUseCase` |
| **Factory** | `DioClient.create()`, `AppTheme` |
| **Observer** | Riverpod `Notifier` + `keepAlive` |
| **Either Monad** | `Either<Failure, T>` para manejo funcional de errores |
| **Sealed Classes** | `Failure` (server / network / cache / unknown / firebase) |
| **Strategy** | `PokemonTypeUtils` (colores, iconos e IDs por tipo) |
| **Decorator** | Interceptores de Dio (`_LoggingInterceptor`, `_ErrorInterceptor`) |
| **Singleton** | Providers con `keepAlive: true` |
| **Listenable** | `_AuthNotifierListenable` para actualizar router reactivamente |
| **Builder** | `GoRouter` con rutas declarativas y guards de navegación |

---

## 📋 Reglas de codificación

El proyecto respeta las siguientes reglas para mantener la calidad y consistencia:

```dart
// REGLAS DE ARQUITECTURA
- Siempre seguir Clean Architecture
- La capa de dominio NO depende de infraestructura
- Inyección de dependencias mediante Riverpod
- Evitar clases estáticas (usar Utilidades en su lugar)
- Usar async/await para acceso a BD y APIs

// LOGGING
- objLog.Debug para debugging
- objLog.Error para excepciones

// NOMENCLATURA
- Variables de entorno: [MODULE]_[SOFTWARE]_[VAR]
- Constantes en snake_case dentro de abstract class
- Clases con PascalCase
- Métodos y variables con camelCase
```

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
| `dio` | `^5.7.0` | Cliente HTTP con interceptores, retry y timeouts |
| `cached_network_image` | `^3.4.1` | Caché de imágenes de red |

### Base de datos

| Paquete | Versión | Uso |
|---------|---------|-----|
| `drift` | `^2.28.0` | ORM con reactividad para SQLite |
| `sqlite3_flutter_libs` | `^0.5.39` | SQLite nativo para Flutter |
| `path_provider` | `^2.1.5` | Acceso a directorios de la app |

### Autenticación

| Paquete | Versión | Uso |
|---------|---------|-----|
| `firebase_core` | `^4.9.0` | Inicialización de Firebase |
| `firebase_auth` | `^6.5.1` | Autenticación con Firebase (email/password) |

### Navegación

| Paquete | Versión | Uso |
|---------|---------|-----|
| `go_router` | `^14.6.2` | Enrutamiento declarativo con redirecciones automáticas |

### Internacionalización

| Paquete | Versión | Uso |
|---------|---------|-----|
| `flutter_localizations` | SDK | Delegates de localización |
| `intl` | `^0.20.2` | Formateo de fechas/números |

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
| `drift_dev` | Genera esquema SQLite desde clases Drift |

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

Además, se normaliza a minúsculas para evitar duplicados case-sensitive.

---

### 3. 🚧 Control de acceso por rutas (Route Guard)

**Dónde:** `AppRouter` → función `redirect` de GoRouter

Implementa un **guard de autenticación** que intercepta la navegación:

- Si el usuario **no está autenticado** e intenta acceder fuera de `/login` o `/register` → redirige a `/login`
- Si el usuario **ya está autenticado** y accede a `/splash`, `/login` o `/register` → redirige a `/profile`

```dart
redirect: (context, state) {
  final authState = container.read(authNotifierProvider);
  final isLoggedIn = authState.isLoggedIn;
  final location = state.matchedLocation;
  
  if (!isLoggedIn && (location != AppRoutes.login && location != AppRoutes.register)) {
    return AppRoutes.login;
  }
  if (isLoggedIn && (location == AppRoutes.login || location == AppRoutes.register)) {
    return AppRoutes.profile;
  }
  return null;
},
```

El router se actualiza reactivamente mediante `_AuthNotifierListenable`, garantizando que cualquier cambio en el estado de autenticación se refleje inmediatamente en la navegación.

---

### 4. 🔎 Unicidad de usuarios (sin duplicados)

**Dónde:** `AuthNotifier.register()` y Firebase Auth

Se verifican dos capas de validación:

**Capa local (Backend Firebase):**
- Firebase valida que el correo electrónico sea único a nivel de cuenta

**Capa de aplicación:**
- El **nombre de usuario** no puede estar ya registrado (case-insensitive)
- El **correo electrónico** se normaliza a minúsculas antes de validar (case-insensitive)

```dart
// Validación local
if (_users.any((u) => u.username.toLowerCase() == username.toLowerCase()))
  return l10n.authErrorUsernameTaken;
if (_users.any((u) => u.email.toLowerCase() == email.toLowerCase()))
  return l10n.authErrorEmailTaken;
```

---

### 5. 🔐 Autenticación con Firebase

**Dónde:** `AuthNotifier`, `LoginUseCase`, `RegisterUseCase`

- Usa **Firebase Authentication** con email/contraseña
- Maneja sesiones persistentes automáticamente
- Las credenciales se almacenan de forma segura en el dispositivo
- Al cerrar sesión, se limpia la sesión de Firebase

```dart
await FirebaseAuth.instance.signOut();
state = const AuthState(); // Estado reseteado
```

---

### 6. 💾 Persistencia de datos con Drift (SQLite)

**Dónde:** `core/database/`

- Base de datos local cifrada (opcional con SQLCipher)
- Caché de Pokémon para evitar llamadas innecesarias a la API
- Almacenamiento de favoritos sincronizado con estado de aplicación

---

### 7. 🌐 Interceptores de Dio

**Dónde:** `DioClient`

- **Logging Interceptor**: Registra requests y responses (DEBUG solo)
- **Error Interceptor**: Mapea errores HTTP a `Failure` con contexto
- **Retry Logic**: Reintentos automáticos en fallos temporales

---

## 🎯 Características principales

### 📱 **Pantalla Splash**
- Animación de Pokébola girando durante la carga inicial
- Validación automática de sesión (Firebase)
- Redirección a onboarding o login según estado

### 📖 **Onboarding**
- 2 vistas introductorias
- Botones de navegación centrados
- Skip para usuarios que ya conocen la app

### 🔍 **Lista de Pokémon**
- Grid paginado (carga progresiva de 25-50 Pokémon por página)
- **Búsqueda en tiempo real** por nombre
- **Filtrado por tipo** (modal selector con múltiples opciones)
- Caché local para mejorar rendimiento
- Pull-to-refresh para actualizar lista
- Bottom Navigation con acceso a Favoritos y Perfil

### 🦸 **Detalle de Pokémon**
- Imagen del Pokémon con gradiente personalizado
- **Stats visuales** (barras de progreso)
- **Tipos** con colores y iconos personalizados
- **Debilidades** (obtenidas desde API de tipos)
- **Categoría** y **Descripción** del Pokémon
- Botón de favorito con persistencia

### ⭐ **Favoritos**
- Lista de Pokémon marcados como favoritos
- Eliminación con gesto de swipe
- Sincronización con estado global
- Persistencia local

### 👤 **Perfil**
- Mostrador de información del entrenador (nombre, correo, rol)
- Avatar según género seleccionado (Entrenador/Entrenadora)
- Botón de cerrar sesión

### 🔐 **Login**
- Campo de email con validación
- Campo de contraseña con visibilidad toggleable
- Navegación a registro para nuevos usuarios
- Manejo de errores Firebase

### 📝 **Registro**
- Validación de email (RFC compliant)
- Validación de contraseña robusta (10+ caracteres, letras, números, especiales)
- Selector de género (Entrenador/Entrenadora)
- Indicador visual de fortaleza de contraseña
- Prevención de duplicados (usuario y email)

### ❌ **Página de Error**
- Mostrador elegante de errores
- Botón de reintentos
- Icono representativo según tipo de error

---

## 📊 Pruebas (Testing)

El proyecto incluye tests unitarios exhaustivos:

```
test/
├── core/
│   ├── utils/                     # Tests de PokemonTypeUtils
│   └── errors/                    # Tests de mapeo de errores
├── features/
│   ├── data/
│   │   ├── datasources/           # Tests de mock API
│   │   ├── models/                # Tests de serialización JSON
│   │   └── repositories/          # Tests de lógica de datos
│   ├── domain/
│   │   └── usecases/              # Tests de casos de uso
│   └── presentation/
│       ├── pages/                 # Tests de widgets de página
│       ├── providers/             # Tests de estado Riverpod
│       └── widgets/               # Tests de widgets reutilizables
└── helpers/                       # Mocks y helpers personalizados
```

**Ejecución:**

```bash
# Todos los tests
flutter test

# Con cobertura
flutter test --coverage

# Un archivo específico
flutter test test/features/domain/usecases/get_pokemon_list_usecase_test.dart
```

---

## 🌍 Internacionalización (i18n)

La app soporta **español e inglés** con soporte automático según configuración del dispositivo.

**Archivos de traducción:**
- `lib/l10n/app_en.arb` — Strings en inglés
- `lib/l10n/app_es.arb` — Strings en español

**Uso en código:**

```dart
final l10n = AppLocalizations.of(context)!;
print(l10n.appTitle); // "Pokédex" (ambos idiomas)
```

Regenerar tras cambios:

```bash
flutter gen-l10n
```

---

## 📦 Estructura de constantes

**`lib/core/constants/`**

- `api_constants.dart` → URLs de PokéAPI, timeouts, límites de paginación
- `app_constants.dart` → Configuración general de la app
- `pokemon_constants.dart` → Tipos de Pokémon, IDs, colores hexadecimales

**Uso:**
```dart
import 'package:flutter_pokemon/core/constants/api_constants.dart';

const url = ApiConstants.pokemonListUrl;
const pageSize = ApiConstants.pageSize; // 25
```

---

## 🎨 Tema y UI

### Material Design 3

- Color seed: `#CC0000` (rojo Pokémon)
- Tema light/dark automático según preferencia del sistema
- AppBar personalizado con colores Pokémon
- Cards redondeadas (16dp) con sombras sutiles
- Inputs con border redondeado (12dp)

### Iconos y Assets

- 18 iconos PNG para tipos de Pokémon (`assets/icons/icon_*.png`)
- 2 imágenes de trainers (`assets/images/entrenador*.png`)
- Imágenes adicionales para onboarding

---

## 🚀 Performance

- **Caché de Pokémon** local (50 primeros por defecto)
- **Caché de imágenes** de red con `cached_network_image`
- **Lazy loading** en grid paginado
- **Keep-Alive** en providers de larga duración
- **Debounce** en buscador para evitar llamadas excesivas

---

## 📝 Notas de desarrollo

### Agregar nuevas rutas

Edita `AppRouter` en `lib/core/router/app_router.dart`:

```dart
abstract class AppRoutes {
  static const miRuta = '/mi-ruta';
}

// En GoRouter.routes:
GoRoute(
  path: AppRoutes.miRuta,
  builder: (context, state) => const MiPage(),
),
```

### Agregar nuevas traducciones

1. Añade la clave en `lib/l10n/app_en.arb` y `app_es.arb`
2. Ejecuta `flutter gen-l10n`
3. Usa en widgets: `AppLocalizations.of(context)!.miClave`

### Crear nuevo UseCase

1. Define entidades en `domain/entities/`
2. Define contrato en `domain/repositories/`
3. Implementa en `domain/usecases/`
4. Crea `DataSource` en `data/datasources/`
5. Implementa `Repository` en `data/repositories/`
6. Crea `Provider` en `presentation/providers/`
7. Usa en `Page` u otro `Provider`

---

## 📄 Licencia

Este proyecto es de uso académico y personal. Para más detalles, consulta el archivo `LICENSE` (si existe).

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Haz fork del proyecto
2. Crea una rama con tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

**Reglas mínimas:**
- ✅ Sigue Clean Architecture
- ✅ Añade tests para nuevas funciones
- ✅ Actualiza documentación
- ✅ Sin secrets o API keys
- ✅ Código en inglés (comentarios permitidos en español)

