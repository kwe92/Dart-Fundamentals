import 'maze_components.dart';

class Spell {
  final name;
  Spell({required this.name});

  @override
  String toString() => 'Spell(name: $name)';
}

class EnchantedRoom extends Room {
  final Spell activeSpell;
  EnchantedRoom({required super.roomNo, required this.activeSpell});

  @override
  String toString() => 'Room(roomNo: $roomNo, activeSpell: $activeSpell)';
}

class DoorNeedingSpell extends Door {
  final Spell requiredSpell;
  DoorNeedingSpell({required super.r1, required super.r2, required this.requiredSpell});

  @override
  void enter() {}
}
