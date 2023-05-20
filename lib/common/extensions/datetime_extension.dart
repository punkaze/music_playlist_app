import 'package:intl/intl.dart';

extension DateTimeHelper on DateTime {
  static DateTime fromIso8601Json(String json) => DateTime.parse(json);

  static String toIso8601Json(DateTime date) => date.toIso8601String();

  static String toText(String dateTimeString) {
    return DateFormat('MMM d, y H:m:s UTC').parse(dateTimeString).toString();
  }
}

extension DurationHelper on Duration {
  String toText() {
    final List<int> times = toString()
        .split('.')
        .first
        .padLeft(8)
        .split(':')
        .map((e) => int.parse(e))
        .toList();
    final String minuteText = times[1].toString();
    final String secondText = times[2] > 9 ? '${times[2]}' : '0${times[2]}';
    return '$minuteText:$secondText';
  }
}
