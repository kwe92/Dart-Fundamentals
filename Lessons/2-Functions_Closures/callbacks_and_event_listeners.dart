/// A class that can be extended or mixed to provide
/// a subscription mechanism using callbacks.
///
/// Listeners are registered in O(1) and removed in O(n).
abstract mixin class EventListener {
  /// The set of current callbacks that notify subscribers.
  Set<Function> get listeners;

  /// Registers a callback to notify a subscriber of events or changes in state.
  ///
  /// If the callback is already registered i.e. the function name and signature match a registered callback, then does nothing.
  void addListener<T>({required void Function(T) listener});

  /// Removes a previously registered callback if it exist, otherwise does nothing.
  void removeListener<T>({required void Function(T) listener});

  /// Calls all callbacks in the set of listeners
  /// to notify all subscribers that an event occured or some state has changed.
  void callListeners();

  /// Removes all registered callbacks from the set of listeners.
  void dispose();
}

class Counter with EventListener {
  Set<Function> _listeners = {};

  // mutable state you wish to observe
  int _value = 0;

  @override
  Set<Function> get listeners => _listeners;

  int get value => _value;

  void increment() {
    // change the state of the object
    _value++;

    // notify subscribers of state change
    callListeners();
  }

  @override
  void addListener<Counter>({required void Function(Counter) listener}) {
    _listeners.add(listener);
  }

  @override
  void removeListener<Counter>({required void Function(Counter) listener}) {
    final wasListenerRemoved = _listeners.remove(listener);

    wasListenerRemoved ? print('Listener found and removed.') : print('Listener was not found.');
  }

  @override
  void callListeners() {
    // definsive copy of the set of listeners using {...listeners}
    for (var listener in {..._listeners}) {
      // the Counter passes itself as an argument to the listener callback to be used
      listener.call(this);
    }
  }

  @override
  void dispose() {
    _listeners = {};
  }

  @override
  String toString() => 'Counter(value: $_value)';
}

void main() {
  final counter = new Counter();

  final void Function(Counter) callback1 = (Counter counter) => print('listener1 called as value changes: $counter');

  final void Function(Counter) callback2 =
      (Counter counter) => print('listener2 called as value changes: ${counter.value * counter.value}');

  print('# of subscribers: ${counter.listeners.length}');

  counter.addListener<Counter>(listener: callback1);

  // attempt to add the same listener twice, does nothing.
  counter.addListener<Counter>(listener: callback1);

  counter.addListener<Counter>(listener: callback2);

  print('# of subscribers: ${counter.listeners.length}'); // should be 2

  for (int i = 0; i < 4; i++) {
    counter.increment();
  }

  print('Counter value: ${counter.value}');

  counter.removeListener<Counter>(listener: callback1);

  counter.dispose();

  // attempt to remove a callback that does not exist in the set of listeners, does nothing.
  counter.removeListener<Counter>(listener: callback2);
}

// Callback

//   - a first class function that a client (code calling a module) passes to a module
//     as an argument to be called within the modules implementation

//   - callbacks are typically executed at a later point in time due to some event
//     occuring or some action being taken

//   - mainly used for asynchronous execution and event handling

// Callback: Key Features

//    - passed as an argument to a class or function

//    - executed within a class or function implementation at a later point in time, often asynchronously

//    - commonly used for event handling in GUI's e.g. user interactions such as button clicks

//    - often used in the listener pattern

//    - can be used in asynchronous data processing:

//        - e.g. the caller starts an asynchronous operation and the callback is executed once the data is available
//          such as a FutureBuilder or StreamBuilder in the Flutter SDK

// Listener / Observer Pattern

//   - a behavioral design pattern that uses a subscription mechanism to
//     notify objects of any events or changes in the state of the object they are observing

//   - the object that has the state you wish to observe is known as the 'Subject'

//   - the 'Subject' becomes the 'Publisher' when a notification mechanism is added to it (some listenable or observation API)
//
//   - the notification mechanism should:

//       - have a set or collection of subscribers with an update method or callbacks associated with a subscriber (listeners)

//       - give subscribers the ability to add and remove themselves from the subscription (set/collection of subscribers or callbacks)
//         dynamically at runtime

//       - allow the 'Publisher' to notify all registered 'Subscribers' of changes in its state
//         or events that have been triggered by calling the subscribers update method or associated callback (listener)


// When to Use Oberver / Listener Pattern

//   - when a change in one object affects other objects, which is particularly prevalent in graphical user intefaces

//   - when you want some objects to observe another objects state or events for a limited time as subscriptions can be removed dynamically at runtime


// Ways to Implement

//   - Subscriber Interface (with update method) and Publisher Interface (holds, registers, removes, and calls subscribers)

//   - Publisher Interface that holds, registers, removes, and calls listeners (callbacks / closures)
//     that a Subscriber passes to the Publisher