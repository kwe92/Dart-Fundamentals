import 'dart:io';

// TODO: for each tag add the duration to a list within a map matching that tag

// agruments are passed through the commandline when the file is initally called
// dart run commandLineProject.dart some_text_to_read_into_main_function
void main(List<String> arguments) {
  // The program should not run if the arguments array is empty
  if (arguments.isEmpty) {
    //
    print('Usage: dart totals.dart <input_file.csv>');

    exit(1); // exits the dart VM immediately
  }
  var input = arguments.first;
  var values = <String>[];
  var duration = 0.0;
  var durationByTag = {};
  var tag = '';

  try {
    var data = File(input).readAsLinesSync();
    //var durationByTag = {for (var tag in ) tag: []};
    printRows(data, numRows: 5);
    print('Length of $input is ${data.length} rows.');
    data.removeAt(0);
    for (var row in data) {
      values = row.split(',');
      duration = double.parse(values[3].replaceAll('"', ''));
      tag = values[5].replaceAll('"', '');
      durationByTag.addAll({tag: duration});
    }
    print(durationByTag);
  } catch (e) {
    print('Error message: $e' +
        '\n' +
        "The input: '$input' is not a valid file path string literal");
  }
  // data = readFile(file_name)
  // durationByTag = empty map
  // data.removeFirst() // because the first line is as header
  // for(row in data)
  //    values = data.split(',')
  //    duration = value[3]
  //    tag = values[5]
  //    update(durationByTag[tag], duration)
  // end
  // printAll(durationByTag)
}

/// Prints rows of a csv starting at numRows = 5 ny default.
void printRows(var data, {int numRows = 5}) {
  for (var row in data.getRange(0, numRows)) print(row);
}
