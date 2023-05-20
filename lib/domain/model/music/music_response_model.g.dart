// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MusicResponseModel _$$_MusicResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_MusicResponseModel(
      music: (json['music'] as List<dynamic>)
          .map((e) => MusicDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MusicResponseModelToJson(
        _$_MusicResponseModel instance) =>
    <String, dynamic>{
      'music': instance.music,
    };
