abstract class Vector<T extends num> {
  T i;
  T j;
  T k;

  Vector({required this.i, required this.j, required this.k});

  void scale(T scaler);
}

class VectorImp<T extends num> extends Vector<T> {
  VectorImp({required super.i, required super.j, required super.k});

  @override
  void scale(T scaler) {
    i = i + scaler as T;
    j = j + scaler as T;
    k = k + scaler as T;
  }

  @override
  String toString() => "Vector(i:$i, j:$j, k:$k)";
}

void main() {
  final vector = VectorImp<double>(i: 1, j: 2, k: 3);

  print(vector);

  vector.scale(5.4);

  print(vector);
}
