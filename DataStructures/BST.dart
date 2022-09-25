// Binary Search Trees

import 'dart:math';

class BST {
  BST([this.key, this.left, this.right]);
  int? key;
  BST? left;
  BST? right;

  void insert(int key) {
    if (this.key == null) {
      this.key = key;
    }
    if (key == this.key) {
      return;
    }
    if (key < this.key!.toInt()) {
      if (this.left == null) {
        this.left = BST(key);
      } else {
        this.left!.insert(key);
      }
    }
    if (key > this.key!.toInt()) {
      if (this.right == null) {
        this.right = BST(key);
      } else {
        this.right!.insert(key);
      }
    }
  }

  int? toSearch(int key) {
    if (key == this.key) {
      return this.key;
    }
    if (key < this.key!.toInt()) {
      if (this.left == null) {
        this.key;
      } else {
        return this.left!.toSearch(key);
      }
    }
    if (key > this.key!.toInt()) {
      if (this.right == null) {
        this.key;
      } else {
        return this.right!.toSearch(key);
      }
    }
  }
}

List<int> randIntList({required int length, int range = 10}) {
  Random rand = Random();
  List<int> result = [for (var i = 0; i < length; i++) rand.nextInt(range)];
  return result;
}

int main() {
  final arr = randIntList(length: 10);
  final BST bst = BST();
  for (var element in arr) {
    bst.insert(element);
  }

  // Ensure return -1 works
  arr.add(25);
  print(arr);
  for (int element in arr) {
    print("Element $element in BST: ${bst.toSearch(element)}");
  }
  return 0;
}
