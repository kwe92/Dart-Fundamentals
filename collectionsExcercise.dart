void main() {
  // Create an array of numbers then sum them
  var myList = [1, 3, 5, 7, 9];
  print('The sum of $myList is ${sum(myList)}');
}

num sum(var iter) {
  num result = 0;
  for (var ele in iter) {
    result += ele;
  }
  return result;
}

void setIntersectAdd(var a, var b) {
  var intersect_set = a.intersection(b);
  print('The intersection of $a and $b is: $intersect_set');
  print('The sum of $intersect_set is ${sum(intersect_set)}');
}
