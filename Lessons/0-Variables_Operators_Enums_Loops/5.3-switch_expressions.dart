typedef VonNeumannModel = ({
  String os,
  String cpu,
  String memory,
  String storage,
});
final VonNeumannModel MacRecord = (
  os: 'macOS Ventura 13.0.1',
  cpu: 'Apple M1',
  memory: '8gb',
  storage: 'Macintoch HD 250gb',
);
final VonNeumannModel LinuxRecord = (
  os: 'Ubuntu',
  cpu: 'Intel Pentium Gold Processor 8505',
  memory: '16gb',
  storage: 'Seagate Exos X20 20tb',
);
final VonNeumannModel WindowsRecord = (
  os: 'Windows 11',
  cpu: 'Intel Atom x6200FE',
  memory: '32gb',
  storage: 'Seagate BarraCuda 8TB HDD',
);
void main() {}
