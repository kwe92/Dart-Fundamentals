// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:intl/intl.dart';

void main() {
  DateTime latestTimestamp = DateTime.fromMillisecondsSinceEpoch(0);

  // final timeService = TimeService();

  List<Transaction> transactions = List.generate(
    50,
    (index) => Transaction(
      transactionID: index.toString(),
      userID: index,
      accountID: index.toString(),
      merchantName: 'merchantName$index',
      amount: index.toDouble(),
      remainder: 0,
      chargedTransaction: false,
      transactionDate: getRandomDateTime(),
    ),
  );

  final latestTransaction =
      transactions.reduce((current, next) => current.transactionDate!.isAfter(next.transactionDate!) ? current : next);

  // transactions.forEach((element) {
  //   final timestamp = element.transactionDate;
  //   if (timestamp!.isAfter(latestTimestamp)) {
  //     latestTimestamp = timestamp;
  //   }
  // });

  print("latestTimestamp: $latestTimestamp");
}

DateTime getRandomDateTime() {
  // final int value = GetRandom.randRangeInt(min: 1, max: 31);
  final int value = randRangeInt(min: 1, max: 32);

  return DateTime.now().add(Duration(days: -value));
}

int randRangeInt({int min = 0, required int max}) => Random().nextInt(max - min) + min;

class Transaction {
  final String? transactionID;
  final int? userID;
  final String? accountID;
  final String? merchantName;
  final double amount;
  final double remainder;
  final bool chargedTransaction;
  final DateTime? transactionDate;

  double get total => amount + remainder;

  const Transaction({
    required this.transactionID,
    required this.userID,
    required this.accountID,
    required this.merchantName,
    required this.amount,
    required this.remainder,
    required this.chargedTransaction,
    required this.transactionDate,
  });

  Transaction.fromJson(Map<String, dynamic> json)
      : transactionID = json["transaction_id"],
        userID = json["user_id"],
        accountID = json["account_id"],
        merchantName = json["merchant_name"],
        amount = double.parse(json["amount"].toString()),
        remainder = double.parse(json["nearest_amount"].toString()),
        chargedTransaction = json["charged_transaction"],
        transactionDate = DateTime.parse(json["transaction_date"]);

  Map<String, dynamic> toJson() {
    return {
      "transaction_id": transactionID,
      "user_id": userID,
      "account_id": accountID,
      "charged_transaction": chargedTransaction,
      "transaction_date": transactionDate,
    };
  }

  @override
  String toString() {
    return 'Transaction(transactionID: $transactionID, userID: $userID, accountID: $accountID, merchantName: $merchantName, amount: $amount, remainder: $remainder, chargedTransaction: $chargedTransaction, transactionDate: $transactionDate)';
  }
}

/// Utility service for Duration's and DateTime's to parse and format timestamps.
class TimeService {
  /// Returns day of week as String for DateTime object, if DateTime omitted returns current day.
  String dayOfWeekByName([DateTime? dateTime]) {
    return DateFormat.EEEE().format(dateTime ?? DateTime.now());
  }

  /// Returns formatted DateTime string with the given pattern, if DateTime omitted returns current date formatted with pattern.
  String customDateString(String pattern, [DateTime? dateTime]) {
    return DateFormat(pattern).format(dateTime ?? DateTime.now());
  }

  /// Returns hh:mm as String for DateTime object, if DateTime omitted returns current hh:mm.
  String timeOfDay([DateTime? dateTime]) {
    return DateFormat.jm().format(dateTime ?? DateTime.now()).replaceAll("PM", "pm").replaceAll("AM", "am");
  }

  /// Returns string representation of DateTime object in the format yyyy-MM-dd.
  String getStringFromDate(DateTime dataTime) {
    return DateFormat("yyyy-MM-dd").format(dataTime.toUtc());
  }

  /// Returns the hour from 0-23
  String getContinentalTime(DateTime dateTime) {
    return DateFormat.H().format(dateTime);
  }

  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  String removeTimeStamp(DateTime date) => DateFormat("yyyy-MM-dd").format(date);
}


// DateFormat

//   - formate and parse dates in a locale sensitve manner
//   - the default for formatting and parsing is en_US

// Skeletons | Formatting Specifications

//   - a set of formatting specifications that come with named constructors
//   - you can pass the Skeleton as a String but using the named constructors are preferred (e.g. DateFormat.EEEE())
//   - you can pass a string for custom Formatting
//   - see the full formatting list here: https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html