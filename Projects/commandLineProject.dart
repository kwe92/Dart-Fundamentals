import 'dart:io';

/// The entry point to our program
// Define the type explicitly in the main function call
// agruments are passed through the commandline when the file is initally called
// dart run commandLineProject.dart some_text_to_read_into_main_function
void main(List<String> arguments) {
  // The program should not run if the arguments array is empty
  if (arguments.isEmpty) {
    //
    print('Usage: dart totals.dart <input_file.csv>');
    // import dart i/o for the exit function and pass 1 to it to indicate failure
    // exits the dart VM immediately
    exit(1);
  }
  var input = arguments.first;

  try {
    var data = File(input).readAsLinesSync();
    printRows(data, numRows: 5);
    print('Length of $input is ${data.length} rows.');
  } catch (e) {
    print('Error message: $e' +
        '\n' +
        "The input: '$input' is not a valid file path string literal");
  }

  //print('Command line arguements passed to the main function: $input');
}

/// Prints rows of a csv starting at numRows = 5 ny default.
void printRows(var data, {int numRows = 5}) {
  for (var row in data.getRange(0, numRows)) print(row);
}
