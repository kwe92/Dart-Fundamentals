int factorial(int n) {
  if (n == 0) {
    return 1;
  }
  return n * factorial(n - 1).toInt();
}

int main() {
  try {
    print(factorial(4));
  } catch (e) {
    print(e);
  }
  return 0;
}
