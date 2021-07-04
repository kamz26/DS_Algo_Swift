import UIKit



class Node{
    var value:Int
    var next:Node?
    
    init(_ value:Int) {
        self.value = value
    }
}

class LinkedList{
    var head:Node?
    
    init(_ head:Node) {
        self.head = head
    }
    
    func addNode(node:Node){
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
    
    //MARK: - 1. Finding Middle Node using Method 1
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
    
    //MARK: - 2. Finding Middle Node using Method 2
    func middleNodeMethod2(){
        var slow:Node? = head
        var fast:Node? = head
        
        while slow != nil && fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        debugPrint(slow?.value ?? -1)
        
    }
    
    //MARK: - 3. Deleting Node using first method
    func deleteNode(node:Node){
        
        var temp:Node? = head
        var prev:Node?
        
        // If Head itself holds the to be deleted
        while temp != nil && temp?.value == node.value{
            head = temp?.next
            return
        }
        
        while temp != nil && temp?.value != node.value {
            prev = temp
            temp = temp?.next
        }
        
        if temp == nil{
            debugPrint("Element not found ")
            return
        }
        
        prev?.next = temp?.next
        
    }
    
    
    
}

var node1 = Node(1)

var list = LinkedList(node1)
var node2 = Node(2)
var node3 = Node(3)
var node4 = Node(4)

list.addNode(node: node2)
list.addNode(node: node3)
list.addNode(node: node4)
list.printLinkedList()
list.deleteNode(node: node3)
debugPrint("After Delete")
list.printLinkedList()
//list.middleNodeMethod2()
