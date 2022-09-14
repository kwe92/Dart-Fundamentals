// ## Exercise: Range Extension
// Given the following (incomplete) program:

// the keyword 'this' in the case of the type / class int is the integer called
// 1.rangeTo(6) this = 1
// 2.rangeTo(6) this = 2
// 3.rangeTo(6) this = 3
//...
// n.rangeTo(6) this = n
extension on int {
  List<int> rangeTo(int other) {
    if (other < this) {
      return [];
    }
    return [for (var i = this; i <= other; i++) i];
  }
}

int main() {
  for (int i in 1.rangeTo(6)) {
    print(i);
  }
  return 0;
}

// Create an extension on 'int' that implements a 'rangeTo' method.
// the 'rangeTo' method should:
//  - take 'int other' as an argument
//  - return a list containing all the integer values inside
//    the range in increasing order

// if 'other' argument is less than the inital value,
// the method should return an empty list.
