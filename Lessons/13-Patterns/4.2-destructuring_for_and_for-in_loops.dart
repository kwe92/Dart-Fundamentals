void main() {
  final json = {
    'key_1': 'value1',
    'key_2': 'value2',
    'key_3': 'value3',
    'key_4': 'value4',
  };

  // Object destructuring

  //   - match objects of type MapEntry and assign the property key to the variable k
  //    and use the property value getter

  for (var MapEntry(key: k, :value) in json.entries) {
    print(k + ': ' + value);
  }
}

// Destructuring: For and for-in loops

//   - you can use patterns in for and for-in loops to iterate-over and destructure values in a collection

