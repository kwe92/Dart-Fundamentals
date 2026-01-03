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
  static final _instance = TCPListen._internal();
  TCPListen._internal();
  static TCPListen get instance => _instance;

  @override
  void send(TCPConnection connection) {
    print("TCPListen: Sending SYN, moving to Established...");
    changeState(connection, TCPEstablished.instance);
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
  static final _instance = TCPClosed._internal();
  TCPClosed._internal();
  static TCPClosed get instance => _instance;

  @override
  void activeOpen(TCPConnection connection) {
    print("TCPClosed: Active Open. Sending SYN...");
    changeState(connection, TCPEstablished.instance);
  }

  @override
  void passiveOpen(TCPConnection connection) {
    print("TCPClosed: Passive Open. Listening...");
    changeState(connection, TCPListen.instance);
  }

  @override
  void send(TCPConnection connection) {
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

// 1. Core Identity

      // Pattern Name: State
      // Category: Behavioral (Object)
      // Also Known As: Objects for States
      // Intent: Allow an object to alter its behavior when its internal state changes. The object
      // will appear to change its class.

// 2. The Problem & Solution (Motivation)

      // Scenario: A TCP Connection behaves differently depending on its status (Established,
      // Listening, Closed).
      // Problem: Monolithic conditional logic (if-else or switch-case statements) scattered
      // throughout methods like Open() or Send() is hard to maintain and extend.
      // Solution: Introduce an abstract class (TCPState) to represent states. Each specific state
      // (TCPClosed, TCPEstablished) becomes a subclass that implements the behavior valid
      // for that state. The Context (TCPConnection) delegates requests to its current state object.

// 3. Participants

      // Context (TCPConnection):

            // - Defines the interface of interest to clients.
            // - Maintains an instance of a ConcreteState subclass that defines the current state.

      // State (TCPState):

            // - Defines an interface for encapsulating behavior associated with a particular state.

      // ConcreteState (TCPClosed, TCPEstablished):

           // - Implements behavior associated with a state of the Context.

// 4. Consequences

      // Localization: Localizes state-specific behavior. New states are just new classes.
      // Explicitness: Makes state transitions explicit (reassigning a variable) rather than
      // implicit (changing data values inside variables).
      // Structure: Replaces large monolithic conditional statements with object polymorphism.
      // Class Explosion: Increases the number of classes.
      // Sharing: State objects with no internal instance variables (stateless) can be shared
      // among Contexts (acting as Flyweights/Singletons).

// 5. Implementation Issues

      // Transitions: Who defines the next state:

      // - Option A: The Context handles logic (Fixed/Rigid).

      // - Option B: The State subclasses handle logic (Flexible/Decentralized). The sample
      //   code uses this approach (State calls `context.changeState(newState)`).

      // Creation vs. Reuse:

          // - Create state objects on demand and destroy them (low memory, high CPU).
          // - Create all state objects once and reuse them (high memory, zero CPU transition cost).

// 6. Sample Code Use Case & Analysis

      // Scenario: A TCP Connection Life-cycle.

          // Delegation Model (The "Magic"):

          // - The Client calls `connection.activeOpen()`.
          // - The Connection delegates: `_state.activeOpen(this)`.
          // - If `_state` is currently `TCPClosed`:
          // - It prints "Active Open...".
          // - It calls `changeState(connection, TCPEstablished.instance)`.
          // - Now `_state` is `TCPEstablished`.
          // - The next call `connection.transmit()` is handled by `TCPEstablished`, which processes data.
          // - If the client calls `close()`, `TCPEstablished` handles the cleanup and transitions
          //   back to `TCPClosed`.

          // Behavioral Change:
          
          // - Notice that calling `connection.send()` when closed prints an error ("Cannot send").
          // - Calling `connection.send()` when established prints "Sending data...".
          // - The Context object (Connection) effectively "changed its class" behavior at runtime.
