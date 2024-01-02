// the only dependency is an abstraction (shared by high level and low level modules)
import 'abstract_logger.dart';

class Logger extends AbstractLogger {
  const Logger();

  // mutable class method, holds cached Logger messages
  static List<String> logCache = [];

  @override
  void log(String message) {
    // add time stamp prefix to message
    final String prefixedLogMessage = _logPrefix(message);

    // add Logger message to cache
    _cacheMessage(prefixedLogMessage);

    print(prefixedLogMessage);
  }

  String _logPrefix(String message) {
    // logger timestamp prefix
    final String timestamp = _formatedTimeStamp();

    return "$timestamp: $message";
  }

  String _formatedTimeStamp() => DateTime.timestamp().toString();

  void _cacheMessage(String logMessage) => logCache.add(logMessage);
}
