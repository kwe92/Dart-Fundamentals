import 'dart:io';

// Creating a Client Using Sockets and Dart

const host = "127.0.0.1";

const port = 8080;

Future<void> main() async {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1, milliseconds: 500));
    try {
      // create a new socket of type TCP bound to port 8080 requesting cummincation to a remote server
      final socketConnectionToServer = await Socket.connect(host, port);

      // send data to the server
      socketConnectionToServer.writeln("this is a message from DART!");

      print("message successfully sent to server!");

      // listen for data coming from the server
      socketConnectionToServer.listen((data) {
        print("data received from the server: ${String.fromCharCodes(data)}");
      }, onDone: (() {
        print("Server disconnected.");

        // close the connection in both directions
        socketConnectionToServer.destroy();
      }), onError: (error) {
        print("error when listening to server communication: $error");

        // close the connection in both directions
        socketConnectionToServer.destroy();
      });

      socketConnectionToServer.destroy();
    } catch (e) {
      print("Error when attempting to create a socket connection to $host:$port");
    }
  }
}

// TODO: Understand String.fromCharCodes