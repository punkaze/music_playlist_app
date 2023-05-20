import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/components/currently_playing_music_bottom_sheet.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/components/music_detail_box.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/components/music_loading_shimmer.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/controller/music_play_list_controller.dart';

class MusicPlayListPage extends StatelessWidget {
  const MusicPlayListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MusicPlayListController>();

    return Scaffold(
      backgroundColor: AppColors.blueDiane,
      appBar: AppBar(
        title: const Text('Music Playlist'),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount:
                controller.isLoading.value ? 30 : controller.musics.length,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              if (controller.isLoading.value) {
                return const MusicLoadingShimmer();
              }

              final MusicDataModel music = controller.musics[index];
              return MusicDetailBox(
                musicData: music,
              );
            },
          );
        },
      ),
      bottomSheet: const CurrentlyPlayingMusicBottomSheet(),
    );
  }
}
