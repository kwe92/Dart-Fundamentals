// Pseudo Code: Node Class
// data
// next

// Pseudo Code: SingleLinkedList
// head

// method append
// new node
// curr_node node
// while the curr_noderent node pointer (next) is not null reasign the curr_nodeent node to the next node
// when the curr_nodeent node pointer is null assign the new node to the null pointer
// get length computed variable

// Pseudo Code: elementAt method

//  - takes an int index as an argument
//  - if the integer passed is greater than or equal to the length of our list
//    throw an OutOfIndexRange error and return null
//  - NOTE: the reason that the defensive check is greater than or equal to is because the head node
//          should not be indexed as it only contains a poniter to the first node with data and no data itself
//  - if the defensive if statement passes declare and initalize two variables:
//    curr_node = head.next && curr_index = 0
//  - while true (continue infinitly until a return condition is met)
//  - iterate through the linked list until the curr_index is equal to the index argument passed
//  - return the curr_node.data
//  - increase increment counter
// nl

//TODO: add methods: display, get and erase

import 'dart:math';

class OutOfRange implements Exception {
  OutOfRange([this.message]) : super();
  final String? message;

  @override
  String toString() {
    if (message == null) {
      return "OutOfRange";
    }
    return "OutOfRange: $message";
  }
}

class Node {
  Node([this.data = null]);
  int? data;
  Node? next;
}

class SingleLinkedList {
  SingleLinkedList({required this.head});
  Node head;
  int? get length {
    int total = 0;
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
      total += 1;
    }
    return total;
  }

  void append(int data) {
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
    }
    curr_node?.next = Node(data);
  }

  void display() {
    List<int?> result = [];
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
      result.add(curr_node!.data);
    }
    print(result);
  }

  int elementAt(int index) {
    if (index >= length!.toInt()) {
      throw OutOfRange(
          "The index passed: $index must be less than the length: $length");
    }
    Node? curr_node = this.head;
    int curr_index = 0;
    while (true) {
      curr_node = curr_node?.next;
      if (curr_index == index) return curr_node!.data!.toInt();
      curr_index++;
    }
  }

  void erase(int index) {
    if (index >= length!.toInt()) {
      throw OutOfRange(
          "The index passed: $index must be less than the length: $length");
    }
    Node? curr_node = this.head;
    Node? last_node;
    int curr_index = 0;
    while (true) {
      // last node == head node initally
      last_node = curr_node;
      // the current node is now the first node with data
      // TODO: Darw this out on paper | still slightly confused
      curr_node = curr_node?.next;
      if (curr_index == index) {
        last_node?.next = curr_node?.next;
        return;
      }
      curr_index++;
    }
  }
}

SingleLinkedList randIntSingleLinkedList({required int size, int range = 10}) {
  Random rand = Random();
  SingleLinkedList ll = SingleLinkedList(head: Node());
  int i = 0;
  while (i < size) {
    ll.append(rand.nextInt(range));
    i++;
  }
  return ll;
}

int main() {
  SingleLinkedList linkedList = randIntSingleLinkedList(size: 15, range: 10);
  int index = Random().nextInt(14);
  linkedList.display();
  print("Single Linked List Length: ${linkedList.length}");
  print("Erase at index: $index");
  linkedList.erase(index);
  print("Single Linked List Length after erase: ${linkedList.length}");
  try {
    print("Element at index: $index is value: ${linkedList.elementAt(index)}");
  } catch (error) {
    print(error);
  }
  return 0;
}
