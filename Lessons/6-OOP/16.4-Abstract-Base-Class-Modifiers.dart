// Combining Class Modifiers - Group Theory

// Abstract Base Class - ABC

//   - Can not be instantiated
//   - Can not be implemented outside of its own module
//   - Can have abstract signatures (enforcing subclass implementation)

abstract base class VonNeumannModel {
  final String cpu;
  late double _memory;
  late double _storage;

  double get memory => this._memory;
  double get storage => this._storage;

  VonNeumannModel({
    required this.cpu,
    required double memory,
    required double storage,
  }) {
    this._memory = memory;
    this._storage = storage;
  }

  void addMemory(double ram);
  void addStorage(double diskSpace);
}

final class Computer extends VonNeumannModel {
  Computer({
    required super.cpu,
    required super.memory,
    required super.storage,
  });

  @override
  void addMemory(double ram) => this._memory += ram;

  @override
  void addStorage(double diskSpace) => this._storage += diskSpace;
}

void main() {
  final VonNeumannModel comp1 = Computer(
    cpu: "Intel Core  i9-13900KS",
    memory: 99999,
    storage: 99999,
  );
  print("\nCPU: ${comp1.cpu}\n");
  print("memory: ${comp1.memory}\n");
  print("storage: ${comp1.storage}\n");

  comp1.addMemory(123);
  comp1.addStorage(456);

  print("memory: ${comp1.memory}\n");
  print("storage: ${comp1.storage}\n");
}
