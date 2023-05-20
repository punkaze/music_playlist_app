import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;

  const CustomShimmer({
    Key? key,
    required this.child,
  }) : super(key: key);

  static CustomShimmer avatar({double? size}) {
    return CustomShimmer(
      child: Container(
        width: size ?? .12.sw,
        height: size ?? .12.sw,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  static CustomShimmer textLine({double? height, required double width}) {
    return CustomShimmer(
      child: Container(
        height: height ?? .25.sw,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static CustomShimmer container({
    double? height,
    double? width,
    double? borderRadiusSize,
  }) {
    return CustomShimmer(
      child: Container(
        height: height ?? .1.sw,
        width: width ?? .1.sw,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(borderRadiusSize ?? 10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.white,
      child: child,
    );
  }
}
