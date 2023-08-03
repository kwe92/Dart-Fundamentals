// ignore_for_file: unused_catch_stack

// TODO: Add Comments!

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

abstract class State {
  final int state;
  const State({required this.state});

  @override
  String toString() => 'State(state: $state)';
}

class AppState extends State {
  const AppState({required super.state});
}

typedef PreviousAppStateCallback = AppState Function(AppState previousState);

class StateGraph {
  // underscore _ named constructor prevents instantiation
  // without the need to make the class abstract

  StateGraph._();

  static final _states = <AppState>[];

  static List<AppState> get allStates => _states;

  static AppState get currentState => _states.last;

  static AppState get previousState => _states.length > 1 ? _states[_states.length - 2] : throw PreviousAppStateError();

  static void apply<T>(T state_or_state_callback) {
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

int main() {
  for (int i = 0; i < 5; i++) {
    StateGraph.apply(
      AppState(state: i),
    );
  }

  final PreviousAppStateCallback prevStateCallback = (AppState prevState) => AppState(
        state: prevState.state + 5,
      );

  spacedPrint('App Current State: ${StateGraph.currentState}', prefix_space: true);

  spacedPrint('App previous State: ${StateGraph.previousState}');

  StateGraph.apply(prevStateCallback);

  spacedPrint('App Current State: ${StateGraph.currentState}');

  StateGraph.apply(
    (AppState prevState) => AppState(
      state: prevState.state + 10,
    ),
  );

  spacedPrint('App Current State: ${StateGraph.currentState}');

  try {
    StateGraph.apply('I WILL CAUSE AN ERROR!');
  } catch (error, stackTrace) {
    spacedPrint(error);
  }

  return 0;
}
