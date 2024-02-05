class IsPalindrom {
    func isPalindrome(_ x: Int) -> Bool {
        var stringNum = String(x)
        var array = stringNum.split(separator: "")
        var reversedArray = Array(array.reversed())
        if array == reversedArray {
            return true
        }
        return false
    }
}

var s = IsPalindrom()
print("Sayımızın palindromik değeri: \(s.isPalindrome(00200))")
