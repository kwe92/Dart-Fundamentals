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

  final List<String> unknownDomains = emails
      .map((stringElement) => stringElement
          .split('@')
          .last) // returns Iterable ('abc.com', 'example.com', 'gmail.com', 'yahoo.com')
      .where((domain) => !knownDomains
          .contains(domain)) // returns Iterable ('abc.com', 'example.com')
      .toList(); // returns ['abc.com', 'example.com']

  print(unknownDomains); // prints ['abc.com', 'example.com']
}
