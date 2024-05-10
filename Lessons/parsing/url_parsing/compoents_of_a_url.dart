import 'dart:async';
import 'dart:convert';
import 'dart:io';

// TODO: Refactor Comments

// TODO: rename file and move to a diffrent folder

// Parsing a URL With Uri Getter Accessor Methods

Future<void> main() async {
  final url = Uri.parse("https://zenquotes.io/api/quotes");

  // final url = Uri.parse("http://example.com:80/docs/books/tutorial" + "/index.html?name=networking&isFun=true#DOWNLOADING");

  print("\nURL: $url");

  print("\nscheme: ${url.scheme}");

  print("\nauthority: ${url.authority}");

  print("\nhost: ${url.host}");

  print("\nport: ${url.port}");

  print("\npath: ${url.path}");

  print("\nquery: ${url.query}");

  print("\nqueryParameters: ${url.queryParameters}\n");

  // Connecting a URL
  final client = HttpClient();

  // open an HTTP connection to the url with an HTTP method of GET
  final HttpClientRequest request = await client.openUrl('GET', url);

  // set the content type of the data being sent
  request.headers.contentType = ContentType('application', 'json', charset: 'utf-8');

  // close the request for input and return a response object
  final HttpClientResponse response = await request.close();

  String responseBody = "";

  List<dynamic> result;

  // subscribe to the response stream
  final StreamSubscription responseStream = response.listen((List<int> data) {
    // data comes in as a stream of bytes read in chunks into a string that can be decoded as json
    responseBody += String.fromCharCodes(data);
  });

  responseStream.onDone(() {
    result = List<Map<String, dynamic>>.from(jsonDecode(responseBody));

    print("response result: $result");

    responseStream.cancel();
  });

  client.close();
}

// What is a URL?

//   - an acronym standing for Uniform Resource Locator

//   - a refference (address) to a resource on the internet

//   - as the name implies a URL is a resource locator
//     and the resource in which it locates is one that is on the internet

// Decomposition of a URL

// Scheme

//   - the protocol defining the set of rules on how a particular resource is accessed and transmitted on the internet

//   - the scheme indicates the type of data and how that data should be communicated (formatting, transmission method, actions)
//     between one system and another

// Host Name

//   - typically a human readable name mapped to an IP address

//   - repesents the name of the machine providing the resource or service

//   - resolving the human readable name and what IP address it belongs to is abstracted away by the DNS and DNS Resolver

// Port

//   - ports are numerical 16-bit identifiers used to identify an application on a machine

//   - ports are local to a computer

//   - the first 1000 or so ports are well known ports that should not be used if apllications

//   - sockets bind to ports enabling client-server communication

// Path

//   - the entire section of a URL after the domain name and before any optional query parameters

//   - specifies the general location of a resource on a server

//   - could be a path to a file or any other resource a server can provide

//   - part of the path or the entire path can be the endpoint of an API

// Query

//   - key-value pairs that are specific instructions sent to a server

//   - queries are typically used for searching filtering and tracking

// Anchor / Reference

//   - used to jump to a specific place in a document
