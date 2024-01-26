import UIKit


func ilkTekrarEtmeyenElemaniBul(dizi: [Int]) -> Int? {
    var gorulenElemanlar = Set<Int>()
    var tekrarEtmeyenElemanlar = [Int]()
    
    for eleman in dizi {
        if gorulenElemanlar.contains(eleman) {
           
            if let index = tekrarEtmeyenElemanlar.firstIndex(of: eleman) {
                tekrarEtmeyenElemanlar.remove(at: index)
            }
        } else {
            gorulenElemanlar.insert(eleman)
            tekrarEtmeyenElemanlar.append(eleman)
        }
    }
    
    return tekrarEtmeyenElemanlar.first
}

var rastgeleDizi = [1, 2, 4, 1, 5, 5]
if let ilkTekrarEtmeyen = ilkTekrarEtmeyenElemaniBul(dizi: rastgeleDizi) {
} else {
    print("Tekrar etmeyen eleman yok")
}



