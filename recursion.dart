// TODO: Need comments

void main() {
  var num1 = 3;
  var p = 3;

  print(pow(3, 3)); // returns 3 * 3 * 3 * 1 = 27

  print(
      'Recursive power function using value $num1 power:$p : ${pow(num1, p)}');
}

num pow(var n, var p) {
  if (p == 0) {
    return 1;
  }
  return n * pow(n, p - 1);
}
