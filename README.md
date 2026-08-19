# foodly.solutions

Become a foodler.

## Overview

Foodly is a Flutter application for discovering and engaging with food & beverage businesses. It serves two audiences: **customers** who discover and interact with nearby places, and **business owners** who manage their presence and reservations.

The app targets iOS and Android (deployed to the App Store and Google Play).

## Key Features

- **Smart Search**: NLP-powered voice and text search with multilingual support (EN/ES/PT), finds nearby businesses by category, name, or natural-language query
- **Location-Based Discovery**: Nearby businesses carousel, new releases section, and promotions feed — all powered by real-time GPS
- **Reservations System**: Customers request table reservations; managers confirm or reject with in-app notifications
- **Buzz Feed**: Anonymous community activity feed showing recent interactions at nearby businesses
- **Social Posts**: Users and businesses share posts with photos; community feed with likes
- **Business Management**: Owners manage their business profile, menu, photos, promotions, combos, and reservations
- **Multi-language**: Full localization in English, Spanish, and Portuguese
- **AI Features**: generación de promos (texto + imagen) vía el backend, y recomendaciones inteligentes
- **Notifications**: In-app polling notification system for reservations, reviews, favorites, and business activity

## Tech Stack

- **Framework**: Flutter (Dart `^3.6.0`)
- **State Management**: BLoC / Cubit (Freezed states)
- **Networking**: Dio + Retrofit (generated clients)
- **DI**: GetIt
- **Backend**: Laravel API on Google Cloud Run → [be-foodly](https://api.foodly.solutions)

## Prerequisites

- Flutter SDK 3.27.1 or higher
- Dart SDK `^3.6.0`
- Google Maps API Key
- iOS 14.0+ for iOS development
- Android SDK — `minSdkVersion 21`, `targetSdkVersion 36`

## Installation

```bash
# Clone the repository
git clone https://github.com/EktwrW/foodly_world.git
cd foodly_world

# Install dependencies
flutter pub get

# Generate serialization code
dart run build_runner build --delete-conflicting-outputs
```

### Configure API keys

Add your Google Maps API key to:

- `android/app/src/main/AndroidManifest.xml`
- `ios/Runner/Info.plist`

### Run

```bash
flutter run
```

## Useful Scripts

```bash
# Regenerate serialization / Retrofit clients
dart run build_runner build --delete-conflicting-outputs

# Generate localization files
flutter pub global activate intl_utils
flutter pub global run intl_utils:generate

# Regenerate launcher icons
dart run icons_launcher:create --icons_launcher.yaml

# Regenerate native splash screen
dart run flutter_native_splash:create
```

## Platform-Specific Setup

### iOS

Minimum deployment target: **iOS 14.0**

```ruby
# Podfile
platform :ios, '14.0'
```

### Android

```gradle
minSdkVersion 21
targetSdkVersion 36
```

The release keystore (`foodly-release.jks`) and `key.properties` are gitignored — required for signed builds.

## API Documentation

[API Documentation](https://foodly.solutions/api/documentation#/) [Not available yet - coming soon].

## Credits

Business category icons and some UI assets by [Freepik](https://www.freepik.es/autor/freepik/iconos/flat-circular-flat_9?t=f#from_element=families) — Circular Flat icon family.
