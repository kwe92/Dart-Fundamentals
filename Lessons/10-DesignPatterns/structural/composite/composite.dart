typedef Watt = double;
typedef Currency = double;

// Component Base Class
abstract class Equipment {
  final String _name;

  Equipment(this._name);

  String get name => _name;

  Watt power();

  Currency netPrice();

  Currency discountPrice();

  void add(Equipment equipment) {
    throw UnimplementedError("Cannot add to a Leaf");
  }

  void remove(Equipment equipment) {
    throw UnimplementedError("Cannot remove from a Leaf");
  }

  Iterator<Equipment> createIterator() {
    return <Equipment>[].iterator;
  }
}

// Primitive Components (Leaves)
class FloppyDisk extends Equipment {
  FloppyDisk(String name) : super(name);

  @override
  Watt power() => 0.5;

  @override
  Currency netPrice() => 10.0;

  @override
  Currency discountPrice() => 8.0;
}

class Card extends Equipment {
  Card(String name) : super(name);

  @override
  Watt power() => 12.0;

  @override
  Currency netPrice() => 100.0;

  @override
  Currency discountPrice() => 90.0;
}

// Composite Component Base Class
abstract class CompositeEquipment extends Equipment {
  final List<Equipment> _equipment = [];

  CompositeEquipment(String name) : super(name);

  @override
  void add(Equipment equipment) {
    _equipment.add(equipment);
  }

  @override
  void remove(Equipment equipment) {
    _equipment.remove(equipment);
  }

  @override
  Iterator<Equipment> createIterator() {
    return _equipment.iterator;
  }

  @override
  Currency netPrice() {
    Iterator<Equipment> i = createIterator();
    Currency total = 0;

    while (i.moveNext()) {
      total += i.current.netPrice();
    }
    return total;
  }

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

// Composite Components
// (Containers that can hold other Equipment)
class Chassis extends CompositeEquipment {
  Chassis(String name) : super(name);
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

  final cabinet = Cabinet("PC Cabinet");

  final chassis = Chassis("PC Chassis");

  cabinet.add(chassis);

  final bus = Bus("MCA Bus");

  bus.add(Card("16Mbs Token Ring"));

  chassis.add(bus);

  chassis.add(FloppyDisk("3.Bin Floppy"));

  print("The net price is ${chassis.netPrice()}");

  print("The discount price is ${chassis.discountPrice()}");

  print("The power is ${chassis.power()}");
}

// 1. Core Identity

      // Pattern Name: Composite
      // Category: Structural (Object)
      // Intent: Compose objects into tree structures to represent part-whole hierarchies.
      // Composite lets clients treat individual objects and compositions of objects uniformly.

// 2. The Problem & Solution (Motivation)

      // Scenario: Applications often deal with hierarchical structures (e.g., graphics, hardware)
      // where simple primitives (Lines, Disks) can be grouped into complex containers
      // (Pictures, Chassis).
      // Problem: Client code becomes complex if it has to treat primitives and containers differently
      // (e.g., "if object is Container do X, else do Y").
      // Solution: Create an abstract class that represents both primitives and their containers.
      // Use recursive composition so operations flow down the tree automatically.

// 3. Participants

      // Component (Equipment):

            // - Declares the interface for all objects in the composition.
            // - Implements default behavior (often throws errors for child management).

      // Leaf (FloppyDisk, Card):

            // - Represents leaf objects with no children.
            // - Implements primitive behavior directly.

      // Composite (CompositeEquipment, Chassis):

            // - Defines behavior for components having children.
            // - Stores child components.
            // - Implements operations by forwarding them to children (recursive delegation).

      // Client:

            // - Manipulates objects through the Component interface, indifferent to whether
            // the object is a Leaf or a Composite.

// 4. Critical Implementation Trade-off: Transparency vs. Safety

      // There is a conflict between making the interface uniform and making it type-safe.

      // Option A: Transparency (Preferred in this text)

            // - Define child management (Add/Remove) in the root Component class.
            // - Pros: Clients treat all objects identical. No type casting needed.
            // - Cons: Unsafe. Calling Add() on a Leaf implies a bug and must fail (throw exception).

      // Option B: Safety

            // - Define child management (Add/Remove) only in the Composite class.
            // - Pros: Impossible to add a child to a Leaf at compile time.
            // - Cons: Loses uniformity. Client must cast Component to Composite to add children.

// 5. Consequences

      // Pros:

            // - Simplifies Client: No tag-and-case logic needed for different types.
            // - Scalable: New Leaf or Composite classes work automatically with existing code.

      // Cons:

            // - Overly General: You cannot rely on the type system to restrict what goes inside
            // a composite (e.g., preventing a Line from containing a Picture).

// 6. Use Case Analysis (Based on Sample Code)

      // Scenario: Modeling a computer hardware inventory where parts (Cards, Disks)
      // are contained within sub-assemblies (Bus, Chassis), which are inside main assemblies (Cabinet).

      // Recursive Aggregation (The "Magic"):

            // - The Client asks the top-level container (Chassis) for the "netPrice".
            // - The Chassis delegates to its children.
            // - If a child is a Bus (Composite), it delegates to the Cards inside it.
            // - If a child is a FloppyDisk (Leaf), it returns its specific price.
            // - The results bubble up the stack, summing automatically.

      // Implementation Strategy Used:

            // - The code uses the "Transparency" approach.
            // - The abstract class `Equipment` defines `add/remove` but throws `UnimplementedError`.
            // - This ensures that if the Client accidentally tries `floppyDisk.add(card)`,
            // it fails at runtime, but allows the Client to pass around `Equipment` types
            // without constantly checking `if (item is CompositeEquipment)`.
