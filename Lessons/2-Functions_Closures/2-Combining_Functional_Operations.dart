// Combining Functional Operations

//   - method chaining

// Task:

//   - given list of email addresses and known domains
//   - parse domain name from email list
//   - return known and unknown domains in seprate collections

void main() {
  // List of known email adresses
  const List<String> emails = [
    'abc@abc.com',
    'me@example.com',
    'john@gmail.com',
    'katy@yahoo.com',
  ];

  // List of known domains
  const List<String> knownDomains = [
    'gmail.com',
    'yahoo.com',
  ];

// returns ['abc.com', 'example.com']
  final List<String> unknownDomains = emails
      .map(
        (emailAddress) => emailAddress.split('@').last,
      )
      .where(
        (domain) => !knownDomains.contains(domain),
      )
      .toList();

  print(unknownDomains); // prints ['abc.com', 'example.com']
  print(
    'Values using getUnknownDomains function: ${getUnknownDomains(emails, knownDomains)}',
  );
}

// getUnknownDomains
Iterable<String> getUnknownDomains(List<String> emails, List<String> knownDomains) => emails
    .map(
      (emailAddress) => emailAddress.split('@').last,
    )
    .where(
      (domain) => !knownDomains.contains(domain),
    );
