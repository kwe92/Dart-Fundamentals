// All classes are a sub-class of the Object class in dart by default.
// extends can be omitted from the class definition

class ChildOfObjects {
  @override
  String toString() =>
      super.toString() + '\n' 'I am a sub-class of the Object class!';
}

// ChildOfObjects and ChildOfObjects2 both do the same thing
class ChildOfObjects2 extends Object {
  @override
  String toString() =>
      super.toString() + '\n' 'I am a sub-class of the Object class too!';
}

void main() {
  final ChildOfObjects coo = ChildOfObjects();

  final ChildOfObjects2 coo2 = ChildOfObjects2();
  print(coo);
  print(coo2);
}
