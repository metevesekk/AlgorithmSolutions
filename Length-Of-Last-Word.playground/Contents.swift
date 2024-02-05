import Foundation

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var lengthOfLast = 0
        
        for character in s.reversed() {
            if character != " " {
                lengthOfLast += 1
            } else if lengthOfLast > 0 {
                break
            }
        }

        return lengthOfLast
    }
}

class Solution2 {
    func lengthOfLastWord(_ s: String) -> Int {
        var lengthOfLast = 0
        var isLastWord = false
        
        var lastIndex = s.endIndex
        var startIndex = s.startIndex
        
        while lastIndex > startIndex {
            lastIndex = s.index(before: lastIndex)
            let character = s[lastIndex]
            
           
            if character != " " {
                isLastWord = true
                lengthOfLast += 1
            } else if isLastWord {
                break
            }
        }

        return lengthOfLast
    }
}

var start = Date()
var end = Date()
var timeInterval = end.timeIntervalSince(start)

print("performans süresi: \(timeInterval)")
var ins = Solution()
ins.lengthOfLastWord("luffy is joyboy")


var start2 = Date()
var end2 = Date()
var timeInterval2 = end2.timeIntervalSince(start2)

print("performans süresi: \(timeInterval2)")
var ins2 = Solution2()
ins.lengthOfLastWord("luffy is joyboy")
