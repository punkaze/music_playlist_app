import 'package:firebase_core/firebase_core.dart';
import 'package:music_playlist_app/firebase_options.dart';

class FirebaseSetup {
  static final FirebaseSetup instance = FirebaseSetup._internal();
  factory FirebaseSetup() => instance;
  FirebaseSetup._internal();

  Future<void> init() async {
    // init firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
