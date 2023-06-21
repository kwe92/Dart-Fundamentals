typedef VonNeumannModel = ({
  String os,
  String cpu,
  String memory,
  String storage,
});

final VonNeumannModel macRecord = (
  os: 'macOS Ventura 13.0.1',
  cpu: 'Apple M1',
  memory: '8gb',
  storage: 'Macintoch HD 250gb',
);
final VonNeumannModel linuxRecord = (
  os: 'Ubuntu',
  cpu: 'Intel Pentium Gold Processor 8505',
  memory: '16gb',
  storage: 'Seagate Exos X20 20tb',
);
final VonNeumannModel windowsRecord = (
  os: 'Windows 11',
  cpu: 'Intel Atom x6200FE',
  memory: '32gb',
  storage: 'Seagate BarraCuda 8TB HDD',
);

VonNeumannModel getComputer(String os) => switch (os) {
      'mac' => macRecord,
      'windows' => windowsRecord,
      'linux' => linuxRecord,
      _ => throw FormatException('$os is not an operating system')
    };

void main() {
  final List<String> os = [
    'mac',
    'windows',
    'linux',
  ];

// Switch statement expression

//   - return a value from a switch statement:
//       - assign it to a variable
//       - use as areturn value of a function

  final computer0 = switch (os[0]) {
    'mac' => macRecord,
    'windows' => windowsRecord,
    'linux' => linuxRecord,
    _ => 'not a known operating system',
  };

  final VonNeumannModel computer1 = switch (os[1]) {
    'mac' => macRecord,
    'windows' => windowsRecord,
    'linux' => linuxRecord,
    _ => throw FormatException(),
  };

  print('computer0: $computer0');
  print('computer1: $computer1');

  final computer2 = getComputer(os[2]);

  print('computer2: $computer2');
}
