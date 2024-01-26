import UIKit

 func tekrariDurdur(dizi: [Int]) -> Set<Int>{
    var uniqueDegerler = Set<Int>()
    for eleman in dizi {
        if !uniqueDegerler.contains(eleman){
            uniqueDegerler.insert(eleman)
        }
    }
    return uniqueDegerler
}


func tekrarEdenler(dizi: [Int]) -> Set<Int>{
    var tekrarEdenler = Set<Int>()
    var kontrolcu = Set<Int>()
    for eleman in dizi {
        if kontrolcu.contains(eleman){
            tekrarEdenler.insert(eleman)
        }else {
            kontrolcu.insert(eleman)
        }
    }
    return tekrarEdenler
}

var a = [1,1,2,3,4,4,1,5,55, 55,6,1]
print(tekrarEdenler(dizi: a))
print(tekrariDurdur(dizi: a))
