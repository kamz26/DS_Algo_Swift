import UIKit

/*
 1. https://leetcode.com/problems/two-sum/submissions/
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var pairIndexOne:Int = Int.min
        var pairIndexTwo:Int = Int.min
        
        var frequencyDict:[Int:Int] = [:]
        
        for i in 0..<nums.count{
            if let numberToFind = frequencyDict[target - nums[i]]{
                pairIndexOne = numberToFind
                pairIndexTwo = i
                
            }else{
                frequencyDict[nums[i]] = i
            }
        }
        
        return [pairIndexOne,pairIndexTwo]
    }
}
//Sample Test
Solution().twoSum([2,7,11,15], 9)
Solution().twoSum([3,2,4], 6)



/*
 2. https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 */

class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
       var maxProfit:Int = 0
       var minPrice: Int = Int.max
        
        for i in 0..<prices.count{
            minPrice = min(prices[i],minPrice)
            maxProfit = max(prices[i] - minPrice,maxProfit)
        }
        return maxProfit
    }
}

//Sample Test
Solution2().maxProfit([7,1,5,3,6,4])
Solution2().maxProfit([7,6,4,3,1])

/*
 3. https://leetcode.com/problems/merge-sorted-array/submissions/
 */

class Solution3 {
    
    func removeAllZeros(_ nums1: inout [Int], _ count: Int){
        while(nums1.last == 0 && count < nums1.count ){
            nums1.removeLast()
        }
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        removeAllZeros(&nums1, m)
        var mergeArr:[Int] = []
        var num2 = nums2
        removeAllZeros(&num2, n)
        
      while(!nums1.isEmpty && !num2.isEmpty){
            
            if (nums1.first ?? -1 <= num2.first ?? -1 ){
                mergeArr.append(nums1.removeFirst())
            }else{
               mergeArr.append(num2.removeFirst())
            }
        }
        
        if !nums1.isEmpty{
          mergeArr += nums1
        }
        if !num2.isEmpty{
            mergeArr += num2
        }
        nums1 = mergeArr
    }
}
//Sample Test
var input = [1,2,3,0,0,0]
Solution3().merge(&input, 3, [2,5,6], 3)

var input2 = [1]
Solution3().merge(&input2, 1, [], 0)

/*
 https://leetcode.com/problems/move-zeroes/
 */

class Solution4 {
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        for i in 0..<nums.count{
            if nums[i] != 0{
                nums[j] = nums[i]
                j = j+1
            }
        }
       for k in j..<nums.count{
           nums[k] = 0
       }
    }
}

//Sample Test
var input3 = [0,1,0,3,12]
Solution4().moveZeroes(&input3)
