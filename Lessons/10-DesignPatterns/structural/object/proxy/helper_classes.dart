import 'dart:io';

class Point {
  final double x, y;
  const Point(this.x, this.y);
  static const zero = Point(0, 0);

  @override
  bool operator ==(covariant Object other) => other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Point($x, $y)';
}

class Event {
  final String type;
  Event(this.type);
}

class InputStream {
  final String _data;
  InputStream(this._data);
  String readString() => _data;
}

class OutputStream {
  void write(String data) {
    stdout.write(data);
  }
}
