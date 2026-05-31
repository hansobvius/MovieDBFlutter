# Project Specification

## Overview

`moviedb_flutter` is a Flutter application that consumes The Movie Database
API, displays movie categories and details, and stores favorite movies locally
with SQLite.

The code is organized under `lib/application` using a simple layered structure:
UI widgets depend on view models, view models coordinate services and
repositories, services fetch remote data, repositories wrap local persistence,
and storage providers own SQLite access.

## Project Structure

```text
.
+-- android/                         # Android platform project
+-- ios/                             # iOS platform project
+-- lib/
|   +-- main.dart                    # Flutter entry point
|   +-- application/
|       +-- app.dart                 # Root widget, Provider setup, theme
|       +-- di/                      # Manual service locator
|       +-- business_logic/
|       |   +-- helpers/             # Stateless formatting and UI data helpers
|       |   +-- model/               # JSON serializable domain/API models
|       |   +-- view_model/          # MobX stores used by UI
|       +-- repository/              # Repository wrappers around data providers
|       +-- service/                 # Remote API service abstractions and clients
|       +-- storage/                 # SQLite database/provider/table code
|       +-- ui/
|           +-- app_components/      # Shared widgets and UI helpers
|           +-- home/                # Home screen and home-only components
|           +-- moviedetail/         # Movie detail screen and components
+-- test/                            # Flutter tests
+-- pubspec.yaml                     # Package metadata and dependencies
+-- pubspec.lock                     # Locked dependency versions
```

## Layer Responsibilities

### Entry Point

- `lib/main.dart` must stay minimal: initialize Flutter and run `App`.
- `lib/application/app.dart` owns app-wide widget composition, dependency
  provisioning, theme, and the initial screen.

### UI Layer

- Place screens under `lib/application/ui/<feature>/`.
- Place widgets used only by one screen under that feature's `components/`
  folder.
- Place widgets reused across features in `lib/application/ui/app_components/`.
- UI code should read state from `MovieViewModel` through `Provider` and
  `flutter_mobx` observers.
- UI widgets should not call HTTP clients, SQLite providers, or database code
  directly.

### Business Logic

- MobX stores live in `lib/application/business_logic/view_model/`.
- Domain/API models live in `lib/application/business_logic/model/`.
- Helper functions that do not own state live in
  `lib/application/business_logic/helpers/`.
- View models may coordinate services and repositories, but should avoid
  embedding widget concerns.
- MobX observable state should be updated inside `@action` methods.

### Service Layer

- Remote API code lives in `lib/application/service/`.
- `ServiceApi` owns MovieDB HTTP calls and response parsing.
- Service abstractions should expose typed Dart models, not raw HTTP responses.
- Keep API URL construction, query parameters, and response decoding inside the
  service layer.
- Do not introduce direct `http` calls outside this layer.

### Repository Layer

- Repositories live in `lib/application/repository/`.
- Repositories should provide intention-revealing methods for business logic,
  such as querying favorites, saving a movie, checking whether a movie is saved,
  and deleting a favorite.
- View models should prefer repositories over direct storage provider access.

### Storage Layer

- SQLite code lives in `lib/application/storage/`.
- Shared database/provider contracts live under `storage/core/`.
- Movie-specific table and provider code live under
  `storage/tables/movies/`.
- Table helper classes own table names, column names, schema creation SQL, and
  database metadata.
- Content providers own SQLite CRUD operations.
- Keep SQL and `sqflite` details out of UI and view model files.

## Data Flow

Remote movie category flow:

```text
UI -> MovieViewModel -> IService -> ServiceApi -> MovieDB API
```

Favorite movie flow:

```text
UI -> MovieViewModel -> MovieFavoritesRepository -> MovieContentProvider -> SQLite
```

App initialization flow:

```text
main.dart -> App -> ServiceLocator -> MovieViewModel -> initial movie/favorite loads
```

## Dependency Rules

- `ui` may depend on `business_logic` and shared UI components.
- `business_logic/view_model` may depend on `service`, `repository`, and
  `model`.
