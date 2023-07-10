abstract class State {
  final int state;
  const State({required this.state});

  @override
  String toString() => 'State(state: $state)';
}

class AppState extends State {
  const AppState({required super.state});
}

class StateGraph {
  static List<AppState> _states = [];
  static List<AppState> get allStates => _states;
  static AppState get currentState => _states.last;
  static void apply(AppState state) => _states.add(state);
}

int main() {
  for (int i = 0; i < 5; i++) {
    StateGraph.apply(
      AppState(state: i),
    );
  }

  print('App Current State: ${StateGraph.currentState}');

  return 0;
}
