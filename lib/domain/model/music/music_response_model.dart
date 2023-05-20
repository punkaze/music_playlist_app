import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_playlist_app/domain/model/music/music_data_model.dart';

part 'music_response_model.freezed.dart';
part 'music_response_model.g.dart';

@freezed
class MusicResponseModel with _$MusicResponseModel {
  const factory MusicResponseModel({
    required List<MusicDataModel> music,
  }) = _MusicResponseModel;

  factory MusicResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MusicResponseModelFromJson(json);
}
