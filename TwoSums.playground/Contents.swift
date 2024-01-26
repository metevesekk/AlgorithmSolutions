import UIKit

func twoSums(_ nums: [Int], _ target: Int ) -> [Int] {
    var dict = [Int : Int]()

    for (i, num) in nums.enumerated(){
        if let complementIndex = dict[target - num]{
            return[complementIndex,i]
        }
        dict[num] = i
    }
    
    fatalError("No Two Sums Solution")
}
