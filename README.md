# foodly_world

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## borrador de scripts:

para serializar archivos: 
dart run build_runner build --delete-conflicting-outputs 

para activar diccionarios:
flutter pub global activate intl_utils

para actualizar diccionarios:
flutter pub global run intl_utils:generate

para generar iconos de lanzamiento:
dart run icons_launcher:create --icons_launcher.yaml

flutter build apk --release --dart-define=ENV=prod --dart-define=DOMAIN=https://www.qa.apps-369.com --dart-define=API_VERSION=/api --dart-define=API_KEY=NXn9VCmNLYjlkcv9StbDq9LnVm2dX7OL --dart-define=REG_PREFILL=true --dart-define=APP_ROOT=/app/ --dart-define=MAPBOX_PLACES=https://api.mapbox.com/geocoding/v5/mapbox.places --dart-define=MAPBOX_DEFAULT_PUBLIC_TOKEN=pk.eyJ1IjoiYXBwcy0zNjkiLCJhIjoiY2xzb2xuMzMyMDU3djJqbmowZnAycm42YiJ9.CyXO3nT15sjCAx1nAsLOvQ

NEW flutter build apk --release --dart-define=ENV=prod --dart-define=DOMAIN=https://www.qa.apps-369.com --dart-define=API_VERSION=/api --dart-define=API_KEY=NXn9VCmNLYjlkcv9StbDq9LnVm2dX7OL --dart-define=REG_PREFILL=true --dart-define=APP_ROOT=/app/ --dart-define=GOOGLE_MAPS_GEOCODING_URL=https://maps.googleapis.com/maps/api/geocode/json?latlng= --dart-define=GOOGLE_MAPS_API_KEY=AIzaSyDQd8kLET9EaWLZH4MeBDLMhsL_sN0RDyY
