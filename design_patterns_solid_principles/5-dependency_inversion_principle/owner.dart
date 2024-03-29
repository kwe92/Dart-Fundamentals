// the only dependency is an abstraction (shared by high level and low level modules)
import 'abstract_owner.dart';

class Owner extends AbstractOwner {
  Owner({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.Address,
  });
}
