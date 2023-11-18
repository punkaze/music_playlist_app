import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      debugPrint(line);
    }
  }
}
