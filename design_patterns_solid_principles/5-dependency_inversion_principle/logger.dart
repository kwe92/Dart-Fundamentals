// the only dependency is an abstraction (shared by the high level module)
import 'abstract_logger.dart';

class Logger extends AbstractLogger {
  const Logger();

  static List<String> logCache = [];

  @override
  void log(String message) {
    final timestamp = DateTime.timestamp().toString();

    final String logMessage = "$timestamp: $message";

    logCache.add(logMessage);

    print(logMessage);
  }
}
