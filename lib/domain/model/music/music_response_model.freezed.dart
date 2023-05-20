// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MusicResponseModel _$MusicResponseModelFromJson(Map<String, dynamic> json) {
  return _MusicResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MusicResponseModel {
  List<MusicDataModel> get music => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicResponseModelCopyWith<MusicResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicResponseModelCopyWith<$Res> {
  factory $MusicResponseModelCopyWith(
          MusicResponseModel value, $Res Function(MusicResponseModel) then) =
      _$MusicResponseModelCopyWithImpl<$Res, MusicResponseModel>;
  @useResult
  $Res call({List<MusicDataModel> music});
}

/// @nodoc
class _$MusicResponseModelCopyWithImpl<$Res, $Val extends MusicResponseModel>
    implements $MusicResponseModelCopyWith<$Res> {
  _$MusicResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? music = null,
  }) {
    return _then(_value.copyWith(
      music: null == music
          ? _value.music
          : music // ignore: cast_nullable_to_non_nullable
              as List<MusicDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MusicResponseModelCopyWith<$Res>
    implements $MusicResponseModelCopyWith<$Res> {
  factory _$$_MusicResponseModelCopyWith(_$_MusicResponseModel value,
          $Res Function(_$_MusicResponseModel) then) =
      __$$_MusicResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MusicDataModel> music});
}

/// @nodoc
class __$$_MusicResponseModelCopyWithImpl<$Res>
    extends _$MusicResponseModelCopyWithImpl<$Res, _$_MusicResponseModel>
    implements _$$_MusicResponseModelCopyWith<$Res> {
  __$$_MusicResponseModelCopyWithImpl(
      _$_MusicResponseModel _value, $Res Function(_$_MusicResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? music = null,
  }) {
    return _then(_$_MusicResponseModel(
      music: null == music
          ? _value._music
          : music // ignore: cast_nullable_to_non_nullable
              as List<MusicDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MusicResponseModel implements _MusicResponseModel {
  const _$_MusicResponseModel({required final List<MusicDataModel> music})
      : _music = music;

  factory _$_MusicResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_MusicResponseModelFromJson(json);

  final List<MusicDataModel> _music;
  @override
  List<MusicDataModel> get music {
    if (_music is EqualUnmodifiableListView) return _music;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_music);
  }

  @override
  String toString() {
    return 'MusicResponseModel(music: $music)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicResponseModel &&
            const DeepCollectionEquality().equals(other._music, _music));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_music));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MusicResponseModelCopyWith<_$_MusicResponseModel> get copyWith =>
      __$$_MusicResponseModelCopyWithImpl<_$_MusicResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MusicResponseModelToJson(
      this,
    );
  }
}

abstract class _MusicResponseModel implements MusicResponseModel {
  const factory _MusicResponseModel(
      {required final List<MusicDataModel> music}) = _$_MusicResponseModel;

  factory _MusicResponseModel.fromJson(Map<String, dynamic> json) =
      _$_MusicResponseModel.fromJson;

  @override
  List<MusicDataModel> get music;
  @override
  @JsonKey(ignore: true)
  _$$_MusicResponseModelCopyWith<_$_MusicResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
