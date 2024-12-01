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