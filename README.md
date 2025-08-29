# zodiac_sky_finder

A Flutter mobile application that helps users determine the position of astrological signs in the night sky based on the current month.  
The app uses **BLoC** for state management, a **service layer** for API calls, and a **fallback strategy** with a local mock API server.

---

## 🚀 Features
- Displays the zodiac sign for the current month.
- Highlights the user’s own zodiac sign.
- Fetches the sign’s **universal position (RA/Dec)** via API.
- Falls back to local static data if API is unavailable.
- Deep links to **Sky-Map.org** to view the sign in the sky.
- Built with **BLoC** and **reusable components**.
- Styled with **Material 3 modern theming**.
---

## Project Structure
``` bash
zodiac_sky_finder/
│
├── lib/
│ ├── bloc/ # BLoC state management
│ ├── services/ # SkyMapService (API + fallback)
│ ├── widgets/ # Reusable UI components
│ └── main.dart # Entry point
│
├── astro_mock_api/ # Local Dart mock server
│ └── bin/astro_mock_api.dart
│
└── pubspec.yaml
```
---

## Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.0+ recommended)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- Android Studio or VS Code
- Emulator/Simulator or physical device

---
# Getting started

## Running the Project

### 1. Clone the Repository
``` bash
git clone https://github.com/joesta/zodiac_sky_finder.git
cd zodiac_sky_finder
```

### 2. Install Dependencies
``` bash
flutter pub get
```

### 3. Run the Mock API Server
``` bash  
cd astro_mock_api
dart run bin/astro_mock_api.dart
```
## By default, this starts on http://10.0.2.2:1250.

### 4. Run on different port by editing astro_mock_api.dart
 > configs/conf.dart defaultPort = 1250;

### 5. Run the app
``` bash
flutter run
```

## Who do i talk to? 
[Joesta](https://github.com/joesta)
