// ---------------------------------------------------------------------------
// 1. The Leaf Classes
//    These are standalone. They don't share a common "Container" interface
//    that allows them to be nested recursively with the same logic.
// ---------------------------------------------------------------------------

class Card {
  final String name;
  final double price;

  Card(this.name, this.price);

  double get netPrice => price;
}

class FloppyDisk {
  final String name;
  final double price;

  FloppyDisk(this.name, this.price);

  double get netPrice => price;
}

// ---------------------------------------------------------------------------
// 2. The Containers
//    WITHOUT Composite, these classes cannot simply hold a list of "Equipment".
//    They must have specific lists for every single type of item they might contain.
// ---------------------------------------------------------------------------

class Bus {
  final String name;
  // LIMITATION: Bus is hard-coded to only hold Cards.
  // It cannot hold a FloppyDisk or another Bus.
  final List<Card> cards = [];

  Bus(this.name);

  void addCard(Card card) {
    cards.add(card);
  }

  double get netPrice {
    double sum = 0;
    for (var card in cards) {
      sum += card.netPrice;
    }
    return sum;
  }
}

class Chassis {
  final String name;

  // LIMITATION: We cannot just have List<Equipment>.
  // We must explicitly declare a list for every type we want to support.
  final List<Bus> buses = [];
  final List<FloppyDisk> floppies = [];

  // If we wanted to add a Card directly to the Chassis, we would have to
  // modify this class to add a List<Card> and update the price logic.

  Chassis(this.name);

  void addBus(Bus bus) {
    buses.add(bus);
  }

  void addFloppy(FloppyDisk floppy) {
    floppies.add(floppy);
  }

  double get netPrice {
    double sum = 0;

    // We have to manually iterate over every specific list.
    for (var bus in buses) {
      sum += bus.netPrice;
    }
    for (var floppy in floppies) {
      sum += floppy.netPrice;
    }
    return sum;
  }
}

class Cabinet {
  final String name;
  // LIMITATION: Cabinet is hard-coded to only hold Chassis.
  final List<Chassis> chassisList = [];

  Cabinet(this.name);

  void addChassis(Chassis chassis) {
    chassisList.add(chassis);
  }

  double get netPrice {
    double sum = 0;
    for (var chassis in chassisList) {
      sum += chassis.netPrice;
    }
    return sum;
  }
}

// ---------------------------------------------------------------------------
// 3. Main Method
// ---------------------------------------------------------------------------
void main() {
  // 1. Build the Bus
  // We must use specific methods like 'addCard', not a generic 'add'.
  final bus = Bus("MCA Bus");
  bus.addCard(Card("16Mbs Token Ring", 200.0));

  // 2. Build the Chassis
  final chassis = Chassis("PC Chassis");
  // We can't treat the Bus and the Floppy as the same thing.
  chassis.addBus(bus);
  chassis.addFloppy(FloppyDisk("3.5in Floppy", 10.0));

  // 3. Build the Cabinet
  final cabinet = Cabinet("PC Cabinet");
  cabinet.addChassis(chassis);

  // 4. Calculate Total Price
  print("Total Price: ${cabinet.netPrice}");
}
