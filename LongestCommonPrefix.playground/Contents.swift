class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        
        var longest = Array(strs[0])
        
        for str in strs.dropFirst() {
            let strArray = Array(str)
            var temp = [Character]()
            
            for i in 0..<min(longest.count, strArray.count) {
                if longest[i] == strArray[i] {
                    temp.append(longest[i])
                } else {
                    break
                }
            }
            
            longest = temp
            
            if longest.isEmpty {return ""}
        }
        return String(longest)
    }
}

var ins = Solution()

let strs1 = ["flower", "flow", "flight"]
let strs2 = ["dog", "racecar", "car"]
let strs3 = ["apple", "apple", "apple"]
let strs4 = ["single"]
let strs5 = ["", "presence", "present"]

ins.longestCommonPrefix(strs1)
ins.longestCommonPrefix(strs2)
ins.longestCommonPrefix(strs3)
ins.longestCommonPrefix(strs4)
ins.longestCommonPrefix(strs5)

