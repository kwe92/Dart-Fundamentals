class TCPOctetStream {
  final String data;
  TCPOctetStream(this.data);
}

/// Define the states as an Enum instead of Classes
enum TCPState { closed, listen, established }

class TCPConnection {
  // Store state as an Enum value
  TCPState _state;

  TCPConnection() : _state = TCPState.closed {
    print("TCPConnection: Initialized in Closed state.");
  }

  // --- Actions ---

  void activeOpen() {
    switch (_state) {
      case TCPState.closed:
        print("TCPClosed: Active Open. Sending SYN...");
        _state = TCPState.established;
        break;
      case TCPState.listen:
      case TCPState.established:
        break;
    }
  }

  void passiveOpen() {
    switch (_state) {
      case TCPState.closed:
        print("TCPClosed: Passive Open. Listening...");
        _state = TCPState.listen;
        break;
      case TCPState.listen:
      case TCPState.established:
        // No action defined
        break;
    }
  }

  void close() {
    if (_state == TCPState.closed) {
      print("Connection already closed");
      return;
    }
    _state = TCPState.closed;
    print("Connection closed.");
  }

  void send() {
    switch (_state) {
      case TCPState.listen:
        print("TCPListen: Sending SYN, moving to Established...");
        _state = TCPState.established;
        break;
      case TCPState.established:
        print("TCPEstablished: Sending data...");
        break;
      case TCPState.closed:
        print("TCPClosed: Connection closed can not send, the connection must be established first...");
        break;
    }
  }

  void transmit(TCPOctetStream o) {
    switch (_state) {
      case TCPState.listen:
        print("TCPListen: Received data, moving to Established...");
        _state = TCPState.established;
        processOctet(o);
        break;
      case TCPState.established:
        processOctet(o);
        break;
      case TCPState.closed:
        break;
    }
  }

  void acknowledge() {}
  void synchronize() {}

  // --- Internal Helpers ---

  void processOctet(TCPOctetStream o) {
    print("TCPConnection: Processing data: '${o.data}'");
  }
}

void main() {
  final connection = TCPConnection();
  final streamData = TCPOctetStream("Hello World");

  connection.activeOpen(); // Transitions to Established from Closed

  connection.transmit(streamData);

  connection.send();

  connection.close();

  connection.send();

  connection.passiveOpen(); // Transitions to Listen from Closed

  connection.transmit(streamData); // Transitions to Established from Listen

  connection.send();

  connection.close();

  connection.send();
}
