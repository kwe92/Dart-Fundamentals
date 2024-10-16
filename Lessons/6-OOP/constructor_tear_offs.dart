void main() {
  var verse = 'but let patience have her perfect work that ye may be perfect and entire wanting nothing';

  // paassing in the function stringCodeUnits by reference
  var charCodes = verse.split(' ').map(stringCodeUnits);

  print(charCodes);

  // paassing in the named factory constructor String.fromCharCodes by reference
  var strings = charCodes.map(String.fromCharCodes).toString();

  print(strings);
}

List<int> stringCodeUnits(String word) => word.codeUnits;

// Constructor Tear-Offs (Constructor Pass by Reference)

//   - you can ommit (tear-off) a constructor application (parenthesis) and
//     use the constructor as a closure if the constructor being used has the
//     same signature and return type as the closure expected

//   - in simple terms you can pass a constructor by reference
