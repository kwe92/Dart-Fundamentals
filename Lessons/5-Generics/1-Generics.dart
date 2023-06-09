// Type Theory: Parameterized Types - Generics

// Generics
//    - Perserve tooling

// dynamic function
dynamic dynamicIdentityFunction(dynamic e) => e;

// Object function
Object objectIdentityFunction(Object e) => e;

// Generic function
T genericIdentityFunction<T>(T e) => e;
int main() {
  print(dynamicIdentityFunction(42).isEven); // The Compiler is TRUSTING YOU
  // objectIdentityFunction(42).isEven; // EVERYTHING is an Object | Can only use Object properties and Methods
  print(genericIdentityFunction(42).isEven); // Compiler KNOWS type | Type information (Tooling!) is preserved

  return 0;
}
