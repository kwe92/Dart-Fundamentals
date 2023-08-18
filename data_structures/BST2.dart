// Binary Search Trees

import 'dart:math';

class Node {
  Node([this.val, this.left, this.right]);
  int? val;
  Node? left;
  Node? right;
}

class BST {
  BST([this.root]);
  Node? root;

  Node? insert([int? val, Node? root]) {
    if (this.root == null) {
      return Node(val);
    }
    if (val == root!.val) {
      return null;
    }
    if (val! < this.root!.val!.toInt()) {
      Node? node = insert(val, root.left);
      root.left = node;
    }
    if (val < this.root!.val!.toInt()) {
      Node? node = insert(val, root.right);
      root.right = node;
    }
    return null;
  }

  int? toSearch([int? val, Node? node]) {
    if (root?.val != null) {
      if (val == root?.val) {
        return root!.val;
      } else {
        int? foundNode = toSearch(val, root?.left);
        if (foundNode == null) {
          foundNode = toSearch(val, root?.right);
        }
        return foundNode;
      }
    } else {
      return null;
    }
  }
}

// int? toSearch(int val, BST? bst) {
//   if (bst?.root?.val != null) {
//     if (val == bst?.root?.val) {
//       return bst!.root!.val;
//     } else {
//       int? foundNode = toSearch(val, bst.left);
//       if (foundNode == null) {
//         foundNode = toSearch(key, bst.right);
//       }
//       return foundNode;
//     }
//   } else {
//     return null;
//   }
// }

// void preOrderPrint(BST? bst) {
//   if (bst == null) {
//     return;
//   }
//   print(bst.key);
//   preOrderPrint(bst.left);
//   preOrderPrint(bst.right);
// }

// void inOrderPrint(BST? bst) {
//   if (bst == null) {
//     return;
//   }
//   inOrderPrint(bst.left);
//   print(bst.key);
//   inOrderPrint(bst.right);
// }

// void postOrderPrint(BST? bst) {
//   if (bst == null) {
//     return;
//   }
//   preOrderPrint(bst.left);
//   preOrderPrint(bst.right);
//   print(bst.key);
// }

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
    final arr = randIntList(length: 1000, range: 20);
    arr.forEach((key) => bst.insert(key));
    //   lines();
    //   print("Pre-order Traversal");
    //   lines();
    //   // preOrderPrint(bst);
    //   lines();
    //   print("In-order Traversal");
    //   lines();
    //   //inOrderPrint(bst);
    //   lines();
    //   print("Post-order Traversal");
    //   lines();
    //   //postOrderPrint(bst);
    //   lines();
    //   arr.add(404);
    //   print(arr);
    //   lines();
    print(bst.root?.left?.val);
    //   arr.forEach((key) => print("Element $key in BST: ${bst.toSearch(key)}"));

  } catch (e) {
    print(e);
  }
  return 0;
}
