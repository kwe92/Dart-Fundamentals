import '../../utility/spacedPrint.dart';

class PreviousAppStateError extends Error {
  @override
  String toString() => 'There is no previous state';
}

class AppStateError<T> extends Error {
  final T obj;
  AppStateError({required this.obj});
  @override
  String toString() =>
      'the state_or_state_callback argument must be of type AppState or PreviousAppStateCallback but a type of ${obj.runtimeType} was recieved.';
}

// Abstract representation of a stateful object with an integer value

//   - State Representation

abstract class State {
  final int state;
  const State({required this.state});

  @override
  String toString() => 'State(state: $state)';
}

// Concrete implementation of the abstract State class
class AppState extends State {
  const AppState({required super.state});
}

typedef PreviousAppStateCallback = AppState Function(AppState previousState);

// State Management Object

class StateGraph {
  StateGraph();

  // list of all states
  final _states = <AppState>[];

  List<AppState> get states => _states;

  AppState get currentState => _states.last;

  AppState get previousState => _states.length > 1 ? _states[_states.length - 2] : throw PreviousAppStateError();

  // State Transition Function
  void apply<T>(T state_or_state_callback) {
    if (state_or_state_callback is AppState) {
      final AppState appState = state_or_state_callback;
      _states.add(appState);
      return;
    }
    if (state_or_state_callback is PreviousAppStateCallback) {
      final stateCallback = state_or_state_callback;
      final appState = stateCallback.call(previousState);
      _states.add(appState);
      return;
    } else {
      throw AppStateError(obj: state_or_state_callback);
    }
  }
}

void main() {
  final stateGraph = StateGraph();

  for (int i = 0; i < 5; i++) {
    stateGraph.apply(
      AppState(state: i),
    );
  }

  final prevStateCallback = (AppState prevState) => AppState(state: prevState.state + 5);

  spacedPrint('App Current State: ${stateGraph.currentState}', prefix_space: true);

  spacedPrint('App previous State: ${stateGraph.previousState}');

  stateGraph.apply(prevStateCallback);

  spacedPrint('App Current State: ${stateGraph.currentState}');

  stateGraph.apply((AppState prevState) => AppState(state: prevState.state + 10));

  spacedPrint('App Current State: ${stateGraph.currentState}');

  spacedPrint('app states: ${stateGraph.states}');

  try {
    stateGraph.apply('I WILL CAUSE AN ERROR!');
  } catch (error, _) {
    spacedPrint(error);
  }
}

// State Graph

//   - visual representation of a finite state machine (FSM)

//   - Consists of:

//       - all possible states of a system

//       - transitions (functions) between states


// Complex State Management

//   - it is better to use libraries for more complex state management
