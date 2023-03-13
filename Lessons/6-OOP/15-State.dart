abstract class State {
  final int state;
  const State({required this.state});
}

class AppState extends State {
  AppState({required int state}) : super(state: state);
}

class StateGraph {
  static List<AppState> _state = [];
  static void apply(AppState state) => _state.add(state);
  static int get currentState => _state.last.state;
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
