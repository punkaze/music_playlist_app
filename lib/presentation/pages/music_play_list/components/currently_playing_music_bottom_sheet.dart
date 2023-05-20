import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_playlist_app/common/extensions/datetime_extension.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:music_playlist_app/common/style/app_styles.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/components/play_pause_button.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/controller/music_play_list_controller.dart';
import 'package:music_playlist_app/presentation/pages/shared_components/custom_cache_image.dart';

class CurrentlyPlayingMusicBottomSheet extends StatefulWidget {
  const CurrentlyPlayingMusicBottomSheet({super.key});

  @override
  State<CurrentlyPlayingMusicBottomSheet> createState() =>
      _CurrentlyPlayingMusicBottomSheetState();
}

class _CurrentlyPlayingMusicBottomSheetState
    extends State<CurrentlyPlayingMusicBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _animate;
  @override
  void initState() {
    super.initState();
    _animate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MusicPlayListController controller =
        Get.find<MusicPlayListController>();

    return Obx(
      () {
        if (controller.currentlyPlayingMusic.value == null) {
          return const SizedBox.shrink();
        }

        final MusicDataModel currentMusic =
            controller.currentlyPlayingMusic.value!;

        return BottomSheet(
          animationController: _animate,
          enableDrag: true,
          onClosing: () async {
            await controller.stopMusic();
          },
          builder: (_) {
            return Container(
              height: .13.sh,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.orange,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder(
                    stream: controller.positionStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final double widthDurationPercentage =
                            (snapshot.data!.inSeconds /
                                    currentMusic.duration.inSeconds) *
                                100;
                        final double currentWidth =
                            (widthDurationPercentage / 100) * 1.sw;

                        return Row(
                          children: [
                            Container(
                              height: .01.sw,
                              width: currentWidth,
                              color: AppColors.yellow,
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          height: .01.sw,
                          width: 0,
                          color: AppColors.white,
                        );
                      }
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          CustomCachedImage(
                            imageUrl:
                                controller.currentlyPlayingMusic.value!.image,
                            shimmerHeight: .2.sw,
                            shimmerWidth: .2.sw,
                            height: .2.sw,
                            width: .2.sw,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 12,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentMusic.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.h2TextStyle,
                                  ),
                                  Text(
                                    '${currentMusic.artist} • ${currentMusic.duration.toText()}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.subNormalTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PlayPauseButton(
                            musicState: currentMusic.state,
                            onTapMusicPlayControl: () =>
                                controller.isSourceReady.value
                                    ? controller.onTapMusicPlayControl()
                                    : () {},
                            onTapNextPlayControl: () =>
                                controller.isSourceReady.value
                                    ? controller.onTapNextSong()
                                    : () {},
                            onTapPreviousPlayControl: () =>
                                controller.isSourceReady.value
                                    ? controller.onTapPreviousSong()
                                    : () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
