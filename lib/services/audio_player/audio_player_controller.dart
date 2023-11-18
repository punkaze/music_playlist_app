import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';
import 'package:music_playlist_app/utils/logger/logger.dart';

class AudioPlayerController {
  final AudioPlayer _player = AudioPlayer();

  Future<void> setSourceUrl(MusicDataModel music) => _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(music.source),
          tag: MediaItem(
            id: music.id,
            album: music.album,
            title: music.title,
            artist: music.artist,
            artUri: Uri.parse(music.source),
          ),
        ),
      );

  Future<void> setPlayListSource(List<MusicDataModel> musics) async {
    try {
      List<AudioSource> audioSources = [];
      for (MusicDataModel music in musics) {
        audioSources.add(
          AudioSource.uri(
            Uri.parse(music.source),
            tag: MediaItem(
              id: music.id,
              album: music.album,
              title: music.title,
              artist: music.artist,
              artUri: Uri.parse(music.source),
            ),
          ),
        );
      }
      final ConcatenatingAudioSource playlist = ConcatenatingAudioSource(
        children: audioSources,
      );

      await _player.setAudioSource(
        playlist,
        initialIndex: 0,
        initialPosition: Duration.zero,
      );
    } on PlatformException catch (error, stackTrace) {
      Logger.instance.e(
        'Error: $error, StackTrace: $stackTrace',
        error,
        stackTrace,
      );
    } catch (error, stackTrace) {
      Logger.instance.e(
        'Error: $error, StackTrace: $stackTrace',
        error,
        stackTrace,
      );
    }
  }

  Future<void> play() => _player.play();

  Future<void> pause() => _player.pause();

  Future<void> stop() => _player.stop();

  Future<void> skipToIndex(int? index) => _player.seek(
        Duration.zero,
        index: index,
      );

  Future<void> playNext() => _player.seekToNext();

  Future<void> playPrevious() => _player.seekToPrevious();

  Stream<Duration> get positionStream => _player.positionStream;

  Stream<PlayerState> get completePlayer => _player.playerStateStream;

  Stream<int?> get currentIndexStream => _player.currentIndexStream;

  Stream<ProcessingState> get processingStateStream =>
      _player.processingStateStream;

  int? get nextSongIndex => _player.nextIndex;

  int? get previousSongIndex => _player.previousIndex;

  Future<void> dispose() async => await _player.dispose();

  PlayerState get state => _player.playerState;
}
