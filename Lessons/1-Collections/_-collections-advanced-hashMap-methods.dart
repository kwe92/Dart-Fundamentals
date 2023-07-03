import 'dart:math';

import '../../Projects/restaurantProject.dart';

// TODO: Add comments and explain what you are doing

// creates a log base 2 function

double logBase2(double x) => log(x) / log(2);
void main() {
  final double earthDiameterMi = 7917.5;

  final double jupiterDiameterMi = 86881;

  final double marsDiameterMi = 4212.3;

  final Iterable<double> diametersMi = [
    earthDiameterMi,
    jupiterDiameterMi,
    marsDiameterMi,
  ];

  final [
    earthDiameterBase2,
    jupiterDiameterBase2,
    marsDiameterBase2,
  ] = diametersMi
      .map((double element) => round(
            logBase2(element),
            precision: 2,
          ))
      .toList();

  final diametersBase2 = <double, String>{
    earthDiameterBase2: 'Earth',
  };

  final otherDiametersBase2 = <double, String>{
    jupiterDiameterBase2: 'Jupiter',
    marsDiameterBase2: 'Mars',
  };

  print('\nbefore putIfAbsent: $diametersBase2\n');

  otherDiametersBase2.entries.forEach(
    (MapEntry mapEntry) => diametersBase2.putIfAbsent(
      mapEntry.key,
      () => mapEntry.value,
    ),
  );
  print('\nafterputIfAbsent: $diametersBase2\n');
}
