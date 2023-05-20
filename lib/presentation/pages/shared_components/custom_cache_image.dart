import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_playlist_app/common/style/app_colors.dart';
import 'package:music_playlist_app/presentation/shared_controller/custom_shimmer.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final ColorFilter? colorFilter;
  final FilterQuality filterQuality;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? height;
  final double? width;
  final double? shimmerHeight;
  final double? shimmerWidth;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;

  const CustomCachedImage({
    Key? key,
    required this.imageUrl,
    this.fit,
    this.colorFilter,
    this.filterQuality = FilterQuality.low,
    this.placeholder,
    this.errorWidget,
    this.height,
    this.width,
    this.shimmerHeight,
    this.shimmerWidth,
    this.progressIndicatorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
              colorFilter: colorFilter,
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: progressIndicatorBuilder,
      placeholder: (context, url) =>
          placeholder ??
          CustomShimmer.container(
            height: shimmerHeight,
            width: shimmerWidth ?? 1.sw,
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12)),
            width: width,
            height: height,
            child: const Icon(
              Icons.broken_image_rounded,
            ),
          ),
    );
  }
}
