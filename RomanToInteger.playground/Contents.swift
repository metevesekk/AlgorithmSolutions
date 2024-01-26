class RomanToInteger {
    /*
     Symbol       Value
     I             1
     V             5
     X             10
     L             50
     C             100
     D             500
     M             1000
     */
    
    func romanToInt(_ s: String) -> Int? {
        let uppercasedString = s.uppercased()
        let stringArray = Array(uppercasedString)
        var total = 0
        let dict = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

        for i in 0..<stringArray.count {
            guard let currentValue = dict[String(stringArray[i])] else {
                return nil
            }
            
            if i + 1 < stringArray.count {
                guard let nextValue = dict[String(stringArray[i + 1])] else {
                    return nil
                }
                if currentValue < nextValue {
                    total -= currentValue
                } else {
                    total += currentValue
                }
            } else {
                total += currentValue
            }
        }
        return total
    }
}

var ins = RomanToInteger()

if let result = ins.romanToInt("MMCVX") {
    print("Ondalik Sistemdeki Karşılığı: \(result)")
} else {
    print("Girdiğiniz değer geçersiz veya bir hata oluştu.")
}

