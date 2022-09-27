// cls node
// data
// next

// cls linkedlst
// head

// method append
// new node
// curr_node node
// while the curr_noderent node pointer (next) is not null reasign the curr_nodeent node to the next node
// when the curr_nodeent node pointer is null assign the new node to the null pointer
// get length computed variable

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
    Node newNode = Node(data);
    while (curr_node?.next != null) {
      curr_node = curr_node!.next;
    }
    curr_node?.next = newNode;
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
  SingleLinkedList linkedList = randIntSingleLinkedList(size: 76, range: 25);

  print("Single Linked List Length: ${linkedList.length}");
  linkedList.display();
  return 0;
}
