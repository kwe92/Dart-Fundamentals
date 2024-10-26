typedef VonNeumannModel = ({
  String os,
  String cpu,
  String memory,
  String storage,
});

enum OperatingSystemType {
  mac,
  windows,
  linux;
}

void main() {
  const operatingSystems = OperatingSystemType.values;

  final computer0 = switch (operatingSystems[0]) {
    OperatingSystemType.mac => macRecord,
    OperatingSystemType.windows => windowsRecord,
    OperatingSystemType.linux => linuxRecord,
  };

  print('computer0: $computer0');

  print('computer1: ${switch (operatingSystems[1]) {
    OperatingSystemType.mac => macRecord,
    OperatingSystemType.windows => windowsRecord,
    OperatingSystemType.linux => linuxRecord,
  }}');

  final computer2 = _computer(operatingSystems[2]);

  print('computer2: $computer2');
}

const VonNeumannModel macRecord = (
  os: 'macOS Ventura 13.0.1',
  cpu: 'Apple M1',
  memory: '8gb',
  storage: 'Macintoch HD 250gb',
);

const VonNeumannModel linuxRecord = (
  os: 'Ubuntu',
  cpu: 'Intel Pentium Gold Processor 8505',
  memory: '16gb',
  storage: 'Seagate Exos X20 20tb',
);

const VonNeumannModel windowsRecord = (
  os: 'Windows 11',
  cpu: 'Intel Atom x6200FE',
  memory: '32gb',
  storage: 'Seagate BarraCuda 8TB HDD',
);

VonNeumannModel _computer(OperatingSystemType os) => switch (os) {
      OperatingSystemType.mac => macRecord,
      OperatingSystemType.windows => windowsRecord,
      OperatingSystemType.linux => linuxRecord,
    };

// Switch Expression

//   - produces a value based on the expression body of whichever case matches

//   - can be used anywhere expressions are allowed:

//       - assign returned value to a variable

//       - used as a return value of a function

//       - used as an argument to a parameter of a function or Object

// Switch Expression Syntax

//   - Switch expression cases do not start with the case keyword

//   - the structure of a case is similar to an anonymous arrow function and uses arrow function notation
//     implying case bodies are single expressions instead of a series of statements (no block bodys allowed)

//   - the head of the function is the case pattern to match against and the body is the single expression to evaluate

//       ~ e.g. patternToMatch => expression_to_evaluate, 

//   - there is no fallthrough so each case must have a body (can use Logical OR so this is not much of an issue)

//   - cases are separated by a comma (,) with an optional trailing comma for the final case

// Switch Expression Default / Wildcard _ Clause

//   - default cases can only use _ and not the default keyword

//       ~ e.g. _ => Thow SomeError(),


