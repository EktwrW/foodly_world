# foodly.world

Become a foodler.

<img src="https://github.com/EktwrW/foodly_world/blob/main/assets/images/simulator_screenshot_55075B0F-39A4-410A-BCD5-748504B808E9.png?raw=true" alt="Logo" width="300"/>

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

### API Documentation

For detailed API documentation, visit [API Documentation](https://www.qa.apps-369.com/api/documentation#/).

Explore Foodly and see how it can be adapted and extended to meet the needs of various businesses in the culinary world.

### Coming up for for Improvement

- Documentation: Enhance the README.md with more detailed setup instructions, examples of usage, and a section for contributing guidelines.

- Code Comments: Add more comments and documentation within the code to explain the logic, especially for complex functions and classes.

- Unit Tests: test coverage for all features and components. This will help maintain code quality and reliability.

- Security: Implement a SECURITY.md file to define security policies and procedures for reporting vulnerabilities.


## Credits and Attribution

We would like to express our gratitude to [Freepik](https://www.freepik.es/autor/freepik/iconos/flat-circular-flat_9?t=f#from_element=families) for providing the icons used in our application. Specifically, the icons for business categories and some dialogue boxes in the app are attributed to the Circular Flat icon family by Freepik.

Freepik's contribution has been essential in enhancing the visual appearance and user experience of our application. We appreciate the excellent work of Freepik's designers and creators and their generosity in sharing it with the community.
