typedef Watt = double;
typedef Currency = double;

// Visitor Pure Interface
abstract class EquipmentVisitor {
  void VisitFloppyDisk(FloppyDisk floppy);
  void VisitCard(Card card);
  void VisitChassis(Chassis chassis);
  void VisitBus(Bus bus);
  void visitCabinet(Cabinet cabinet);
}

// Component Base Class
abstract class Equipment {
  final String _name;

  Equipment(this._name);

  String get name => _name;

  Watt power();

  Currency netPrice();

  Currency discountPrice();

  void accept(EquipmentVisitor visitor);

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

class PricingVisitor implements EquipmentVisitor {
  Currency _total = 0;

  Currency get total => _total;

  @override
  void VisitBus(Bus bus) {
    _total += bus.netPrice();
  }

  @override
  void VisitCard(Card card) {
    _total += card.netPrice();
  }

  @override
  void VisitChassis(Chassis chassis) {
    _total += chassis.netPrice();
  }

  @override
  void VisitFloppyDisk(FloppyDisk floppy) {
    _total += floppy.netPrice();
  }

  @override
  void visitCabinet(Cabinet cabinet) {
    _total += cabinet.netPrice();
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

  @override
  void accept(EquipmentVisitor visitor) => visitor.VisitFloppyDisk(this);
}

class Card extends Equipment {
  Card(String name) : super(name);

  @override
  Watt power() => 12.0;

  @override
  Currency netPrice() => 100.0;

  @override
  Currency discountPrice() => 90.0;

  @override
  void accept(EquipmentVisitor visitor) => visitor.VisitCard(this);
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
  void accept(EquipmentVisitor visitor) {
    for (final iterator = createIterator(); iterator.moveNext();) {
      iterator.current.accept(visitor);
    }
  }
}

// Composite Components
// (Containers that can hold other Equipment)
class Chassis extends CompositeEquipment {
  Chassis(String name) : super(name);

  @override
  void accept(EquipmentVisitor visitor) {
    super.accept(visitor);
    visitor.VisitChassis(this);
  }

  @override
  Currency discountPrice() => 45.00;

  @override
  Currency netPrice() => 55.00;

  @override
  Watt power() => 0;
}

class Cabinet extends CompositeEquipment {
  Cabinet(String name) : super(name);

  @override
  void accept(EquipmentVisitor visitor) {
    super.accept(visitor);
    visitor.visitCabinet(this);
  }

  @override
  Currency discountPrice() => 35.00;

  @override
  Currency netPrice() => 45.00;

  @override
  Watt power() => 0;
}

class Bus extends CompositeEquipment {
  Bus(String name) : super(name);

  @override
  void accept(EquipmentVisitor visitor) {
    super.accept(visitor);
    visitor.VisitBus(this);
  }

  @override
  Currency discountPrice() => 55.00;

  @override
  Currency netPrice() => 65.00;

  @override
  Watt power() => 2.5;
}

void main() {
  print("Constructing PC...");

  final cabinet = Cabinet("PC Cabinet");

  final chassis = Chassis("PC Chassis");

  cabinet.add(chassis);

  final bus = Bus("MCA Bus");

  bus.add(Card("16Mbs Token Ring"));

  chassis.add(bus);

  chassis.add(FloppyDisk("3.Bin Floppy"));

  final priceVisitor = PricingVisitor();

  cabinet.accept(priceVisitor);

  print("The net price is ${priceVisitor.total}");
}
