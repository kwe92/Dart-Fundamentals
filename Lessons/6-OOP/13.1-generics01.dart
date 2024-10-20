abstract class Vector2d<T extends num> {
  T _i;

  T _j;

  T get i => _i;

  T get j => _j;

  Vector2d({required T i, required T j})
      : _i = i,
        _j = j;

  void scale(T scaler);
}

abstract class Vector3d<T extends num> extends Vector2d<T> {
  T _k;

  T get k => _k;

  Vector3d({required T i, required T j, required T k})
      : _k = k,
        super(i: i, j: j);
}

class Vector3dImp<T extends num> extends Vector3d<T> {
  Vector3dImp({required T i, required T j, required T k}) : super(i: i, j: j, k: k);

  @override
  void scale(T scaler) {
    _i = (i + scaler) as T;
    _j = (j + scaler) as T;
    _k = (k + scaler) as T;
  }

  @override
  String toString() => "Vector(i:$i, j:$j, k:$k)";
}

void main() {
  final vector3d = Vector3dImp<double>(i: 1, j: 2, k: 3);

  print(vector3d);

  vector3d.scale(5.4);

  print(vector3d);
}
