enum MusicState {
  playing('playing'),
  pause('pause'),
  idle('idle');

  const MusicState(this.state);

  final String state;
}
