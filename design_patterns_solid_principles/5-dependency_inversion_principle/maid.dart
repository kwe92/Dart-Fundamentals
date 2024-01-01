// the only dependency is an abstraction (shared by the high level module)
import 'abstract_maid.dart';

class Maid extends AbstractMaid {
  Maid({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
  });
}
