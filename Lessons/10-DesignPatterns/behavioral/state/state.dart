// TODO: add a description of the state pattern

class TCPOctetStream {
  final String data;
  TCPOctetStream(this.data);
}

/// The Context class: TCPConnection
class TCPConnection {
  TCPState _state;

  // initialize initial state
  TCPConnection() : _state = TCPClosed.instance {
    print("TCPConnection: Initialized in Closed state.");
  }

  // Methods that delegate behavior to the current state
  void activeOpen() => _state.activeOpen(this);
  void passiveOpen() => _state.passiveOpen(this);
  void close() => _state.close(this);
  void send() => _state.send(this);
  void acknowledge() => _state.acknowledge(this);
  void synchronize() => _state.synchronize(this);
  void transmit(TCPOctetStream o) => _state.transmit(this, o);

  void processOctet(TCPOctetStream o) {
    print("TCPConnection: Processing data: '${o.data}'");
  }

  void _changeState(TCPState state) => _state = state;
}

/// The State interface/abstract class
abstract class TCPState {
  void transmit(TCPConnection t, TCPOctetStream o) {}
  void activeOpen(TCPConnection t) {}
  void passiveOpen(TCPConnection t) {}
  void close(TCPConnection t) {}
  void synchronize(TCPConnection t) {}
  void acknowledge(TCPConnection t) {}
  void send(TCPConnection t) {}

  void changeState(TCPConnection connection, TCPState state) {
    connection._changeState(state);
  }
}

/// Concrete State: Established
class TCPEstablished extends TCPState {
  static final _instance = TCPEstablished._internal();
  TCPEstablished._internal();
  static TCPEstablished get instance => _instance;

  @override
  void transmit(TCPConnection connection, TCPOctetStream octectStream) {
    connection.processOctet(octectStream);
  }

  @override
  void close(TCPConnection connection) {
    print("TCPEstablished: Closing connection...");
    changeState(connection, TCPClosed.instance);
  }

  @override
  void send(TCPConnection connection) {
    print("TCPEstablished: Sending data...");
  }
}

/// Concrete State: Listen
class TCPListen extends TCPState {
  static final TCPListen _instance = TCPListen._internal();
  TCPListen._internal();
  static TCPListen get instance => _instance;

  @override
  void send(TCPConnection t) {
    print("TCPListen: Sending SYN, moving to Established...");
    changeState(t, TCPEstablished.instance);
  }

  @override
  void transmit(TCPConnection connection, TCPOctetStream octectStream) {
    print("TCPListen: Received data, moving to Established...");
    changeState(connection, TCPEstablished.instance);
    connection.processOctet(octectStream);
  }
}

/// Concrete State: Closed
class TCPClosed extends TCPState {
  static final TCPClosed _instance = TCPClosed._internal();
  TCPClosed._internal();
  static TCPClosed get instance => _instance;

  @override
  void activeOpen(TCPConnection t) {
    print("TCPClosed: Active Open. Sending SYN...");
    changeState(t, TCPEstablished.instance);
  }

  @override
  void passiveOpen(TCPConnection t) {
    print("TCPClosed: Passive Open. Listening...");
    changeState(t, TCPListen.instance);
  }

  @override
  void send(TCPConnection t) {
    print("TCPClosed: Connection closed can not send, the connection must be established first...");
  }
}

// --- Execution Example ---
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
