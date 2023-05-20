import 'package:audioplayers/audioplayers.dart';

class AudioPlayerController {
  final AudioPlayer _player = AudioPlayer();

  Future<void> setSourceUrl(String url) => _player.setSourceUrl(url);

  Future<void> play(Source source) => _player.play(source);

  Future<void> pause() => _player.pause();

  Future<void> resume() => _player.resume();

  Future<void> stop() => _player.stop();

  Stream<Duration> get positionStream => _player.onPositionChanged;

  Stream<void> get completePlayer => _player.onPlayerComplete;

  Future<void> dispose() async => await _player.dispose();

  PlayerState get state => _player.state;
}
