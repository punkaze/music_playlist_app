import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:music_playlist_app/di/service_locator.dart';
import 'package:music_playlist_app/domain/model/music/enum/music_state.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';
import 'package:music_playlist_app/domain/repositories/musics/music_repository.dart';
import 'package:music_playlist_app/services/audio_player/audio_player_controller.dart';

class MusicPlayListController extends GetxController
    with GetTickerProviderStateMixin {
  final MusicRepository _repository = getIt<MusicRepository>();
  final AudioPlayerController _audioPlayer = getIt<AudioPlayerController>();

  RxBool isLoading = false.obs;
  RxList<MusicDataModel> musics = RxList.empty(growable: true);
  Map<String, UrlSource> sources = <String, UrlSource>{};

  RxDouble bottomSheetHeight = 0.0.obs;

  Rx<MusicDataModel?> currentlyPlayingMusic = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();
    await retrieveMusicPlayList();
    _audioPlayer.completePlayer.listen((_) async {
      await stopMusic();
    });
  }

  @override
  Future<void> onClose() async {
    await _audioPlayer.dispose();
    super.onClose();
  }

  Future<void> retrieveMusicPlayList() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 4));
      List<MusicDataModel> musicData = await _repository.getMusicPlayList();
      musics.clear();
      sources.clear();
      musics.addAll(musicData);
      for (final music in musics) {
        sources[music.source] = UrlSource(music.source);
      }
      isLoading.value = false;
    } catch (e) {
      rethrow;
    }
  }

  void updateMusicState(MusicState state) {
    final int targetIndex = musics.indexWhere(
      (element) => element.source == currentlyPlayingMusic.value?.source,
    );
    musics[targetIndex] = musics[targetIndex].copyWith(
      state: state,
    );
    if (state == MusicState.idle) {
      currentlyPlayingMusic.value = null;
    } else {
      currentlyPlayingMusic.value = musics[targetIndex];
    }
  }

  Future<void> onTapMusicBox({
    required MusicDataModel music,
  }) async {
    if (currentlyPlayingMusic.value?.source != music.source) {
      if ([PlayerState.paused, PlayerState.playing]
          .contains(_audioPlayer.state)) {
        await _audioPlayer.stop();
      }
      currentlyPlayingMusic.value = music;
    }

    if (music.state == MusicState.idle) {
      await playMusic(music.source);
    } else if (music.state == MusicState.playing) {
      await replayMusic(music.source);
    }
  }

  Future<void> onTapMusicPlayControl() async {
    if (currentlyPlayingMusic.value != null) {
      final MusicState currentState = currentlyPlayingMusic.value!.state;
      if (currentState == MusicState.playing) {
        await pauseMusic();
      } else if (currentState == MusicState.pause) {
        await playMusic(currentlyPlayingMusic.value!.source);
      }
    }
  }

  Future<void> onTapNextSong() async {
    if (currentlyPlayingMusic.value != null) {
      final int currentIndex = musics.indexWhere(
        (element) => element.source == currentlyPlayingMusic.value!.source,
      );
      if (currentIndex + 1 <= musics.length - 1) {
        final musicSource = musics[currentIndex + 1];
        await replayMusic(musicSource.source);
      } else {
        final musicSource = musics[0];
        await replayMusic(musicSource.source);
      }
    }
  }

  Future<void> onTapPreviousSong() async {
    if (currentlyPlayingMusic.value != null) {
      final int currentIndex = musics.indexWhere(
        (element) => element.source == currentlyPlayingMusic.value!.source,
      );
      if (currentIndex - 1 > 0) {
        final musicSource = musics[currentIndex - 1];
        await replayMusic(musicSource.source);
      } else {
        final musicSource = musics[musics.length - 1];
        await replayMusic(musicSource.source);
      }
    }
  }

  Future<void> playMusic(String source) async {
    updateMusicState(MusicState.playing);
    await _audioPlayer.play(sources[source]!);
  }

  Future<void> pauseMusic() async {
    updateMusicState(MusicState.pause);
    await _audioPlayer.pause();
  }

  Future<void> replayMusic(String source) async {
    if (currentlyPlayingMusic.value!.source != source) {
      final int currentIndex = musics.indexWhere(
        (element) => element.source == currentlyPlayingMusic.value?.source,
      );
      musics[currentIndex] = musics[currentIndex].copyWith(
        state: MusicState.idle,
      );

      final int targetIndex = musics.indexWhere(
        (element) => element.source == source,
      );
      musics[targetIndex] = musics[targetIndex].copyWith(
        state: MusicState.playing,
      );
      currentlyPlayingMusic.value = musics[targetIndex];
    }
    await _audioPlayer.stop();
    await _audioPlayer.play(sources[source]!);
  }

  Future<void> stopMusic() async {
    updateMusicState(MusicState.idle);
    await _audioPlayer.stop();
  }

  Stream<Duration> get positionStream => _audioPlayer.positionStream;
}
