import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var uniqueSet = Set<Int>()
        var i = nums.count - 1
        while i >= 0{
            let num = nums[i]
            if uniqueSet.contains(num){
                nums.remove(at: i)
            } else {
                uniqueSet.insert(num)
            }
            i -= 1
        }
        
        return uniqueSet.count
    }
}

class Solution2 {
    func removeDuplicate(_ nums: inout [Int]) -> Int {
        nums = Array(Set(nums))
        nums.sort()
        return nums.count
    }
}




var solution = Solution()
var array = [1,1,2,3,4,4,4,4,5,5,5,6,8,9]
solution.removeDuplicates(&array)
print(array)

let start = Date()
let end = Date()
let timeInterval = end.timeIntervalSince(start)
print("Kodun çalışma süresi: \(timeInterval) saniye.")

var solution2 = Solution2()
solution.removeDuplicates(&array)
print(array)

let start2 = Date()
let end2 = Date()
let timeInterval2 = end2.timeIntervalSince(start2)
print("Kodun çalışma süresi: \(timeInterval2) saniye.")
