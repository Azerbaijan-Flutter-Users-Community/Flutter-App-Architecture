import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class LoggingService {
  LoggingService._();

  static LoggingService? _instance;

  static final _colors = <Level, AnsiPen>{
    Level.ALL: AnsiPen(),
    Level.FINE: AnsiPen()..green(),
    Level.WARNING: AnsiPen()..green(),
    Level.INFO: AnsiPen()..gray(),
    Level.CONFIG: AnsiPen()..gray(),
    Level.SEVERE: AnsiPen()..magenta(),
    Level.SHOUT: AnsiPen()..red(),
  };

  factory LoggingService() {
    if (_instance == null) {
      _instance = LoggingService._();
      ansiColorDisabled = false;
      Logger.root.level = Level.ALL;
      Logger.root.onRecord.listen(_printLog);
    }

    return _instance!;
  }

  static void _printLog(LogRecord logRecord) {
    final pen = _colors[logRecord.level] ?? _colors[Level.ALL]!;
    debugPrint(pen('${logRecord.loggerName}: ${logRecord.message}'));
  }
}
