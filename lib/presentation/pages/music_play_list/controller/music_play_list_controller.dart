import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_playlist_app/di/service_locator.dart';
import 'package:music_playlist_app/domain/model/music/enum/music_state.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';
import 'package:music_playlist_app/domain/repositories/musics/music_repository.dart';
import 'package:music_playlist_app/services/audio_player/audio_player_controller.dart';
import 'package:music_playlist_app/utils/logger/logger.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MusicPlayListController extends GetxController
    with GetTickerProviderStateMixin {
  final _loggerInst = Logger.instance;
  final MusicRepository _repository = getIt<MusicRepository>();
  final AudioPlayerController _audioPlayer = getIt<AudioPlayerController>();

  final ItemScrollController itemScrollController = ItemScrollController();

  RxBool isLoading = false.obs;
  RxBool isSourceReady = false.obs;
  RxList<MusicDataModel> musics = RxList.empty(growable: true);
  Map<String, int> sources = {};

  RxDouble bottomSheetHeight = 0.0.obs;

  Rx<MusicDataModel?> currentlyPlayingMusic = Rx(null);

  @override
  Future<void> onInit() async {
    super.onInit();
    _loggerInst.i('MusicPlayListController onInit');
    await retrieveMusicPlayList();
    _audioPlayer.processingStateStream.listen(
      (state) {
        if (ProcessingState.ready == state) {
          isSourceReady.value = true;
        } else {
          isSourceReady.value = false;
        }
      },
      onError: (error, stackTract) {
        _loggerInst.e(
          'Error on processing state stream --> $error, StackTrace: $stackTract',
          error,
          stackTract,
        );
      },
    );
    _audioPlayer.currentIndexStream.listen(
      (index) {
        if (index != null && currentlyPlayingMusic.value != null) {
          changeSong(index);
        }
      },
      onError: (error, stackTrace) {
        _loggerInst.e(
          'Error on current index stream --> $error, StackTrace: $stackTrace',
          error,
          stackTrace,
        );
      },
    );
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
      for (int i = 0; i < musics.length; i++) {
        sources[musics[i].source] = i;
      }

      await _audioPlayer.setPlayListSource(musics);
      isLoading.value = false;
    } catch (error, stackTrace) {
      _loggerInst.e(
        'Error on retrieve music play list --> $error',
        error,
        stackTrace,
      );
      rethrow;
    }
  }

  void updateMusicState(MusicState state) {
    try {
      if (currentlyPlayingMusic.value != null) {
        final int targetIndex = sources[currentlyPlayingMusic.value!.source]!;
        musics[targetIndex] = musics[targetIndex].copyWith(
          state: state,
        );
        if (state == MusicState.idle) {
          currentlyPlayingMusic.value = null;
        } else {
          currentlyPlayingMusic.value = musics[targetIndex];
        }
      }
    } catch (error, stackTrace) {
      _loggerInst.e(
        'Error on update music state --> $error',
        error,
        stackTrace,
      );
    }
  }

  Future<void> onTapMusicBox({
    required MusicDataModel music,
  }) async {
    try {
      if (currentlyPlayingMusic.value?.source != music.source) {
        currentlyPlayingMusic.value = music;
      }

      if (music.state == MusicState.idle) {
        await playAt(currentlyPlayingMusic.value!.source);
      }
      if (music.state == MusicState.playing) {
        await replayMusic(currentlyPlayingMusic.value!.source);
      }
      if (music.state == MusicState.pause) {
        await playMusic();
      }
    } catch (error, stackTrace) {
      _loggerInst.e('Error on tap music box --> $error', error, stackTrace);
    }
  }

  Future<void> changeSong(int index) async {
    try {
      updateMusicState(MusicState.idle);
      currentlyPlayingMusic.value = musics[index];
      playAt(musics[index].source);
    } catch (error, stackTrace) {
      _loggerInst.e('Error on change song --> $error', error, stackTrace);
    }
  }

  Future<void> onTapMusicPlayControl() async {
    try {
      if (currentlyPlayingMusic.value != null) {
        final MusicState currentState = currentlyPlayingMusic.value!.state;
        if (currentState == MusicState.playing) {
          await pauseMusic();
        } else if (currentState == MusicState.pause) {
          await playMusic();
        }
      }
    } catch (error, stackTrace) {
      _loggerInst.e(
        'Error on tap music play control --> $error',
        error,
        stackTrace,
      );
    }
  }

  Future<void> onTapNextSong() async {
    try {
      if (currentlyPlayingMusic.value != null) {
        final int? nextIndex = _audioPlayer.nextSongIndex;
        if (nextIndex != null) {
          itemScrollController.scrollTo(
            index: nextIndex,
            duration: const Duration(milliseconds: 1000),
          );
          await replayMusic(musics[nextIndex].source);
        } else {
          itemScrollController.scrollTo(
            index: 0,
            duration: const Duration(milliseconds: 1000),
          );
          await replayMusic(musics[0].source);
        }
      }
    } catch (error, stackTrace) {
      _loggerInst.e(
        'Error on tap next song --> $error',
        error,
        stackTrace,
      );
    }
  }

  Future<void> onTapPreviousSong() async {
    try {
      if (currentlyPlayingMusic.value != null) {
        final int? previousIndex = _audioPlayer.previousSongIndex;
        if (previousIndex != null) {
          itemScrollController.scrollTo(
            index: previousIndex,
            duration: const Duration(milliseconds: 1000),
          );
          await replayMusic(musics[previousIndex].source);
        } else {
          itemScrollController.scrollTo(
            index: musics.length - 1,
            duration: const Duration(milliseconds: 1000),
          );
          await replayMusic(musics[musics.length - 1].source);
        }
      }
    } catch (error, stackTrace) {
      _loggerInst.e(
        'Error on tap previous song --> $error',
        error,
        stackTrace,
      );
    }
  }

  Future<void> playMusic() async {
    updateMusicState(MusicState.playing);
    await _audioPlayer.play();
  }

  Future<void> pauseMusic() async {
    updateMusicState(MusicState.pause);
    await _audioPlayer.pause();
  }

  Future<void> replayMusic(String source) async {
    final int currentIndex = musics.indexWhere(
      (element) => element.source == currentlyPlayingMusic.value?.source,
    );

    if (currentlyPlayingMusic.value!.source != source) {
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

    await playAt(currentlyPlayingMusic.value!.source);
  }

  Future<void> playAt(String source) async {
    if (currentlyPlayingMusic.value?.source != source) {
      currentlyPlayingMusic.value = musics[sources[source]!];
    }

    updateMusicState(MusicState.playing);
    await _audioPlayer.stop();
    await _audioPlayer.skipToIndex(sources[source]!);
    await _audioPlayer.play();
  }

  Future<void> stopMusic() async {
    updateMusicState(MusicState.idle);
    await _audioPlayer.stop();
  }

  Stream<Duration> get positionStream => _audioPlayer.positionStream;
}
