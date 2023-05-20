import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_playlist_app/domain/model/json_converter/duration_converter.dart';
import 'package:music_playlist_app/domain/model/music/enum/music_state.dart';

part 'music_data_model.freezed.dart';
part 'music_data_model.g.dart';

@freezed
class MusicDataModel with _$MusicDataModel {
  const factory MusicDataModel({
    required String id,
    required String title,
    required String album,
    required String artist,
    required String genre,
    required String source,
    required String image,
    required int trackNumber,
    required int totalTrackCount,
    @DurationConverter() required Duration duration,
    @Default(MusicState.idle) MusicState state,
    required String site,
  }) = _MusicDataModel;

  factory MusicDataModel.fromJson(Map<String, dynamic> json) =>
      _$MusicDataModelFromJson(json);
}
