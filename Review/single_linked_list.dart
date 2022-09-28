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

import 'dart:math';

class Node {
  Node({this.data});
  int? data;
  Node? next;
}

class LinkedList {
  LinkedList({required this.head});
  Node? head;
  int get length {
    int len = 0;
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
      len++;
    }
    return len;
  }

  void append(int val) {
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
    }
    curr_node?.next = Node(data: val);
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

  List<int?> toList() {
    List<int?> result = [];
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
      result.add(curr_node!.data);
    }
    return (result);
  }

  void erase({required int index}) {
    if (index >= length) {
      print('Index is out of range');
      return;
    }
    int curr_index = 0;
    Node? curr_node = this.head;
    Node? last_node;
    while (true) {
      last_node = curr_node;
      curr_node = curr_node?.next;
      if (curr_index == index) {
        last_node!.next = curr_node!.next;
        return;
      }
      curr_index++;
    }
  }

  int? elementAt({required int index}) {
    if (index >= length) {
      print('Index is out of range');
      return null;
    }
    int curr_index = 0;
    Node? curr_node = this.head;
    while (true) {
      curr_node = curr_node?.next;
      if (curr_index == index) {
        return curr_node!.data;
      }
      curr_index++;
    }
  }
}

LinkedList randIntLinkedList({required int length, int range = 5}) {
  int i = 0;
  Random rand = Random();
  LinkedList ll = LinkedList(head: Node());
  while (i < length) {
    ll.append(
      rand.nextInt(range),
    );
    i++;
  }
  return ll;
}

int main() {
  int randIndex = Random().nextInt(4);
  LinkedList linkedList = randIntLinkedList(length: 5, range: 10);
  print(linkedList.length);
  print(
      'Element at index: $randIndex is: ${linkedList.elementAt(index: randIndex)}');
  linkedList.display();
  linkedList.erase(index: randIndex);
  linkedList.display();
  print(linkedList.length);

  return 0;
}
