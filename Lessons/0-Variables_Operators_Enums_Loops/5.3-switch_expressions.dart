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

void main() {
  final List<String> os = [
    'mac',
    'windows',
    'linux',
  ];

  final computer = switch (os[1]) {
    'mac' => macRecord,
    'windows' => windowsRecord,
    'linux' => linuxRecord,
    _ => 'not a known operating system',
  };

  print(computer);
}
