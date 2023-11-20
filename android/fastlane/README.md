fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android appId

```sh
[bundle exec] fastlane android appId
```

Find the firebase app id for the given app identifier

### android version

```sh
[bundle exec] fastlane android version
```

Runs to get the current version of the app

### android version_firebase

```sh
[bundle exec] fastlane android version_firebase
```

Runs to get the current version of the app from firebase app distribution

### android increase_version

```sh
[bundle exec] fastlane android increase_version
```

Update the app version in pubspec.yaml [version pattern: 1.0.0+1]}

### android distribute

```sh
[bundle exec] fastlane android distribute
```

Build the app apk, example: fastlane build flavor:development

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
