// Combining Functional Operations
//    - you can method chain or combine functional operations or methods

// Task
//    - Given a list of email addresses and known domains:
//        - Parse the domain name from the email list and return only domains that are unknown
//        - Complete the task only using functional operatons and chaining them together

void main() {
  // List of known email adresses
  const emails = <String>[
    'abc@abc.com',
    'me@example.com',
    'john@gmail.com',
    'katy@yahoo.com'
  ];

  // List of known domains
  const knownDomains = <String>['gmail.com', 'yahoo.com'];

  // returns Iterable ('abc.com', 'example.com', 'gmail.com', 'yahoo.com')
  // returns Iterable ('abc.com', 'example.com')
  final List<String> unknownDomains = emails
      .map((stringElement) => stringElement.split('@').last)
      .where((domain) => !knownDomains.contains(domain))
      .toList(); // returns ['abc.com', 'example.com']

  print(unknownDomains); // prints ['abc.com', 'example.com']
  print(
      'Values using getUnknownDomains function: ${getUnknownDomains(emails, knownDomains)}');
}

// getUnknownDomains
//    - takes two arguments, both Lists of Strings
//    - Returns the values in the first List not in the Second list
Iterable<String> getUnknownDomains(
        List<String> emails, List<String> knownDomains) =>
    emails
        .map((stringElement) => stringElement.split('@').last)
        .where((domain) => !knownDomains.contains(domain))
        .toList();
