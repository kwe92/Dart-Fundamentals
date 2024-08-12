import 'singleton.dart';

void main() {
  try {
    final instance00 = Counter(4);

    final instance01 = Counter();

    for (var i = 0; i < 5; i++) {
      instance00.increment();
      print("increment the count of instance00");
    }

    print("instance00 total count: ${instance00.count}");

    print("instance01 total count: ${instance01.count}");

    print(instance00.count == instance01.count);

    print(instance00.hashCode == instance01.hashCode);
  } catch (e, st) {
    print(e.toString());

    print(st.toString());
  }
}
