typedef Watt = double;
typedef Currency = double;

/// Equipment class defines an interface for all equipment in the part-whole hierarchy
abstract class Equipment {
  final String _name;

  // C++: protected Equipment(const char*);
  Equipment(this._name);

  // C++: const char* Name() { return _name; }
  String get name => _name;

  // C++: virtual Watt Power();
  Watt power();

  // C++: virtual Currency NetPrice();
  Currency netPrice();

  // C++: virtual Currency DiscountPrice();
  Currency discountPrice();

  // C++: virtual void Add(Equipment*);
  // Default implementation throws or does nothing (safety for Leafs)
  void add(Equipment equipment) {
    throw UnimplementedError("Cannot add to a Leaf");
  }

  // C++: virtual void Remove(Equipment*);
  void remove(Equipment equipment) {
    throw UnimplementedError("Cannot remove from a Leaf");
  }

  // C++: virtual Iterator<Equipment*>* CreateIterator();
  Iterator<Equipment> createIterator() {
    return <Equipment>[].iterator;
  }
}

/// Subclass of Equipment (Leaf)
/// Matches C++ class FloppyDisk : public Equipment
class FloppyDisk extends Equipment {
  FloppyDisk(String name) : super(name);

  @override
  Watt power() => 0.5;

  @override
  Currency netPrice() => 10.0;

  @override
  Currency discountPrice() => 8.0;
}

/// Subclass of Equipment (Leaf)
class Card extends Equipment {
  Card(String name) : super(name);

  @override
  Watt power() => 12.0;

  @override
  Currency netPrice() => 100.0;

  @override
  Currency discountPrice() => 90.0;
}

/// CompositeEquipment is the base class for equipment that contains other equipment
abstract class CompositeEquipment extends Equipment {
  // C++: List<Equipment*> _equipment;
  final List<Equipment> _equipment = [];

  CompositeEquipment(String name) : super(name);

  // C++: virtual void Add(Equipment*);
  @override
  void add(Equipment equipment) {
    _equipment.add(equipment);
  }

  // C++: virtual void Remove(Equipment*);
  @override
  void remove(Equipment equipment) {
    _equipment.remove(equipment);
  }

  // C++: virtual Iterator<Equipment*>* CreateIterator();
  @override
  Iterator<Equipment> createIterator() {
    return _equipment.iterator;
  }

  // C++: Currency CompositeEquipment::NetPrice()
  // Matches the logic of iterating and summing
  @override
  Currency netPrice() {
    Iterator<Equipment> i = createIterator();
    Currency total = 0;

    // C++ Loop: for (i->First(); !i->IsDone(); i->Next())
    while (i.moveNext()) {
      // C++: total += i->CurrentItem()->NetPrice();
      total += i.current.netPrice();
    }
    // No need to delete i in Dart (Garbage Collection)
    return total;
  }

  // Implementing other abstract methods by summing children (Composite behavior)
  @override
  Watt power() {
    Iterator<Equipment> i = createIterator();
    Watt total = 0;
    while (i.moveNext()) {
      total += i.current.power();
    }
    return total;
  }

  @override
  Currency discountPrice() {
    Iterator<Equipment> i = createIterator();
    Currency total = 0;
    while (i.moveNext()) {
      total += i.current.discountPrice();
    }
    return total;
  }
}

/// A computer chassis as a subclass of CompositeEquipment
/// Matches C++ class Chassis : public CompositeEquipment
class Chassis extends CompositeEquipment {
  Chassis(String name) : super(name);

  // Inherits Add, Remove, CreateIterator, and NetPrice logic
  // from CompositeEquipment.
}

class Cabinet extends CompositeEquipment {
  Cabinet(String name) : super(name);
}

class Bus extends CompositeEquipment {
  Bus(String name) : super(name);
}

// ---------------------------------------------------------
// Main Function / Client Code
// ---------------------------------------------------------
void main() {
  print("Constructing PC...");

  // C++: Cabinet* cabinet = new Cabinet("PC Cabinet"); Root node
  Cabinet cabinet = Cabinet("PC Cabinet");

  // C++: Chassis* chassis = new Chassis("PC Chassis");
  Chassis chassis = Chassis("PC Chassis");

  // C++: cabinet->Add(chassis);
  cabinet.add(chassis);

  // C++: Bus* bus = new Bus("MCA Bus");
  Bus bus = Bus("MCA Bus");

  // C++: bus->Add(new Card("16Mbs Token Ring"));
  bus.add(Card("16Mbs Token Ring"));

  // C++: chassis->Add(bus);
  chassis.add(bus);

  // C++: chassis->Add(new FloppyDisk("3.Bin Floppy"));
  chassis.add(FloppyDisk("3.Bin Floppy"));

  // C++: cout << "The net price is " << chassis->NetPrice() << endl
  print("The net price is ${chassis.netPrice()}");
}

// The Composite Pattern

//  - Compose objects into tree structures to represent part-whole hierarchies

//  - A Composite is a container that implements the same interface as the things it contains

//  - the Root node is typically a composite and all subsequent children can be either composite or Leaf Nodes
//    i.e. Composite nodes can hold another Composite node or a Leaf Node as a child

//  - The final node is either a leaf or an empty composite Node

// Composite: I hold a list of Products, but I look and act exactly like a
//            single Products so I can be treated as one

// Leaf: I am the single Product that actually does the work

// The Leaf

//  - The Leaf is the end of the line, it does not have a list of children
//    When you call Power() on a Leaf (like FloppyDisk):

//     - It does not delegate the work to anyone else (children in the case of a tree structure)

//     - It uses its own internal logic (primitives, hard-coded math, variables)
//       to return the answer immediately

// Benefits

//  - The reason this pattern is powerful is not just because we have Containers and Primitives
//    it is because the outside world treats them exactly the same
