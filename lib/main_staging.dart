import 'package:flutter/material.dart';
import 'package:music_playlist_app/di/service_locator.dart';
import 'package:music_playlist_app/environment/app_env.dart';
import 'package:music_playlist_app/environment/flavor_environment.dart';
import 'package:music_playlist_app/presentation/pages/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppEnv.initial(FlavorEnvironment.staging.value);
  await setUp();
  runApp(const App());
}
