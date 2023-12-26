// the only dependency is an abstraction (shared by the high level module)
import 'abstract_logger.dart';

class Logger extends AbstractLogger {
  const Logger();

  // mutable class method, holds cached Logger mrthods
  static List<String> logCache = [];

  @override
  void log(String message) {
    // logger timestamp prefix
    final String timestamp = _formatedTimeStamp();

    // add time stamp prefix to message
    final String logMessage = "$timestamp: $message";

    // add Logger message cache
    _cacheMessage(logMessage);

    print(logMessage);
  }

  String _formatedTimeStamp() => DateTime.timestamp().toString();

  void _cacheMessage(String logMessage) => logCache.add(logMessage);
}
