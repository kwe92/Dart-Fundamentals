abstract class AbstractLogger {
  const AbstractLogger();

  static List<String> logCache = [];

  void log(String message);
}
