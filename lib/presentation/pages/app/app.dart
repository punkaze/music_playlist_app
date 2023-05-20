import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_playlist_app/common/style/app_themes.dart';
import 'package:music_playlist_app/presentation/pages/core/page_not_found.dart';
import 'package:music_playlist_app/presentation/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightAppTheme,
          unknownRoute: GetPage(
            name: '/not-found',
            page: () => const PageNotFound(),
            transition: Transition.fadeIn,
          ),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
