import UIKit

var str = "Hello, playground"


/*
 String Permutation
 */


func swap(a:String, i:Int, j:Int) -> String{
    var characters = Array(a).map{ String.init($0)}
    var temp:String!
    
    temp = characters[i]
    characters[i] = characters[j]
    characters[j] = temp
    
    let finalStr = characters.reduce("", +)
    return finalStr
    
}
func permute(str:String, l:Int, r:Int){
    
    var s = str
    
    if(l == r){
        debugPrint(str)
    }else {
        
        for i in l...r{
            s = swap(a: s, i: l, j: i)
            permute(str: s, l: l+1, r: r)
            s = swap(a: s, i: l, j: i)
        }
    }
}

permute(str: "ABC", l: 0, r: 2)


