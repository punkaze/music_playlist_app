import 'package:dio/dio.dart';
import 'package:logger/logger.dart' as lg;
import 'package:music_playlist_app/utils/logger/logger_filter.dart';
import 'package:music_playlist_app/utils/logger/logger_output.dart';

class Logger {
  static final Logger instance = Logger._internal();

  factory Logger() => instance;

  Logger._internal() {
    // init logger
    inti();
  }

  lg.Logger? _logger;

  void inti() {
    // init logger
    _logger = lg.Logger(
      level: lg.Level.debug,
      filter: LoggerFilter(),
      output: LoggerOutput(),
      printer: lg.PrefixPrinter(
        lg.PrettyPrinter(
          methodCount: 10,
          errorMethodCount: 30,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          printTime: true,
        ),
      ),
    );
  }

  /// Log a message at level [Level.verbose].
  void t(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.t(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at level [Level.debug].
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (error is DioException) {
      _logger?.d(
        '[Uri]\n'
        '${error.requestOptions.uri}\n\n'
        '[RequestData]\n'
        '${error.requestOptions.data}\n\n'
        '[RequestParam]\n'
        '${error.requestOptions.queryParameters}\n\n'
        '[Response]\n'
        '${error.response?.data}\n'
        '[Message]\n'
        '${message.toString()}',
        error: error,
        stackTrace: stackTrace,
      );
      return;
    }

    _logger?.d(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at level [Level.info].
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.i(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at level [Level.warning].
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.w(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at level [Level.error].
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.e(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at level [Level.f].
  void f(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.f(
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
