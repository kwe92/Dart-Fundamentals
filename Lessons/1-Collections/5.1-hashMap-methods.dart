import 'dart:math';

import '../../utility/round.dart';

void main() {
  final double earthDiameterMi = 7917.5;

  final double jupiterDiameterMi = 86881;

  final double marsDiameterMi = 4212.3;

  // Array of planet diameters
  final diametersMi = [
    earthDiameterMi,
    jupiterDiameterMi,
    marsDiameterMi,
  ];

  // iterate over array of planet diameters
  // return their log base 2
  // transforming them to a similar scale
  // then destructure the results into individual variables

  final [
    earthDiameterBase2,
    jupiterDiameterBase2,
    marsDiameterBase2,
  ] = diametersMi.map((element) => round(logBase2(element), 2)).toList();

  final diametersBase2 = {
    earthDiameterBase2: 'Earth',
  };

  final otherDiametersBase2 = {
    jupiterDiameterBase2: 'Jupiter',
    marsDiameterBase2: 'Mars',
  };

  print('\nHashMap before calling putIfAbsent:\n\n  $diametersBase2\n');

  otherDiametersBase2.entries.forEach(
    (mapEntry) => diametersBase2.putIfAbsent(
      mapEntry.key,
      () => mapEntry.value,
    ),
  );
  print('\HashMap after calling putIfAbsent with keys that DO NOT EXIST:\n\n  $diametersBase2\n');

  print(
    'Calling putIfAbsent on an EXISTING key returns the value: \n\n  Existing key: $marsDiameterBase2\n\n  the keys value that is returned: ${diametersBase2.putIfAbsent(12.04, () => 'I SHOULD ALREADY EXISTS')} \n',
  );
}

// HashMap.putIfAbsent

//   - Looks up a provided key

//   - if the key exists its value is returned

//   - if the key does not exists then a value is mapped
//     to the key via a ifAbsent callback

double logBase2(double x) => log(x) / log(2);
