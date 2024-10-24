import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final url = Uri.parse("https://zenquotes.io/api/quotes");

  // Example: Connecting a URL

  final client = HttpClient();

  // open an HTTP connection (start a client request) to the url with an HTTP method of GET
  final httpClientRequest = await client.openUrl('GET', url);

  // set the content type of the data being sent (in the request)
  httpClientRequest.headers.contentType = ContentType('application', 'json', charset: 'utf-8');

  // close the request (send the request) for input and return a response object
  final httpClientResponse = await httpClientRequest.close();

  var responseBody = "";

  var result = <Map<String, Object?>>[];

  // subscribe to (open) the response stream to read response data
  final responseStream = httpClientResponse.listen((data) {
    // read incoming response data as a stream of bytes
    // read in chunks into a string that can be decoded as json
    responseBody += String.fromCharCodes(data);
  });

  responseStream.onDone(() {
    result = List.from(jsonDecode(responseBody));

    print("response result: $result");

    // close the stream
    responseStream.cancel();
  });

  // close the HTTP connection
  client.close();
}

//!! TODO: search through both the black and red note books on inforamtion on the bellow topic
// client-server communication - Request Response Life Cycle