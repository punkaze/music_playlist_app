import 'package:flutter/material.dart';
import 'package:music_playlist_app/common/core/app_assets.dart';
import 'package:music_playlist_app/presentation/pages/shared_components/custom_text.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            AppAssets.imageError,
            width: 350,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                text: 'Page not found',
                size: 24,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
