void main() {
  // Example: pattern variable declaration (new local varables)

  var (a, [b, c, _]) = ('a', ['b', 'c', 'd']);

  print(a + b + c);

  // Example: pattern variable assignment (reassigning existing local variables)

  // match pattern and declare and initalize local variables l and r
  var (l, r) = ('left', 'right');

  print(l + ' ' + r);

  // swap the variables
  (l, r) = (r, l);

  print(l + ' ' + r);
}

//  Places Where Patterns Can Appear

//   - match a pattern and then declare and initialize variables or reassign variables

//       - variable declaration must start with var or final and variable types are inferred

//       - local variable declarations and assignments (can be used anywhere local variables can be declared)

//       - pattern variable declaration matches against the value to the right of the declaration

//       - pattern variable assignment matches against the type of the variables to the left of the assigment

//       - matching objects have their values bound to local variables or left unbound using a wildcard _

//   - for and for-in loops

//   - if-case and switch-case statements

//   - control flow in collection literals (collection comprehensions)
