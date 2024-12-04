# Crewmeister | Absence Manager

Crewmeister absence manager using supabase as backend.

## Features
- [x] List of absences including the names of the employees.
- [x] 10 absences per page, with the ability to paginate.
- [x] Total number of absences.
- [x] For each absence, details include: Member name, Type of absence, Period, Member note (when available), Status ('Requested', 'Confirmed' or 'Rejected'), Admitter note (when available)
- [x] Filter absences by type.
- [x] Filter absences by date.
- [x] Loading state until the list is available.
- [x] Error state if the list is unavailable.
- [x] Empty state if there are no results.
- [x] BLoC pattern for state management.
- [x] Dependency injection using `get_it`.
- [x] Localization for `English` and `Deutsch` using `easy_localization`.
- [x] Unit tests for Entity, DataSource, Model, Repository, and Bloc.
- [x] Multi-flavor setup for `dev`, `qa`, `stage`, and `prod` environments.
- [x] `GoRouter` for navigation.
- [x] `Dio` for network calls.
- [x] `Supabase` for backend.
- [x] Responsive material design for various screen sizes.
- [x] Clean architecture with Data, Domain, and Presentation layers.
- [x] Deployed on Github Pages [here](https://asadbaidar.github.io/flutter_absence_manager).

## Pre-requisites
Make sure you have following or latest flutter/dart sdk installed on your machine. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).

`flutter: 2.24.5`
`dart: 3.5.4`

## Setup
1. Add supabase `apikey` in `app/crewmeister/lib/environment.dart` file.

```dart
  static const apiToken = 'SUPABASE_API_KEY';
```

2. To setup the project, use the following commands:
```sh
$ flutter pub get
$ dart run build_runner build --delete-conflicting-outputs
```

3. To run the app, use the following commands:
```sh
$ cd app/crewmeister
$ flutter run --flavor dev --target lib/main_dev.dart
```

4. To build the binaries, use the following commands:
```sh
$ cd app/crewmeister
$ flutter build web --base-href /flutter_absence_manager/
$ flutter build apk --flavor dev --target lib/main_dev.dart
$ flutter build appbundle --flavor dev --target lib/main_dev.dart
$ flutter build ipa --flavor dev --target lib/main_dev.dart
```

## Local Test Coverage
To run test coverage and generate report, lcov is required. Install it before running the command.
```sh
$ sh test_coverage.sh
```

# Project Structure
```
├── app
│   └── crewmeister
│       ├── android
│       ├── ios
│       ├── web
│       └── lib
│           ├── environment.dart
│           ├── main.dart
│           ├── main_dev.dart
│           ├── main_prod.dart
│           ├── main_qa.dart
│           └── main_stage.dart
├── lib
│   ├── app
│   │   └── app_view.dart
│   ├── common
│   │   ├── injector.dart
│   │   ├── launcher.dart
│   │   └── router
│   ├── feature
│   │   ├── absence
│   │   │   ├── data
│   │   │   │   ├── entity
│   │   │   │   ├── remote
│   │   │   │   └── repository
│   │   │   ├── domain
│   │   │   │   ├── model
│   │   │   │   └── repository
│   │   │   └── presentation
│   │   │       ├── bloc
│   │   │       ├── listener
│   │   │       ├── page
│   │   │       ├── view
│   │   │       └── widget
│   │   └── employee
│   │       ├── data
│   │       │   ├── entity
│   │       │   ├── remote
│   │       │   └── repository
│   │       ├── domain
│   │       │   ├── model
│   │       │   └── repository
│   │       └── presentation
│   │           ├── bloc
│   │           ├── page
│   │           ├── view
│   │           └── widget
│   └── tab
│       └── presentation
│           ├── bloc
│           ├── page
│           ├── presentation.dart
│           ├── view
│           └── widget
└── packages
    ├── common
    │   ├── assets
    │   └── lib
    │       ├── constants
    │       ├── theme
    │       ├── utils
    │       └── widgets
    └── locale
        ├── lib
        │   └──locale.dart
        └── translations
            ├── de-DE.json
            └── en-US.json
```
