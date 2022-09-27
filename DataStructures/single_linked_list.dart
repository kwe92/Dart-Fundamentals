// cls node
// data
// next

// cls linkedlst
// head

// method append
// new node
// cur node
// while the current node pointer (next) is not null reasign the curent node to the next node
// when the curent node pointer is null assign the new node to the null pointer

//TODO: add methods: display, get and erase

import 'dart:math';

class Node {
  Node([this.data = null]);
  int? data;
  Node? next;
}

class SingleLinkedList {
  SingleLinkedList({required this.head});
  Node head;

  void append(int data) {
    Node? cur = head;
    Node newNode = Node(data);
    while (cur?.next != null) {
      cur = cur!.next;
    }
    cur?.next = newNode;
  }

  int length() {
    int total = 0;
    Node? cur = head;
    while (cur?.next != null) {
      cur = cur!.next;
      total += 1;
    }
    return total;
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
  SingleLinkedList linkedList = randIntSingleLinkedList(size: 10);

  print(linkedList.length());
  return 0;
}
