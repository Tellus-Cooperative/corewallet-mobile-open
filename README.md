# corewallet

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Splash
> dart run flutter_native_splash:create --path=flutter_native_splash.yaml

## regenerate icons
> flutter pub run flutter_launcher_icons -f flutter_launcher_icons.yaml

## Launch type generation from terminal graphql
> pub run build_runner build
or
> flutter pub run build_runner build

## generate builds for release
> flutter build apk --split-per-abi --release

## generate appbudle playstore
> flutter build appbundle

## load flutter on MacOs
> export PATH="$PATH:/Users/iver/development/flutter/bin"

## clean pod ios
> cd ios
> pod deintegrate
> pod update
