int main() {
  // Declaring and Initalizing a variable as an Anonymous function
  final Function someNumPlus5 = (int n) {
    return 5 + n;
  };
  print(someNumPlus5(32));
  // Calling an anonymous function without declaring a variable name
  // AKA unnamed function
  print(
    (int n) {
      return 5 + n;
    }(40),
  );
  return 0;
}
