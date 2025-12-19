# El Sueño Comunista

Neighborhood collaborative economy app developed in Flutter.

## Prerequisites

- Flutter SDK (3.x)
- Android Studio / Android SDK
- VS Code (optional)

## Initial Setup

1.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

2.  **Configure Firebase (Pending in Phase 2):**
    - Ensure you have the configuration files (`google-services.json`)

## Execution

### On Android Emulator

1.  **List available emulators:**
    ```bash
    flutter emulators
    ```

2.  **Launch an emulator:**
    ```bash
    flutter emulators --launch <EMULATOR_ID>
    # Example: flutter emulators --launch Medium_Phone_API_35
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

### Useful Commands

-   **Generate code files (build_runner):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
-   **Analyze code:**
    ```bash
    flutter analyze
    ```
-   **Run tests:**
    ```bash
    flutter test
    ```

## Project Structure

The project follows **Clean Architecture**:

-   `lib/features/`: Functional modules (auth, posts, etc.)
    -   `presentation/`: UI and State Management (BLoC)
    -   `domain/`: Entities and Use Cases
    -   `data/`: Repositories and Data Sources
-   `lib/core/`: Shared utilities, theme, router
