import 'dart:io';

//!! TODO: Review Comments and Edit them

/// An object that can create a list of numbers and write them to a file.
class ListOfNumbers {
  List<int> _list = [];

  final int _size;

  ListOfNumbers({required int size}) : _size = size;

  void listOfNumbers() => _list = [for (int i = 0; i < _size; i++) i];

  /// Opens an output stream to the file path specified and writes all elements of the list to the file and then closes the file stream.
  Future<void> writeList(String filePath) async {
    try {
      // create file object
      var file = File(filePath);

      // open an output stream to the File
      var out = file.openWrite();

      for (int i = 0; i < _size; i++) {
        // write to the file output stream
        out.write("Value at: $i = ${_list.elementAt(i)}\n");
      }

      // close the stream when finished
      await out.close();
    } // catching multiple types of exceptions
    on PathNotFoundException {
      print("ERROR: writeList: invalid file path: $filePath.");
    } on RangeError {
      print("ERROR: writeList: invalid range of values. Current list length: ${_list.length}.");
    } on Exception catch (exceptionObject, _) {
      print('unknown exception: $exceptionObject');
    }
    // catch all clause
    catch (e, stackTrace) {
      print("no specified exception type (type thrown does not implement excpetion): $e");

      print(stackTrace);
    }
  }
}

void main() async {
  final numList = ListOfNumbers(size: 20);

  numList.listOfNumbers(); // comment this line to cause RangeError

  await numList.writeList("lessons/8-ErrorHandling/out-file.txt");

  try {
    throwUnhandledException();
  } catch (e, st) {
    print('Error: $e');
    print(st);
  } finally {
    print('I ALWAYS RUN!');
  }
}

void throwUnhandledException() => throw 'exception string';

// Exceptions

//   - errors indicating that something unexpected has happened in your program

//   - exception objects are created by a method in the call stack and handed off to the run-time (throwing an exception)

//   - exceptions are thrown and caught by a function or method within your call stack (list of executed functions)

//   - exception handlers catch a specified exception and handles its occurance as to keep the program from terminating

//   - if an exception handler is not found in the call stack then the isolate is suspended and its program is typically terminated
//     with an indication that there was an unhandled exception along with the stack trace to identify where in the callstack the exception occurred

//   - all exceptions are unchecked exceptions (methods do not explictly state that an exception will be thrown and exceptions are not required to be caught)
//     in a language like Java methods explicitly state that they throw a specific exception

// Throwing Exceptions

//   - exceptions are thrown / raised using the 'throw' keyword in Dart

//   - throwing an exception is an expression and can be used anywhere expressions can be used

//   - any none nullable object can be thrown

//   - production code should only throw types that implement Error or Exceptions

// Catching Exceptions

//   - use the 'catch' keyword to capture exception objects
//     which can then be used in the catch clause body

//   - capturing, or catching an exception stops the exception from propagating down
//     the call stack 

//   - catching an exception allows you to handle its occurrence

//   - exceptions can be rethrown, allowing thr caller to thee the exception (continue to propigate down the call stack)

//   - rethrowing an error can be useful:
//
//       - to partially handle an excpetion

//       -  in U.I.'s where an API in the U.I. may handle the error and show a different view
//          if an excpetion arises like the FutureBuilder widgetin Flutter

// Catching Specific Exceptions

//   - the 'on' keyword is used to catch specific exceptions

//   - can chain on exceptions clauses together to handle multiple exception types

// Catching Multiple Exception Types

//   - when dealing with code that can throw multiple types
//     of exceptions you can deal with all of them with a
//     general catch clause or handle as many as you want
//     i separate catch clauses and have a catch all clause at the end

// catch(exception, stackTrace) Parameters

//   - catch has two parameters:

//       - exception: the object that was thrown

//       - stack trace: gives information about where in the call stack (executed functions) the exception occurred

// finally block

//   - finally clauses run regardless of exception occurrance

//   - if an exception does occur then the finally clause
//     runs after the catch clause handling the exception