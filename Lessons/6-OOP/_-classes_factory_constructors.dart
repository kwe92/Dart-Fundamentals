// TODO: Review, if no changes do not commit

// Factory Constructor

//   - a constructor implementation that doesn't
//     always create a new instance of its class
//   - Can be either unnamed or named
//   - may return an instance from a cache
//   - may return an instance of a subtype
//   - initalize final variables using logic
//     that can't be handled in an initalizer list

class Logger {
  final String name;

  bool mute = false;

  // private class variable

  static final _cache = <String, Logger>{};

  // Named Factory Constructor

  //   - named constructors MUST return an instance of their class

  factory Logger.fromJSON(Map<String, String> json) => Logger(
        json['name'].toString(),
      );

  // Generative Factory Constructor

  //   - in this example the generative factory constructor
  //     adds a Logger to the class instance variable _cache
  //     if the log does not already exist with the specified key
  //   - Does not return a new instance of the class

  factory Logger(String name) => _cache.putIfAbsent(
        name,
        () => Logger._internal(name),
      );

  // Unnamed Generative Constructor
  //   - classes can only have one unnamed generative constructor
  //   - thus a named constructor is required to
  //     initalize instance variables and return the class
  //     if the unnamed constructor does not do so

  Logger._internal(this.name);

  void log(String msg) => !mute ? print(msg) : null;

  // Generative Constructor Redirection:

  //   - can not redirect to factory constructors
  //   - Logger._internal(String name) : this(name);
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
