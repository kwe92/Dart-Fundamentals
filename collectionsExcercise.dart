void main() {
  var myList = [1, 3, 5, 7, 9];
  print(sum(myList));
}

num sum(var iter) {
  num result = 0;
  for (var ele in iter) {
    result += ele;
  }
  return result;
}
