import UIKit

var str = "Hello, playground"


class TreeNode<T>{
    
    var value:T
    var children: [TreeNode] = []
    
    
    init(_ value:T) {
        self.value = value
    }
    func add(_ node:TreeNode){
        self.children.append(node)
    }
}

extension TreeNode{
    public func showDepthFirst(visit: (TreeNode) -> Void){
        visit(self)
        children.forEach { (node) in
            node.showDepthFirst(visit: visit)
        }
    }
    
}



func addTree() -> TreeNode<String>{
    let tree = TreeNode("Beverages")
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    
    tree.add(hot)
    tree.add(cold)
    
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    
    cold.add(soda)
    cold.add(milk)
    
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    
    soda.add(gingerAle)
    soda.add(bitterLemon)
    return tree
    
}




func printTree(){
    
    let parent =  addTree()
    parent.showDepthFirst { (node) in
        print(node.value)
    }
        
}
printTree()




    




