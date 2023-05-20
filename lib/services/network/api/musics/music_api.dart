import 'package:dio/dio.dart';
import 'package:music_playlist_app/services/network/api_client.dart';
import 'package:music_playlist_app/services/network/api_constant/api_endpoint.dart';

class MusicApi {
  MusicApi({
    required this.apiClient,
  });

  final ApiClient apiClient;

  Future<Map<String, dynamic>> getMusicPlayList() async {
    try {
      final Response<dynamic> response =
          await apiClient.get<dynamic>(ApiEndpoint.musicCatalog);

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
