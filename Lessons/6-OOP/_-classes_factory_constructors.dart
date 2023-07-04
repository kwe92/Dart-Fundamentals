// Factory Constructor

//   - can be either unnamed or named
//   - doesn't always create new instances of its type
//   - has access to the constructor body allowing
//     logic that can't be handled in an initalizer list

// Named Factory Constructor (Identifier Constructor)

//   - named constructors MUST return an instance of their type
//   - named Factory Constructors can have a function body
//     allowing futher manipulation of data before their type is returned
//   - Initalizer Lists can ONLY initalize variables
//     and do not have access to a function body

// Unnamed Factory Constructors

//   - a generative constructor
//   - does not have to return an instance of its type

// Generative Constructor Redirection:

//   - can not redirect to factory constructors
//   - Logger._internal(String name) : this(name);

class Logger {
  final String name;

  bool mute = false;

  // static variables

  //   - class variables

  static final _cache = <String, Logger>{};

  factory Logger.fromJSON(Map<String, String> json) => Logger(
        json['name'].toString(),
      );

  factory Logger(String name) => _cache.putIfAbsent(
        name,
        () => Logger._internal(name),
      );

// Named Generative Constructor

//   - to initalize instance variables and create a type

  Logger._internal(this.name);

  void log(String msg) => !mute ? print(msg) : null;
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
