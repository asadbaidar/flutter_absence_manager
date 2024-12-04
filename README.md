# Crewmeister | Absence Manager

Crewmeister absence manager.

## Pre-requisites
Make sure you have following or latest flutter/dart sdk installed on your machine. If not, follow the instructions [here](https://flutter.dev/docs/get-started/install).

`flutter: 2.24.5`
`dart: 3.5.4`

## Setup
1. To setup the project, use the following commands:
```sh
$ flutter pub get
$ dart run build_runner build --delete-conflicting-outputs
```

2. Put supabase `apikey` in `apiToken` at `app/crewmeister/lib/environment.dart` file.

2. To run the app, use the following commands:
```sh
$ cd app/crewmeister
$ flutter run --flavor dev --target lib/main_dev.dart
```

3. To build the binaries, use the following commands:
```sh
$ cd app/crewmeister
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
