// TODO: Explain Delegation

// THE INTERFACE (Contract)
// Any object that wants to use the RectangleDelegate must implement this.
abstract class DimensionProvider {
  double get width;
  double get height;
}

// THE DELEGATE
// Now it relies on the Interface, not the concrete 'Window' class.
class RectangleDelegate {
  double calculateArea(DimensionProvider source) => source.width * source.height;
}

// RECEIVER 1: Window
class Window implements DimensionProvider {
  final _delegate = RectangleDelegate();

  @override
  final double width;
  @override
  final double height;

  Window(this.width, this.height);

  // Passes 'this', which is valid because Window implements DimensionProvider
  double getArea() => _delegate.calculateArea(this);
}

// RECEIVER 2: Image
// The same Delegate can now be reused for a completely different class.
class Image implements DimensionProvider {
  final _delegate = RectangleDelegate();

  @override
  final double width;
  @override
  final double height;

  Image(this.width, this.height);

  double getPixelCount() => _delegate.calculateArea(this);
}

void main() {
  final window = Window(12, 36);
  final image = Image(12, 24);

  print('window area: ${window.getArea()}');
  print('pixels in image: ${image.getPixelCount()}');
}
