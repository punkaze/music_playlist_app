// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MusicDataModel _$$_MusicDataModelFromJson(Map<String, dynamic> json) =>
    _$_MusicDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      album: json['album'] as String,
      artist: json['artist'] as String,
      genre: json['genre'] as String,
      source: json['source'] as String,
      image: json['image'] as String,
      trackNumber: json['trackNumber'] as int,
      totalTrackCount: json['totalTrackCount'] as int,
      duration: const DurationConverter().fromJson(json['duration'] as int),
      state: $enumDecodeNullable(_$MusicStateEnumMap, json['state']) ??
          MusicState.idle,
      site: json['site'] as String,
    );

Map<String, dynamic> _$$_MusicDataModelToJson(_$_MusicDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'album': instance.album,
      'artist': instance.artist,
      'genre': instance.genre,
      'source': instance.source,
      'image': instance.image,
      'trackNumber': instance.trackNumber,
      'totalTrackCount': instance.totalTrackCount,
      'duration': const DurationConverter().toJson(instance.duration),
      'state': _$MusicStateEnumMap[instance.state]!,
      'site': instance.site,
    };

const _$MusicStateEnumMap = {
  MusicState.playing: 'playing',
  MusicState.pause: 'pause',
  MusicState.idle: 'idle',
};
