// Null Safety

void main() {
  // Say that there is a null value in our collection on string literals
  // The code bellow will fail:
  //      const cities = <String>['San Antonio', 'Houston', null];

  // We can do one of to things:
  //    1. Remove all null values
  //    2. Allow null elements in our collection
  //        - const cities = <String?>['San Antonio', 'Houston', null];
  // Adding a question mark ? suffix to our type annotation will allow null values in a
  // explicitly defined collection

  // <String?> type annotations means that the value is either a String literal or a null value
  const cities = <String?>['San Antonio', 'Houston', null];

  // print all of the elements of our collection
  for (var city in cities)
    print(
        'First print statement of cities index: ${cities.indexOf(city)} | value: $city');

  // What if we need to access a method that is only available
  // if the element of our collection is not null?
  // The below code will fail if uncommented
  // for (var city in cities) city.toUpperCase();

  // to correct the afromentioned error we can use yet another question mark!
  // This time the question mark well call the method if it is not null and return null otherwise
  for (var city in cities)
    print(
        'Second print statement of cities index: ${cities.indexOf(city)} | value: ${city?.toUpperCase()}');

  // Assigning values to a variable if it is null
  var someVariable;
  print('value of someVariable: $someVariable');

  someVariable ??= 'if_some_variable_is_null_assign_me!';

  print(
      'value of someVariable after augmented assignment if null: $someVariable');
}
