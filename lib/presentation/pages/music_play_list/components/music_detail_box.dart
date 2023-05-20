import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:music_playlist_app/common/extensions/datetime_extension.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:music_playlist_app/common/style/app_styles.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/controller/music_play_list_controller.dart';
import 'package:music_playlist_app/presentation/pages/shared_components/custom_cache_image.dart';

class MusicDetailBox extends StatelessWidget {
  const MusicDetailBox({
    Key? key,
    required this.musicData,
  }) : super(key: key);

  final MusicDataModel musicData;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MusicPlayListController>();
    return Obx(() {
      Color bgColor = AppColors.blueDiane;

      if (controller.currentlyPlayingMusic.value != null) {
        if (musicData.source ==
            controller.currentlyPlayingMusic.value!.source) {
          bgColor = AppColors.blueSecondary;
        }
      }

      return GestureDetector(
        onTap: () async {
          await controller.onTapMusicBox(music: musicData);
        },
        child: Container(
          color: bgColor,
          margin: const EdgeInsets.symmetric(
            vertical: 3,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: CustomCachedImage(
                  imageUrl: musicData.image,
                  shimmerHeight: .2.sw,
                  shimmerWidth: .2.sw,
                  height: .2.sw,
                  width: .2.sw,
                  errorWidget: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: .2.sw,
                    height: .2.sw,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.music,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        musicData.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.h2TextStyle,
                      ),
                      4.verticalSpace,
                      Text(
                        '${musicData.artist} • ${musicData.duration.toText()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.subNormalTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
