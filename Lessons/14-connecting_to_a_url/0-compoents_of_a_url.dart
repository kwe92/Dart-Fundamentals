import 'dart:async';

Future<void> main() async {
  // Example: Components of a URL

  // final url = Uri.parse("http://example.com:80/docs/books/tutorial" + "/index.html?name=networking&isFun=true#DOWNLOADING");

  final url = Uri.parse("https://zenquotes.io/api/quotes");

  print("URL: $url\n");

  print("scheme: ${url.scheme}\n");

  print("authority: ${url.authority}\n");

  print("host: ${url.host}\n");

  print("port: ${url.port}\n");

  print("path: ${url.path}\n");

  print("query: ${url.query}\n");

  print("queryParameters: ${url.queryParameters}\n");

  // the anchor of a URL
  print("fragment: ${url.fragment}\n");
}

// What is a URL?

//   - an acronym standing for Uniform Resource Locator

//   - a refference (address) to a resource on the internet

//   - as the name implies a URL is a resource locator
//     and the resource in which it locates is one that is on the internet

// URL Object

//   - constructed from a parsed string representation of a URL

//   - breaks a string representation of a URL into its constituent component parts
//     accessed and manipulated through the URL objects properties and methods

//   - in the Dart language Uri.parse is used to parse a string representation of a URL

//   - URL objects remove the need to manually implement a regular expression
//     to do the common behavior of parsing a URL

// Decomposition of a URL

// Scheme

//   - the protocol defining the set of rules on how a particular resource is accessed and transmitted on the internet

//   - the scheme indicates the type of data and how that data should be communicated (formatting, transmission method, actions)
//     between one system and another

// Host Name

//   - typically a human readable name mapped to one or more IP addresses

//   - repesents the name of the machine providing the resource or service

//   - resolving the human readable name and what IP address it belongs to is abstracted away by the DNS and DNS Resolver

// Port

//   - ports are numerical 16-bit identifiers used to identify an application on a machine

//   - ports are local to a computer

//   - the first 1000 or so ports are well known ports that should not be used for application identification

//   - sockets bind to ports enabling client-server communication

//   - in most URL's port numbers are omitted as well-known port numbers are typically used (e.g. 80 or 443)

// Path

//   - the entire section of a URL after the host name and before any optional query parameters

//   - specifies the general location of a resource on a server

//   - could be a path to a file or any other resource a server can provide

//   - part of the path or the entire path can also be the endpoint of an API (typically web server function middleware and handlers)

//   - example: https://dart.dev/language/patterns#algebraic-data-types

//   - '/language/patterns' is the path in the above URL

// Query

//   - key-value pairs that are specific instructions sent to a server

//   - queries that are typically used for searching, filtering, and tracking

// Anchor / Reference /fragment

//   - used to jump to a specific place on a web page or document

//   - typically the last component of a URL

//   - example: https://dart.dev/language/patterns#algebraic-data-types

//   - '#algebraic-data-types' is the anchor of the above URL
