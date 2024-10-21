// ignore_for_file: unused_import

import '9.2-confilcting_extension_1.dart';

import '9.3-confilcting_extension_2.dart' hide ConfilctingExtension2;

import '9.5-confilcting_extension_3.dart' as og;

import '9.4-confilcting_extension_3_copy.dart';

void main() {
  final value = '42';

  print(value.parseInt());

  // using a prefix apply extension on value explicitly, acting as a wrapper around the value
  og.ConfilctingExtension3(value).parseDouble();

  print(value.parseNum());
}


// Extension Method API Conflicts

//   - when extension members conflict with an interface or existing extension
//     there are a few ways conflicts can be handled

//   - conflicting extensions: a member named 'parseInt' is defined in extension 'ConfilctingExtension1'
//     and extension 'ConfilctingExtension2', and none are more specific


// Extension Method API Conflict Resolutions

//   - hide one of the conflicting named extensions

//   - apply the extension explicitly

//   - import using an 'as' prefix