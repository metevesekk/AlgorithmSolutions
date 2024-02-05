class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var rangedNums1 = [Int]()
        var rangedNums2 = [Int]()
        
        if m > 0 {
            for i in 0..<m {
                rangedNums1.append(nums1[i])
            }
        } else {
            rangedNums1 = []
        }
        
        if n > 0 {
            for i in 0..<n{
                rangedNums2.append(nums2[i])
            }
        } else {
            rangedNums2 = []
        }
        nums1 = rangedNums1 + rangedNums2
        nums1 = nums1.sorted()
        print(nums1)
    }
}

class Solution2 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var lastA = m - 1
        var lastB = n - 1
        var curr = m + n - 1

        while lastA >= 0 && lastB >= 0 {
            if nums1[lastA] > nums2[lastB] {
                nums1[curr] = nums1[lastA]
                lastA -= 1
            } else {
                nums1[curr] = nums2[lastB]
                lastB -= 1
            }
            curr -= 1
        }
        
        while lastB >= 0 {
            nums1[curr] = nums2[lastB]
            lastB -= 1
            curr -= 1
        }
        var i = nums1.count - 1
        while i > m + n - 1{
            nums1.remove(at: i)
            i -= 1
        }
        print(nums1)
    }
}



var ins = Solution2()
var array1 =  [1,2,3,0,0,0,0,0,0,0,0]
var array2 = [4,5,6]

ins.merge(&array1, 3, array2, 3)
