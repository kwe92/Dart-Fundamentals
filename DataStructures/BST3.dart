// Binary Search Trees

import 'dart:math';

class Node {
  Node([this.val, this.left, this.right]);
  int? val;
  Node? left;
  Node? right;
}

class BST {
  BST([this.root, this.left, this.right]);
  Node? root;
  Node? left;
  Node? right;

  Node? insert([int? val, Node? node]) {
    if (this.root == null) {
      return Node(val);
    }
    if (val == this.root!.val) {
      return null;
    }
    if (val! < this.root!.val!.toInt()) {
      if (this.root!.left == null) {
        this.root!.left = Node(val);
      }
      insert(val, root?.left);
    }
    if (val < this.root!.val!.toInt()) {
      if (this.root!.right == null) {
        this.root!.right = Node(val);
      }
      insert(val, root?.right);
    }
    return null;
  }
}

List<int> randIntList({required int length, int range = 10}) {
  Random rand = Random();
  List<int> result = [for (var i = 0; i < length; i++) rand.nextInt(range)];
  return result;
}

void lines() {
  print("-------------------------------------------------");
}

int main() {
  try {
    final BST bst = BST();
    final arr = randIntList(length: 10, range: 20);
    arr.forEach((key) => bst.insert(key));
    lines();
    print("Pre-order Traversal");
    lines();
    //preOrderPrint(bst);
    lines();
    print("In-order Traversal");
    lines();
    //inOrderPrint(bst);
    lines();
    print("Post-order Traversal");
    lines();
    //postOrderPrint(bst);
    lines();
    arr.add(404);
    print(arr);
    lines();
    //arr.forEach((key) => print("Element $key in BST: ${toSearch(key, bst)}"));
    // lines();
    // print("BST hieght: ${bst.height(bst)}");
    print(bst.root?.val);
  } catch (e) {
    print(e);
  }
  return 0;
}
