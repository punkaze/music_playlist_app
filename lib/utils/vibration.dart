import 'package:flutter/services.dart';

class Vibration {
  Vibration._();

  static Future<void> vibrateLight() async {
    await HapticFeedback.lightImpact();
  }

  static Future<void> vibrateSuccess() async {
    await HapticFeedback.heavyImpact();
  }

  static Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }

  static Future<void> vibrateSelection() async {
    await HapticFeedback.mediumImpact();
  }

  static Future<void> vibrateError() async {
    await HapticFeedback.heavyImpact();
  }
}
