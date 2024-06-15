import 'dart:io';

/// An object that can create a list of numbers and write them to a file.
class ListOfNumbers {
  // private list of numbers
  List<int> _list = [];

  // private class variable representing the maximum size of the _list
  static final int _SIZE = 10;

  /// Adds integers to the _list the length of _SIZE
  void listOfNumbers() => _list = [for (int i = 0; i < _SIZE; i++) i];

  /// Opens an output stream to the file path specified and writes all elements of the list to the file and then closes the file stream.
  Future<void> writeList(String filePath) async {
    try {
      // create file object
      var file = File(filePath);

      // open an output stream to the File
      var out = file.openWrite();

      for (int i = 0; i < _SIZE; i++) {
        // write to the file output stream
        out.write("Value at: $i = ${_list.elementAt(i)}\n");
      }

      // close the stream when finished
      await out.close();
    } on PathNotFoundException {
      print("ERROR: writeList: invalid file path: $filePath.");
    } on RangeError {
      print("ERROR: writeList: invalid range of values. Current list length: ${_list.length}.");
    } catch (e) {
      print("ERROR: writeList: $e");
    }
  }
}

void main() async {
  final numList = ListOfNumbers();

  numList.listOfNumbers(); // comment this line to cause RangeError

  await numList.writeList("lessons/8-ErrorHandling/out-file.txt");
}


// Exceptions

//   - exceptions are events that disrupt th normal flow of you program

//   - exception objects are created by a method in the call stack and handed off to the run-time (throwing an exception)

//   - exception handlers catch a speficied exception and handles its occurance as to keep the program from terminating