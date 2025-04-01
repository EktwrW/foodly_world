# Foodly World - Development Guidelines

## Commands
- **Run app**: `flutter run`
- **Analyze code**: `flutter analyze`
- **Run tests**: `flutter test`
- **Single test**: `flutter test test/widget_test.dart`
- **Generate code**: `dart run build_runner build --delete-conflicting-outputs`
- **Internationalization**: 
  - `flutter pub global activate intl_utils`
  - `flutter pub global run intl_utils:generate`

## Code Style
- **Formatting**: Follow Flutter lints (`package:flutter_lints/flutter.yaml`)
- **Quotes**: Use single quotes for strings
- **Widget properties**: Sort child properties last
- **Imports**: Follow directives_ordering pattern
- **Naming**: Use camelCase for variables/methods, PascalCase for classes
- **Error handling**: Use try/catch blocks with specific exception types
- **State management**: Use BLoC pattern with Cubit where appropriate
- **Navigation**: Utilize GoRouter with structured route definitions
- **Models**: Define clear data models with proper type annotations

## Architecture
- Features are organized by view/widget/bloc pattern
- BLoC/Cubit for state management
- Repository pattern for data access
- Dependency injection with GetIt