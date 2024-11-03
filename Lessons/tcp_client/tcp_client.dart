import 'dart:io';

//!! TODO: look over notes in black and red notebooks and add comments

// Creating a Client Using Sockets and Dart

const host = "127.0.0.1";

const port = 8080;

Future<void> main() async {
  for (var i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1, milliseconds: 500));
    try {
      // create a new socket of type TCP bound to port 8080 requesting communication to a remote server
      final socketConnectionToServer = await Socket.connect(host, port);

      // send data to the server
      socketConnectionToServer.writeln("this is a message from the Dart client!");

      print("message successfully sent to server!");

      // listen for data coming from the server
      socketConnectionToServer.listen((data) {
        print("data received from the server: ${String.fromCharCodes(data)}");
        socketConnectionToServer.destroy();
      }, onDone: (() async {
        print("Server disconnected.\n");

        // close the connection in both directions
        await socketConnectionToServer.close();
      }), onError: (error) {
        print("error when listening to server communication: $error");

        // close the connection in both directions
        socketConnectionToServer.destroy();
      });
    } catch (e) {
      print("Error when attempting to create a socket connection to $host:$port");
    }
  }
}
