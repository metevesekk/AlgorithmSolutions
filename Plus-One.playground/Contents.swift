import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var stringArray = digits.map { String($0) } // [Int] -> [String] dönüşümü
        let number = Int(stringArray.joined())! // Sayıyı oluştur
        let newNumber = number + 1 // Sayıyı arttır
        let newStringArray = String(newNumber).map { String($0) } // Yeni sayıyı [String]'e dönüştür
        let newIntArray = newStringArray.map { Int($0)! } // [String] -> [Int] dönüşümü
        return newIntArray
    }
}

class Solution2 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var temp = digits
        var lastIndex = digits.count - 1

        while lastIndex >= 0 {
            if temp[lastIndex] < 9 {
                // Eğer son eleman 9'dan küçükse, 1 ekleyip döngüden çıkabiliriz.
                temp[lastIndex] += 1
                return temp
            } else {
                // Eğer son eleman 9 ise, 0 yap ve bir önceki elemana geç (taşma).
                temp[lastIndex] = 0
                lastIndex -= 1
            }
        }

        // Tüm elemanlar 9 ise ve en başa ulaştıysak, en başa 1 ekleyip geri döndür.
        temp.insert(1, at: 0)
        return temp
    }
}

var start = Date()
var end = Date()
var timeInterval = end.timeIntervalSince(start)

var ins = Solution()
var printEt = ins.plusOne([1,3,4,8])
print(printEt)

print("performans süresi \(timeInterval)")
