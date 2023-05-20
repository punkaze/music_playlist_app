import 'package:get_it/get_it.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_playlist_app/domain/repositories/musics/music_repository.dart';
import 'package:music_playlist_app/services/audio_player/audio_player_controller.dart';
import 'package:music_playlist_app/services/network/api/musics/music_api.dart';
import 'package:music_playlist_app/services/network/api_client.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  getIt
    ..registerSingleton(ApiClient())
    ..registerSingleton(MusicApi(apiClient: getIt<ApiClient>()))
    ..registerSingleton(MusicRepository(api: getIt<MusicApi>()))
    ..registerSingleton(AudioPlayerController());
}
