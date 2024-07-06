import 'singleton.dart';

final instance00 = Counter();

final instance01 = Counter();

void main() {
  for (var i = 0; i < 5; i++) {
    instance00.increment();
    print("increment the count of instance00");
  }

  print("instance01 total count: ${instance01.count}");
}
