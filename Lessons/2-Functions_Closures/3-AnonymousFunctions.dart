int main() {
  // Declaring and Initalizing a variable as an Anonymous function
  final Function(int) someNumPlus5 = (int n) {
    return 5 + n;
  };

  final return5 = () {
    return 5;
  };
  print(someNumPlus5(32));
  // Calling an anonymous function without declaring a variable name
  // AKA unnamed function
  print(
    (int n) {
      return 5 + n;
    }(40),
  );

  print((double) {
    return 5;
  });

  print(return5());
  return 0;
}
