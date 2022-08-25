// Exercise: Shopping List
// Given the following program:
// Rewrite this code so that the shoppingList variable is
// initialized using collection-if,
//collection-for or spreads,
//and the program output is the same.
void main() {
  const bananas = 5;
  const apples = 6;
  const grains = {
    'pasta': '500g',
    'rice': '1kg',
  };
  const addGrains = true;
  var shoppingList = {};
  if (bananas > 0) {
    shoppingList['bananas'] = bananas;
  }
  if (apples > 0) {
    shoppingList['apples'] = apples;
  }
  if (addGrains) {
    shoppingList.addAll(grains);
  }
  print(shoppingList);

  // declare the initalized shoppingList variable again
  shoppingList = {
    // if the variable bananas is greater than 0 add a string litteral key 'bananas'
    // set the value to be the value of the variable bananas
    if (bananas > 0) 'bananas': bananas,
    if (apples > 0) 'apples': apples,
    if (addGrains) ...grains
  };
  print(shoppingList);
  // The output should print {bananas: 5, apples: 6, pasta: 500g, rice: 1kg}
}
