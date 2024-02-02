import Foundation

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = nums.count - 1
        
        while i >= 0{
            var num = nums[i]
            if num == val{
                nums.remove(at: i)
            }
            i -= 1
        }
        
        return nums.count
    }
}

class Solution2 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}

var array = [1,1,2,4,2,4,12,3,2,2,1]

var ins = Solution()
print(ins.removeElement(&array, 2))
print(array)

let start = Date()
let end = Date()
let timeInterval = end.timeIntervalSince(start)
print("Kodun çalışma süresi: \(timeInterval) saniye.")

print("-----------------------------------------------------------------")


var ins2 = Solution2()
print(ins2.removeElement(&array, 2))
print(array)

let start2 = Date()
let end2 = Date()
let timeInterval2 = end2.timeIntervalSince(start2)
print("Kodun çalışma süresi: \(timeInterval2) saniye.")
