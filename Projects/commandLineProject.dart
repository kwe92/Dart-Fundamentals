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
  var tag = '';
  Set tags = {};
  num totalDuration = 0;

  try {
    var data = File(input).readAsLinesSync();
    // printRows(data, numRows: 5);
    print('Length of $input is ${data.length} rows.');
    data.removeAt(0);

    for (var row in data) {
      values = row.split(',');
      tag = values[5].replaceAll('"', '');
      tags.add(tag);
    }

    var durationByTag = {
      for (var tag in tags) tag = tag == '' ? 'Unallocated' : tag: []
    };

    for (var row in data) {
      values = row.split(',');
      duration = double.parse(values[3].replaceAll('"', ''));
      tag = values[5].replaceAll('"', '');
      //durationByTag.addAll({tag: duration});
      durationByTag[tag]?.add(duration);
    }

    durationByTag.forEach((key, value) {
      print('Tag: $key | Tag Duration: ${sum(value)}');
      // print('Tag: $key | Average Duration: ${avg(value)}');
      // print('Tag: $key | Total Duration: ${sum(value)}');
    });

    durationByTag.forEach((key, value) {
      totalDuration += sum(value);
    });
    print(
        'Total Duration Hrs: ${double.parse(totalDuration.toStringAsFixed(2))}');
    print(
        'Total Duration Days: ${double.parse((totalDuration / 24).toStringAsFixed(2))}');
    print(
        'Total Duration Working 8 hrs/Day: ${double.parse((totalDuration / 8).toStringAsFixed(2))}');
  } catch (e) {
    print('Error message: $e' +
        '\n' +
        "The input: '$input' is not a valid file path string literal");
  }
}

/// Prints rows of a csv starting at numRows = 5 by default.
void printRows(var data, {int numRows = 5}) {
  for (var row in data.getRange(0, numRows)) print(row);
}

num avg(var iter) {
  num val = 0;
  for (var element in iter) val += element;

  final result = val / iter.length;
  return result;
}

num sum(var iter) {
  num val = 0;
  for (var element in iter) val += element;
  val = double.parse(val.toStringAsFixed(2));
  return val;
}
