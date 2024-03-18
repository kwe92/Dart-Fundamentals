import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

void main() {
  weightedMoodData.sort((moodA, moodB) => moodA.createdAt.compareTo(moodB.createdAt));

  final groupedData = groupBy([for (var mood in weightedMoodData) mood.toMap()], (Map obj) => DateTime.parse(obj['createdAt']).day);

  final groupedDataV2 = [
    for (var moodMap in groupedData.entries)
      () {
        double value = 0;
        int count = 0;
        for (Map<String, dynamic> moodMap in moodMap.value) {
          value += moodMap["weight"];
          count++;
        }
        return {moodMap.key: value / count};
      }()
  ];

  weightedMoodData.forEach((element) {
    print(element);
    print((element.createdAt.difference(DateTime.now()).inDays).abs());
  });

  // print("Grouped mood data V2: $groupedDataV2");

  // print("Grouped mood data V2: $groupedData");
}

List<WeightedMood> weightedMoodData = [
  for (int i = 0; i < 50; i++)
    WeightedMood(
      mood: getRandomMood(),
      createdAt: getRandomDateTime(),
    )
];

class WeightedMood {
  final String mood;

  final DateTime createdAt;

  double get weight {
    return switch (mood) {
      MoodTypeConst.awesome => 1.0,
      MoodTypeConst.happy => 0.75,
      MoodTypeConst.okay => 0.5,
      MoodTypeConst.bad => 0.25,
      MoodTypeConst.terrible => 0.0,
      String() => 0.0,
    };
  }

  const WeightedMood({
    required this.mood,
    required this.createdAt,
  });

  @override
  String toString() => 'WeightedMood(mood: $mood, createdAt: $createdAt)';

  Map<String, dynamic> toMap() {
    return {
      'mood': mood,
      'createdAt': DateFormat("yyyy-MM-dd").format(createdAt),
      'weight': weight,
    };
  }

  factory WeightedMood.fromMap(Map<String, dynamic> map) {
    return WeightedMood(
      mood: map['mood'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightedMood.fromJson(String source) => WeightedMood.fromMap(json.decode(source));
}

enum MoodType {
  awesome("awesome"),

  happy("happy"),

  okay("okay"),

  bad("bad"),

  terrible("terrible");

  final String text;

  const MoodType(this.text);
}

class MoodTypeConst {
  MoodTypeConst._();
  static const awesome = "awesome";

  static const happy = "happy";

  static const okay = "okay";

  static const bad = "bad";

  static const terrible = "terrible";
}

class GetRandom {
  GetRandom._();

  static final rng = Random();

  /// exclusive range
  static int randRangeInt({int min = 0, required int max}) => rng.nextInt(max - min) + min;
}

String getRandomMood() {
  final int value = GetRandom.randRangeInt(min: 1, max: 6);

  return switch (value) {
    1 => MoodType.awesome.text,
    2 => MoodType.happy.text,
    3 => MoodType.okay.text,
    4 => MoodType.bad.text,
    5 => MoodType.terrible.text,
    int() => "",
  };
}

DateTime getRandomDateTime() {
  // final int value = GetRandom.randRangeInt(min: 1, max: 31);
  final int value = GetRandom.randRangeInt(min: 1, max: 32);

  return DateTime.now().add(Duration(days: -value));
}
