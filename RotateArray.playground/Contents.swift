import UIKit
import Foundation

func rotateArray(_ nums: inout [Int],  k: Int) {
    let count = nums.count
    let rotate = k % count  // Rotasyonu dizi boyutuna göre modüler yapmak
    reverse(&nums, start: 0, end: count - 1)
    reverse(&nums, start: 0, end: rotate - 1)
    reverse(&nums, start: rotate, end: count - 1)
    
}

func reverse(_ nums: inout [Int], start: Int, end: Int) {
    var start = start
    var end = end
    while start < end {
        nums.swapAt(start, end)
        start += 1
        end -= 1
    }
}





    
