# music_playlist_app

This is a music player app.
You can play the music with the current playlist.

## App Features

- **Play the music** - tap on any song on the list.
- **Pause the music** - tap on a pause icon on the bottom sheet.
- **Change the music** or go to next or previous music - tap on any song in the playlist and can tap the next and previous icons.
- **Stop the music** - swipe down on the bottom sheet to shop the song.
- **Play on background mode** - music is still playing after you leave the app.
- **Can be controlled from outside the app** - music can be controlled from outside the app.

## Getting Started

- **Run build_runner for generate model files with**
  - ```flutter pub run build_runner build``` or ```flutter pub run build_runner build --delete-conflicting-outputs```

- **Run flutter project**
  - for DEVELOPMENT env
    ```flutter run --target lib/main_development.dart```
  - for STAGING env
    ```flutter run --target lib/main_staging.dart```
  - for PRODUCTION env
    ```flutter run --target lib/main_staging.dart```


- **Build flutter android app apk**
  - for DEVELOPMENT env, apk file
    ```flutter build apk --target lib/main_development.dart --release```
  - for STAGING env, apk file
    ```flutter build apk --target lib/main_staging.dart --release```
  - for PRODUCTION env, apk file
    ```flutter build apk --target lib/main_staging.dart --release```

- **Build flutter ios app bundle**
  - for DEVELOPMENT env, bundle file
    ```flutter build ipa --target lib/main_development.dart --release```
  - for STAGING env, bundle file
    ```flutter build ipa --target lib/main_staging.dart --release```
  - for PRODUCTION env, bundle file
    ```flutter build ipa --target lib/main_staging.dart --release```


## Firebase App Distribution
- **setup firebase app distribution**
  - [link](https://firebase.google.com/codelabs/appdistribution-udid-collection#0)
- troubleshooting for firebase app distribution [link](https://firebase.google.com/docs/app-distribution/troubleshooting?platform=ios)
