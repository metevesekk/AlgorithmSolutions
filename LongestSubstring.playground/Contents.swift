 /* class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var storage = [Int]()
        var count = Int()
        var subArray = [Character]()
        var arrayString = s.map{ $0 }
        for element in s {
            while !subArray.contains(element){
                subArray.append(element)
                count += 1
                if subArray.contains(element){
                    storage.append(count)
                    count = 0
                    subArray = []
                }
            }
        }
        return storage.max() ?? 0
        }
    } */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var characterSet = Set<Character>() // Tekrarlanmayan karakterleri tutmak için Set kullanılıyor.
        var maxLength = 0
        var i = 0
        var j = 0
        let characters = Array(s) // String'i karakterler dizisine dönüştürüyoruz.

        while j < characters.count {
            if !characterSet.contains(characters[j]) {
                characterSet.insert(characters[j])
                j += 1
                maxLength = max(maxLength, j - i)
            } else {
                characterSet.remove(characters[i])
                i += 1
            }
        }

        return maxLength
    }
}

class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var storage = [Int]()
        var subArray = [Character]() // Tekrarlanmayan karakterleri tutmak için
        var count = 0
        
        for element in s {
            while subArray.contains(element) {
                subArray.removeFirst() // Eğer element zaten varsa, subArray'in başından silerek devam et
                count -= 1
            }
            subArray.append(element)
            count += 1
            storage.append(count) // Her adımda count'u storage'a ekle
        }
        
        return storage.max() ?? 0 // En yüksek count değerini dön
    }
}


let solution = Solution()
let length = solution.lengthOfLongestSubstring("Merhabalar")
print(length) // 'Merhaba' için 6 olmalı


let solution2 = Solution2()
let length2 = solution2.lengthOfLongestSubstring("Merhabalar")
print(length2)

