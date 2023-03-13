// typedef syntax
// typedef returnType FunctionTypeName (parameterType parameterName);
typedef int Times2(int x);

int main() {
  final Times2 t = (int x) => x * 2;
  const x = 4;

  print(t(x));

  return 0;
}
