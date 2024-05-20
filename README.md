# foodly.world

Become a foodler.

## Getting Started

Welcome to Foodly, a Flutter application designed to showcase a robust architecture model for developing modern, feature-rich mobile apps. Foodly integrates a variety of powerful tools and features to provide an enhanced experience for both business owners and customers in the food and beverage industry, as well as cooking schools.

## Key Features

Google Maps Integration: Seamlessly navigate and discover locations with Google Maps.
Geolocation Services: Utilize advanced geolocation to find and promote nearby businesses.
Artificial Intelligence: Leverage AI for personalized recommendations and smart features.
Social Feed: Engage with the community through a dynamic social feed.
Comprehensive Business Tools: Provide business owners with tools to manage and grow their establishments.

## Prerequisites

Before you begin, ensure you have met the following requirements:

Flutter SDK installed on your development machine.
Google Maps API Key.

### Installation

- Clone the repository
  `git clone https://github.com/EktwrW/foodly_world.git`

- Navigate to the project directory
  `cd foodly_world`

- Install dependencies
  `flutter pub get`

- Configure Google Maps API Key
  Add your API key to the android/app/src/main/AndroidManifest.xml and ios/Runner/Info.plist files.

- Run the app
  `flutter run`

### Useful Scripts

- Serialize files:
  `dart run build_runner build --delete-conflicting-outputs`

- Activate dictionaries:
  `flutter pub global activate intl_utils`

- Update dictionaries:
  `flutter pub global run intl_utils:generate`

- Generate launch icons:
  `dart run icons_launcher:create --icons_launcher.yaml`

- Generate native splash screen:
  `dart run flutter_native_splash:create`

###API Documentation
For detailed API documentation, visit [API Documentation](https://www.qa.apps-369.com/api/documentation#/).

Explore Foodly and see how it can be adapted and extended to meet the needs of various businesses in the culinary world.
