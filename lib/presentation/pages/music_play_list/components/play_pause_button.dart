import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:music_playlist_app/domain/model/music/enum/music_state.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key? key,
    required this.musicState,
    required this.onTapMusicPlayControl,
    required this.onTapNextPlayControl,
    required this.onTapPreviousPlayControl,
  }) : super(key: key);

  final MusicState musicState;
  final VoidCallback onTapMusicPlayControl;
  final VoidCallback onTapNextPlayControl;
  final VoidCallback onTapPreviousPlayControl;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      Widget icon = const FaIcon(
        FontAwesomeIcons.play,
        color: AppColors.white,
      );

      if (musicState == MusicState.playing) {
        icon = const FaIcon(
          FontAwesomeIcons.pause,
          color: AppColors.white,
        );
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 25,
              icon: const FaIcon(
                FontAwesomeIcons.backward,
                color: AppColors.white,
              ),
              padding: const EdgeInsets.all(0),
              onPressed: onTapPreviousPlayControl,
            ),
            IconButton(
              iconSize: 25,
              icon: icon,
              padding: const EdgeInsets.all(0),
              onPressed: onTapMusicPlayControl,
            ),
            IconButton(
              iconSize: 25,
              icon: const FaIcon(
                FontAwesomeIcons.forward,
                color: AppColors.white,
              ),
              padding: const EdgeInsets.all(0),
              onPressed: onTapNextPlayControl,
            ),
          ],
        ),
      );
    });
  }
}
