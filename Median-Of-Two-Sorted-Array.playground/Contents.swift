

 /*class QuickSort {
    func sortingArray(_ nums: [Int]) -> [Int]{
        var array = nums
        var pivot = array.last ?? 0
        var slowPointer = 0
        var fastPointer = 0
        for num in nums{
            if pivot >= num {
                slowPointer += 1
                if slowPointer != fastPointer{
                    array.swapAt(slowPointer, fastPointer)
                }
            }
            fastPointer += 1
        }
        fastPointer = 0
        slowPointer = 0
        return sortingArray(array)
    }
} */


/* class QuickSort {
    func quickSort(_ array: inout [Int], low: Int, high: Int) {
        if low < high {
            let pivot = partition(&array, low: low, high: high)
            quickSort(&array, low: low, high: pivot - 1)
            quickSort(&array, low: pivot + 1, high: high)
        }
    }

    private func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
        let pivot = array[high]
        var i = low

        for j in low..<high {
            if array[j] <= pivot {
                array.swapAt(i, j)
                i += 1
            }
        }

        array.swapAt(i, high)
        return i
    }

    func sortingArray(_ nums: [Int]) -> [Int] {
        var array = nums
        quickSort(&array, low: 0, high: array.count - 1)
        return array
    }
}


let sorter = QuickSort()
let sortedArray = sorter.sortingArray([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5])
print(sortedArray) */


 func quickSort(_ array: inout [Int]) -> [Int] {
    // Eğer dizi boş veya bir eleman içeriyorsa sıralama gerekmez.
    guard array.count > 1 else { return array }


    let pivot = array[array.count/2]

    var less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    var greater = array.filter { $0 > pivot }


    return quickSort(&less) + equal + quickSort(&greater)
}

var arrayToSort = [3, 6, 8, 10, 1, 2, 16, -73, 7, 65, 126, 54, 9, -1]
let sortedArray = quickSort(&arrayToSort)
print(sortedArray)