- `repository` may depend on `storage`.
- `service` may depend on `model` and HTTP packages.
- `storage` may depend on `sqflite`, `path`, and `path_provider`.
- Lower layers must not import UI code.
- Avoid circular dependencies between folders.
- Prefer constructor injection for new classes. If following the existing app
  pattern, register shared instances in `ServiceLocator`.

## Naming Conventions

- Dart files should use `snake_case.dart`.
- Dart classes should use `PascalCase`.
- Methods, fields, and local variables should use `lowerCamelCase`.
- Generated files must keep the `.g.dart` suffix and must not be edited by hand.
- New shared widgets should use descriptive names based on their UI role.
- Keep feature-specific widgets inside the feature folder unless they are reused.

Note: the current project contains a few legacy names that do not follow these
rules, such as `AppWidgets.dart` and `MoviesResultsTable.dart`. New files should
follow the rules above unless they are intentionally matching an existing legacy
file.

## Generated Code

This project uses code generation for:

- `json_serializable` model serializers.
- `mobx_codegen` store implementations.

Do not edit generated `.g.dart` files manually. After changing annotated models
or MobX stores, regenerate them with:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Generated files are part of the source tree and should be committed when their
source files change.

## API Rules

- MovieDB API calls belong in `ServiceApi`.
- Keep API constants centralized in the service layer.
- Do not hard-code API URLs or query strings inside widgets.
- Parse API responses into `MovieModel` and `MovieModelResults` before exposing
  them to business logic or UI.
- Avoid logging full API responses in production-facing code.
- API keys should not be added to new source files. Prefer configuration or
  environment-based injection for future changes.

## Persistence Rules

- Favorite movies are stored in SQLite through `MovieContentProvider`.
- Database table schema changes must update the table helper and database
  version together.
- Use provider/repository methods for reads and writes instead of raw SQL in
  view models.
- Prefer parameterized queries for new SQL to avoid unsafe string interpolation.
- Keep model-to-database conversion logic close to the repository or view model
  boundary until a dedicated mapper layer is introduced.

## State Management Rules

- Use `Provider` for exposing view models to widgets.
- Use MobX observables for mutable UI state.
- Wrap UI that reacts to MobX state in `Observer`.
- Keep async loading and persistence actions inside view model methods.
- Avoid calling state-changing methods from deep child widgets when a parent can
  coordinate the flow more clearly.

## Testing and Validation

Run these checks before finishing changes:

```bash
flutter test
flutter analyze
```

Run code generation when changing generated model/store sources:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

When adding behavior, prefer focused tests under `test/` that cover:

- Model serialization/deserialization.
- View model behavior.
- Repository/provider behavior where practical.
- Widget rendering for user-visible UI changes.

## Dependency Management

- Add runtime dependencies under `dependencies` in `pubspec.yaml`.
- Add build and test tools under `dev_dependencies`.
- Keep `pubspec.lock` updated after dependency changes.
- Avoid adding new packages for small helpers that are easy to implement with
  Dart or Flutter SDK APIs.

## Platform Project Rules

- Keep most app behavior in `lib/`.
- Edit `android/` or `ios/` only for platform-specific configuration,
  permissions, signing, native integrations, or generated platform updates.
- Do not move business logic into native platform folders.

## Style Rules

- Keep widgets small enough to read, extracting components when a build method
  becomes hard to scan.
- Prefer `const` constructors and widgets where possible.
- Prefer typed `Future<T>` and `List<T>` return values over untyped `Future` or
  raw collections for new code.
- Prefer `for` loops or `Future.wait` when async sequencing matters.
- Remove debug `print` calls when replacing or touching related code, unless the
  output is intentionally useful during development.
- Keep comments focused on non-obvious decisions, not line-by-line narration.

## Change Checklist

Before submitting a change:

1. Put new files in the correct layer and feature folder.
2. Keep dependency direction consistent with this spec.
3. Regenerate `.g.dart` files when annotated sources change.
4. Run `flutter analyze`.
5. Run `flutter test`.
6. Update this file if the project structure or architecture rules change.
