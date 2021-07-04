import UIKit



class Node<T>{
    var value:T
    var next:Node?
    
    init(_ value:T) {
        self.value = value
    }
}

class LinkedList<T>{
    var head:Node<T>?
    
    init(_ head:Node<T>) {
        self.head = head
    }
    
    func addNode(node:Node<T>){
        guard head != nil else {
            self.head = node
            return
        }
        
        var localHead = head
        
        while localHead?.next != nil {
            localHead = localHead?.next
        }
        localHead?.next = node
    }
    
    func printLinkedList(){
        
        var localHead = head
        
        while localHead != nil {
            debugPrint(localHead?.value ?? -1)
            localHead = localHead?.next
        }
    }
    func middleNodeMethod1(){
        //This will fail for even List count
        var localHead = head
        var mid = head
        var count = 0
        
        while localHead != nil {
            if count % 2 != 0{
                mid = localHead
            }
            count = count + 1
            localHead = localHead?.next
        }
        
        debugPrint(mid?.value ?? -1)
    }
    
    func middleNodeMethod2(){
        var slow:Node? = head
        var fast:Node? = head
        
        while slow != nil && fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        debugPrint(slow?.value ?? -1)
        
    }
    
    
    
}

var node1 = Node(1)

var list = LinkedList(node1)
var node2 = Node(2)
var node3 = Node(3)
var node4 = Node(4)

list.addNode(node: node2)
list.addNode(node: node3)
//list.addNode(node: node4)
//list.printLinkedList()
list.middleNodeMethod2()
