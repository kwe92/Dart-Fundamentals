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
    var lines = File(input).readAsLinesSync();
    for (var line in lines) print(line);
    print('Length of $input is ${lines.length} rows.');
  } catch (e) {
    print(
        'The value passed to arguments from the command line should be a csv file.');
  }

  //print('Command line arguements passed to the main function: $input');
}
