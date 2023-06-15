// ignore_for_file: unused_local_variable, unused_import

import 'dart:io';
import 'dart:math';

class Node {
  Node([this.data]);
  int? data;
  Node? next;
}

class LinkedList {
  LinkedList({required this.head});
  Node? head;
  int? get length {
    int len = 0;
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node?.next;
      len++;
    }
    return len;
  }

  void append({required int val}) {
    Node? curr_node = this.head;
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
    }
    curr_node?.next = Node(val);
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

  void erase(int index) {
    if (index >= length!.toInt()) {
      return;
    }
    Node? curr_node = this.head;
    Node? last_node;
    int curr_index = 0;
    while (true) {
      last_node = curr_node;
      curr_node = curr_node?.next;
      if (index == curr_index) {
        last_node!.next = curr_node!.next;
        return;
      }
      curr_index++;
    }
  }
}

LinkedList randIntLinkedList({required int length, int range = 5}) {
  Random rand = Random();
  int counter = 0;
  LinkedList ll = LinkedList(head: Node());
  while (counter < length) {
    ll.append(val: rand.nextInt(range));
    counter++;
  }
  return ll;
}

int main() {
  int randIndex = Random().nextInt(4);
  LinkedList linkedList = randIntLinkedList(length: 5);
  linkedList.display();
  linkedList.erase(randIndex);
  linkedList.display();
  return 0;
}
