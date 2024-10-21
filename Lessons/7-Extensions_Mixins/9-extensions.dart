extension Capitalize on String {
  String capitalize() {
    final letter = this.substring(0, 1);

    final rest = this.substring(1, this.length);

    final capitalLetter = letter.toUpperCase();

    return capitalLetter + rest;
  }

  String capitalizeAll() {
    List<String> words = this.split(" ");

    words = words.map((word) => word.capitalize()).toList();

    final result = _convertToSenetence(words);

    return result;
  }

  String _convertToSenetence(List<String> words) => words.reduce((value, element) => value + " " + element);
}

void main() {
  const quote =
      "books are the training weights of the mind. They are very helpful, but it would be a bad mistake to suppose that one has made progress simply by having internalized their contents.";

  print(quote.capitalizeAll());
}


// Extension Methods

//   - API's once implemented and widely used should rarely be changed (Open Closed Principle - API's should be open for extension but closed for modification)

//   - to add additional functionality without affecting the API directly you
//     can extend its functionallity with Extension Methods

//   - Extension Methods allow you to add methods to an existing API
//     as well as getters, setters, and operators i.e. infix functions (-, +, [], etc)

//   - Extension methods can also have static fields and static helper methods

//   - extensions can have names to help with conflicts of another API if one arises

//   - Extensions reference 'this' to point to the current class instance (Object)

// Extension Syntax

//   - extension ExtensionName? on ExistingAPI {set of methods you wish to add...}

// Using Extenstion Methods

//   - can be used locally in the libary they were implemented in or
//     imported into a new module to be used there

// Unnamed Extensions

//   - can only be implemented within the library they were declared

//   - as they have no way to resolve API conflicts

// Generic Extensions

//   - extension methods with generic type parameters

//   - the place holder (stand-in) type is bound based on the underlying data structures
//     static type

// dynamic Type and Extension Methods

//   - you can not call an extension method on variables of type dynamic

//   - extension methods are resolved against the static type of the reciever
//     so they do work with type inference, static type annotations and type arguments
