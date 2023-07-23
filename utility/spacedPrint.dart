void spacedPrint<T>(T obj, {bool prefix_space = false, bool suffix_space = true}) => prefix_space && !suffix_space
    ? print('\n$obj')
    : !prefix_space && suffix_space
        ? print('$obj\n')
        : print('\n$obj\n');
