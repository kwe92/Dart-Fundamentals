import 'Singletons/singleton.dart';

int main() {
  try {
    print(SingletonExample.Num().someNumber);
    print(SingletonExample.Num().someNumber);
  } catch (e) {
    print(e);
  }
  return 0;
}
