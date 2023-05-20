import 'package:dio/dio.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';
import 'package:music_playlist_app/domain/model/music/music_response_model.dart';
import 'package:music_playlist_app/services/network/api/musics/music_api.dart';
import 'package:music_playlist_app/services/network/api_exception.dart';

class MusicRepository {
  final MusicApi api;

  MusicRepository({
    required this.api,
  });

  Future<List<MusicDataModel>> getMusicPlayList() async {
    try {
      final Map<String, dynamic> response = await api.getMusicPlayList();
      final MusicResponseModel musicResponse =
          MusicResponseModel.fromJson(response);
      return musicResponse.music;
    } on DioError catch (e) {
      final errorMessage = ApiException.fromDioError(e).toString();
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
