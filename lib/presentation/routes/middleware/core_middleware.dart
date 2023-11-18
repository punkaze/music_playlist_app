import 'package:get/get.dart';
import 'package:music_playlist_app/utils/logger/logger.dart';

class CoreMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    Logger.instance.d('Page: ${page?.name}');
    return super.onPageCalled(page);
  }
}
