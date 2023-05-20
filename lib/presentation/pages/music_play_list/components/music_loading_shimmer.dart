import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:music_playlist_app/presentation/shared_controller/custom_shimmer.dart';

class MusicLoadingShimmer extends StatelessWidget {
  const MusicLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: CustomShimmer(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              height: .2.sw,
              width: .2.sw,
            ),
            Expanded(
              child: Container(
                height: .2.sw,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: .04.sw,
                    ),
                    8.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: .024.sw,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(8),
                child: FaIcon(
                  FontAwesomeIcons.play,
                  color: AppColors.white,
                  size: 25,
                )),
          ],
        ),
      ),
    );
  }
}
