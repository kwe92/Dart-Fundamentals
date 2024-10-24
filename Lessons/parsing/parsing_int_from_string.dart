// Example: Parse an integer from Payments Terms and return todays date plus that integer as days

void main() {
  const paymentTerm = 'Net 7 Days';

  final now = DateTime.now();

  print('Created Date: $now');

  print('Payment Due Date: ${_paymentDue(paymentTerm)}');
}

DateTime _paymentDue(String paymentTerm) {
  final date = DateTime.now();

  final newDate = DateTime(date.year, date.month, date.day + parseInt(paymentTerm));

  return newDate;
}

int parseInt(String s) => int.parse(s.replaceAll(new RegExp(r'[^0-9]'), ''));
