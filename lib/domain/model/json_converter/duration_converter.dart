import 'package:json_annotation/json_annotation.dart';

class DurationConverter implements JsonConverter<Duration, int> {
  const DurationConverter();

  @override
  Duration fromJson(int duration) {
    return Duration(seconds: duration);
  }

  @override
  int toJson(Duration duration) => duration.inSeconds;
}
