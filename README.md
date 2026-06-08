# MovieDB Flutter

A modern Flutter application that consumes **The Movie Database (TMDb) API** to discover movies, view detailed information, and save favorites offline using a local SQLite database. The project is designed with a clean, layered architecture, utilising MobX for state management and Provider for dependency injection.

---

## 🚀 Key Features

*   **Discover Movies**: Browse movies dynamically categorized into **Popular**, **Top Rated**, and **Upcoming**.
*   **Dynamic Showcase Header**: Features a randomized, prominent backdrop image from the fetched movies on the home screen.
*   **Detailed View**: Tap on any movie to view its backdrop, rating, and synopsis.
*   **Offline Favorites**: Bookmark your favorite movies to access them offline. Favorites are saved locally in SQLite.
*   **Clean Layered Architecture**: Clear separation of concerns between UI, Business Logic, Services, Repositories, and Storage.

---

## 📁 Project Architecture & Directory Structure

The application's source code is organized within the `lib/application/` directory, structured into logical layers:

```text
lib/
├── main.dart                      # Flutter app entry point
└── application/
    ├── app.dart                   # Root Widget, theme config, and Provider setup
    ├── di/                        # Dependency injection locator
    │   └── service_locator.dart   # ServiceLocator for registering/resolving dependencies
    ├── business_logic/            # Core state management and data models
    │   ├── helpers/               # Pure functional formatting & UI data helpers
    │   ├── model/                 # JSON-serializable domain and API models (Movie & Results)
    │   └── view_model/            # MobX state stores (e.g. MovieViewModel)
    ├── repository/                # Repository layer wrapping database operations
    │   └── movie_repository.dart  # MovieFavoritesRepository coordinating data access
    ├── service/                   # Network layers and API clients
    │   ├── service_api.dart       # HTTP client targeting the TMDb API
    │   ├── service_implementation.dart
    │   └── service_interface.dart
    ├── storage/                   # Database and local persistence implementations
    │   ├── core/                  # Base SQLite database and provider definitions
    │   └── tables/                # Table helpers & content providers (movies_table)
    └── ui/                        # Presentation layer
        ├── app_components/        # Shared global UI elements (appbar, progress bar, header)
        ├── home/                  # Home screen and home-specific components
        └── moviedetail/           # Details screen and components (description, title card)
```

### Layer Responsibilities

1.  **UI Layer (`ui/`)**: Receptive to changes in the MobX state. It listens to the `MovieViewModel` and wraps reactive UI in `Observer` widgets. The UI does not access SQLite or the network client directly.
2.  **Business Logic (`business_logic/`)**: Consists of MobX stores and models. It coordinates data-fetching from services and favorites synchronization through repositories.
3.  **Repository Layer (`repository/`)**: Wraps persistence operations, exposing clean methods to view models (such as checking if a movie is favorited, saving a movie, or removing one).
4.  **Service Layer (`service/`)**: Handles remote network requests using the `http` package, serializing raw JSON responses into Dart models.
5.  **Storage Layer (`storage/`)**: Manages SQLite operations via `sqflite`. The table structure is defined by `MoviesResultsTable` under `storage/tables/movies/table_helper/`, and CRUD operations are managed by `MovieContentProvider`.

---

## 🔄 Data Flow

### Remote Movie Category Fetching
```text
UI (HomeScreen) ──> MovieViewModel ──> IService ──> ServiceApi ──> TMDb REST API
```

### Favorite Movie Management (Local Storage)
```text
UI (TitleCard) ──> MovieViewModel ──> MovieFavoritesRepository ──> MovieContentProvider ──> SQLite
```

---

## 🛠️ Main Tech Stack

*   **State Management**: [MobX](https://pub.dev/packages/mobx) & [flutter_mobx](https://pub.dev/packages/flutter_mobx) for reactive, observable-driven state.
*   **Dependency Injection**: [Provider](https://pub.dev/packages/provider) and a custom manual `ServiceLocator`.
*   **Local Persistence**: [SQLite (sqflite)](https://pub.dev/packages/sqflite) with custom helper abstractions.
*   **Networking**: [http](https://pub.dev/packages/http) package for REST API communication.
*   **Code Generation**: [build_runner](https://pub.dev/packages/build_runner), [mobx_codegen](https://pub.dev/packages/mobx_codegen), and [json_serializable](https://pub.dev/packages/json_serializable) for robust model serialization and MobX store generation.

---

## ⚙️ Getting Started

### 📋 Prerequisites

Ensure you have the Flutter SDK installed and configured on your system:
*   [Flutter SDK Installation Guide](https://flutter.dev/docs/get-started/install)

### 💻 Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/hansobvius/MovieDBFlutter.git
    cd MovieDBFlutter
    ```

2.  **Install project dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run Code Generation**:
    This project generates file outputs for MobX and JSON serializations. Run the build generator before launching the app:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the application**:
    ```bash
    flutter run
    ```

---

## 🧪 Testing and Static Analysis

Ensure code quality and consistency by running the tests and the static analyzer:

```bash
# Run tests
flutter test

# Run Dart code analyzer
flutter analyze
```
