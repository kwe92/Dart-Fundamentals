class Logger {
  // static field to hold cached instances of Logger
  static final _cache = <String, Logger>{};

  final String name;

  var _mute = false;

  String _message = '';

  static Map<String, Logger> get cache => _cache;

  bool get mute => _mute;

  String? get message => _message;

  static int get loggerCount => _cache.values.length;

  // Private Named Constructor

  //   - can initalize formal parameters, factory constructors do not have access to 'this'

  Logger._internal(this.name);

  String? log(String message) {
    _message = message;

    return !mute ? this.message : '';
  }

  // Factory Unnamed Constructor
  factory Logger(String name) {
    // add Logger to cache before returning the instance
    final logger = _cache.putIfAbsent(name, () => Logger._internal(name));

    return logger;
  }

  // Factory Named Constructor (Identifier Constructor)
  factory Logger.fromJSON(Map<String, Object?> json) {
    // processing tasks before returning class isntance
    final name = json['error'].toString();

    final message = json['message']?.toString() ?? '';

    final logger = _cache.putIfAbsent(name, () => Logger._internal(name));

    logger.log(message);

    // return class instance after processing tasks
    return logger;
  }

  void silence(bool isSilenced) => _mute = isSilenced;

  @override
  String toString() => 'Logger(name: $name, message: $_message, mute: $mute)';
}

Future<void> main() async {
  final logger00 = Logger('U.I. Event');

  logger00.log('button clicked');

  print('logger00: $logger00');

  final responseBody = await useFetchLoggerApi();

  final logger01 = Logger.fromJSON(responseBody);

  print('logger01: $logger01');

  final logger02 = Logger('User Event');

  logger02.silence(true);

  print('logger02 log call when silenced: ${logger02.log('user account created')}');

  print('logger02: $logger02');

  print('Logger cache count: ${Logger.loggerCount}');

  print('Logger cache: ${Logger.cache}');
}

// Simulate fetching data from an API (Application Programming Interface)
Future<Map<String, Object?>> useFetchLoggerApi() async {
  await Future.delayed(
    Duration(seconds: 1, milliseconds: 200),
  );

  return {
    'error': 'Server Unreachable',
    'message': 'status 503 the server can not handle your request at this time',
  };
}

// Factory Constructors

//   - in Dart Factory Constructors are implemented by prefixing a Constructor (unnamed or named) with the factory keyword

//   - a Factory Constructor must return an instance of its class

//   - a Factory Constructor does not have to create a new instance of its class
//     and can return a cached instance typically stored in a static class field

//   - Factory Constructors can also return a new instance of a subclass (subtype)
//     instead of the base class (base type) that it was implemented within

//   - Factory Constructors can also be used to process tasks before an instance of the class is returned

//   - factory constructors do not have access to the 'this' keyword and can not initialize formal parameters

