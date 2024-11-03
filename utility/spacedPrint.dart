// TODO: refactor snake case variables into camel case

/// print statement with optional prefix_space and suffix_space boolean parameters.
/// Allowing less bolierplate code when multiple print statements are required.
void spacedPrint<T>(T obj, {bool prefix_space = false, bool suffix_space = true}) => prefix_space && !suffix_space
    ? print('\n$obj')
    : !prefix_space && suffix_space
        ? print('$obj\n')
        : print('\n$obj\n');
