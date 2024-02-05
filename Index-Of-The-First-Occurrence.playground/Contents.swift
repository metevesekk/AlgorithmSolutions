import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let needleLength = needle.count
        if needleLength == 0 { return 0 }
        
        let haystackChars = Array(haystack)
        var temp = [Character]()
        
        for i in 0..<haystackChars.count {
            temp.append(haystackChars[i])
            if temp.count > needleLength {
                temp.removeFirst()
            }
            if temp.count == needleLength && needle == String(temp) {
                return i - needleLength + 1
            }
        }
        
        return -1
    }
}


class Solution2 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        let haystackChars = Array(haystack)
        let needleChars = Array(needle)

        for i in 0...(haystackChars.count - needleChars.count) {
            var j = 0
            while j < needleChars.count && haystackChars[i + j] == needleChars[j] {
                j += 1
            }
            if j == needleChars.count {
                return i
            }
        }
        return -1
    }
}

class Solution3 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard let range = haystack.range(of: needle) else { return -1 }
        return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
    }
}



//* * * * İ L E R İ   S E V İ Y E   K O D * * * * 

extension Collection where Element: Equatable {
    /// Returns the first index where the specified value appears in the collection
    /// - Parameter other: Another collection to search for in the receiving collection
    /// - Returns: The start index where an equal subsequence is found. If the an equal subsequence is not found in the collection, returns `nil`.
    /// - Complexity: O(*n* * *m*) where *n* is the number of elements in the receiving collection and *m* is the number of elements in `other`
    public func firstIndex<C: Collection>(of other: C) -> Index? where C.Element == Element {
        guard !other.isEmpty else {
            return self.startIndex
        }
        
        return self.indices.dropLast(other.count - 1).first(where: {
            zip(self[$0...], other).allSatisfy(==)
        })
    }
}

extension Collection {
    /// Returns the distance from the start index to the given index
    /// - Parameter index: A valid index of the collection. If `index` is equal to the start index, the result is zero.
    /// - Returns: The distance between `startIndex` and `index`
    @inlinable
    public func distanceFromStartIndex(to index: Index) -> Int {
        return self.distance(from: self.startIndex, to: index)
    }
}

class Solution4 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard let index = haystack.firstIndex(of: needle) else {
            return -1
        }
        
        return haystack.distanceFromStartIndex(to: index)
    }
}

//* * * * İ L E R İ   S E V İ Y E   K O D * * * * 

var ins = Solution()
ins.strStr("ahhjhsad", "sad")

var start = Date()
var end = Date()
var timeInterval = end.timeIntervalSince(start)
print("Solution Kodunuzun tamamlanma süresi \(timeInterval)")


var ins2 = Solution2()
ins2.strStr("ahhjhsad", "sad")

var start2 = Date()
var end2 = Date()
var timeInterval2 = end2.timeIntervalSince(start2)
print("Solutions2 Kodunuzun tamamlanma süresi \(timeInterval2)")

var ins3 = Solution3()
ins3.strStr("ahhjhsad", "sad")

var start3 = Date()
var end3 = Date()
var timeInterval3 = end3.timeIntervalSince(start3)
print("Solutions2 Kodunuzun tamamlanma süresi \(timeInterval3)") 

var ins4 = Solution4()
ins4.strStr("ahhjhsad", "sad")

var start4 = Date()
var end4 = Date()
var timeInterval4 = end4.timeIntervalSince(start4)
print("Solutions2 Kodunuzun tamamlanma süresi \(timeInterval4)")
