import 'package:get/get.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/controller/music_play_list_controller.dart';
import 'package:music_playlist_app/presentation/pages/music_play_list/music_play_list_page.dart';
import 'package:music_playlist_app/presentation/pages/music_player/controller/music_player_page.dart';
import 'package:music_playlist_app/presentation/pages/music_player/music_player_page.dart';
import 'package:music_playlist_app/presentation/routes/middleware/core_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String initial = Paths.MUSIC_PLAY_LIST;

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(
      name: Paths.MUSIC_PLAY_LIST,
      page: () => const MusicPlayListPage(),
      middlewares: [CoreMiddleware()],
      binding: BindingsBuilder(() {
        Get.lazyPut<MusicPlayListController>(MusicPlayListController.new);
      }),
      children: [
        GetPage(
          name: Paths.MUSIC_PLAYER,
          page: () => const MusicPlayerPage(),
          middlewares: [CoreMiddleware()],
          binding: BindingsBuilder(() {
            Get.lazyPut<MusicPlayerController>(MusicPlayerController.new);
          }),
        ),
      ],
    ),
  ];
}
