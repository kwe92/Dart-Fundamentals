// the only dependency is an abstraction (shared by high level and low level modules)
import 'abstract_maid.dart';

class Maid extends AbstractMaid {
  // no need to define the set of variables inherited by the parent class
  // unless you want to oeverride them
  Maid({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
  });
}
