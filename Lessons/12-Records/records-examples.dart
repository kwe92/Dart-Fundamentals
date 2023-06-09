void main() {
  const r1 = (
    'first',
    'record',
    key1: "value1",
    nestedList: [1, 2, 3, 4, 5],
    (
      'nested',
      'record',
      isThisImmutable: "can I BE CHANGED!!!",
    ),
  );

  // print(r1);
  print(r1.$1);
  print(r1.$3);
  print(r1);
  r1.nestedList[0] = 3;
}
