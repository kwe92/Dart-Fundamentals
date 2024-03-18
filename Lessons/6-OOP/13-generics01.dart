abstract class Vector<T extends num> {
  final T i;
  final T j;
  final T k;

  const Vector({required this.i, required this.j, required this.k});

  Vector<T> scale(T scaler);

  Vector<T> add(Vector<T> vector);
}

class VectorImp<T extends num> extends Vector<T> {
  VectorImp({required super.i, required super.j, required super.k});

  @override
  Vector<T> scale(T scaler) => VectorImp<T>(i: i + scaler as T, j: j + scaler as T, k: k + scaler as T);

  @override
  Vector<T> add(Vector<num> vector) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  String toString() => "Vector(i:$i, j:$j, k:$k)";
}

void main(List<String> args) {
  final v0 = VectorImp<double>(i: 1, j: 2, k: 3);

  final v1 = v0.scale(5.4);

  print(v1);
}
