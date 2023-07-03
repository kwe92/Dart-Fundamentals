// TODO: Review, if no changes do not commit

// Factory Constructor

//   - a constructor implementation that doesn't
//     always create a new instance of its class
//   - Can be either unnamed and named
//   - may return an instance from a cache
//   - may return an instance of a subtype
//   - initalizing a final variable
//     using logic that can't be handled in an initalizer list

class Logger {
  final String name;

  bool mute = false;

  // private class variable

  static final Map<String, Logger> _cache = <String, Logger>{};

  // Named Factory Constructor

  //   - named constructors MUST return an instance of their class

  factory Logger.fromJSON(Map<String, String> json) => Logger(
        json['name'].toString(),
      );

  factory Logger(String name) => _cache.putIfAbsent(
        name,
        () => Logger._internal(name),
      );

  // factory methods are considered a unnamed constructor
  // so you must use a named constructor

  Logger._internal(this.name);

  void log(String msg) => !mute ? print(msg) : null;

  // generative constructors can not redirect to factory constructors
  // Logger._internal(String name) : this(name);
}

Future<Map<String, String>> useFetchLoggerApi() async {
  await Future.delayed(
    Duration(seconds: 1, milliseconds: 200),
  );

  return {'name': 'U.I.'};
}

Future<void> main() async {
  Logger logger = Logger('U.I.');

  logger.log('button clicked');

  Logger loggerJson = Logger.fromJSON(
    await useFetchLoggerApi(),
  );

  print('loggerJson name: ${loggerJson.name}');
}
