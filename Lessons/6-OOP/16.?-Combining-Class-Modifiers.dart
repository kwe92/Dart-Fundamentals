// Combining modifiers: abstract base classes
//   - modifiers can be combined to create new modifiers

abstract base class VonNeumannModel {
  final String cpu;
  final double memory;
  final double storage;

  const VonNeumannModel({
    required this.cpu,
    required this.memory,
    required this.storage,
  });

  void addMemory(double ram) {}
  void addStorage(double diskSpace) {}
}

final class Computer extends VonNeumannModel {
  const Computer({
    required super.cpu,
    required super.memory,
    required super.storage,
  });
}

void main() {
  final VonNeumannModel comp1 = Computer(
    cpu: "Intel Core i9-13900KS",
    memory: 99999,
    storage: 99999,
  );
  print("CPU: ${comp1.cpu}");
}
