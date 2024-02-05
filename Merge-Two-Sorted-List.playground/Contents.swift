
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
      
      public init?(_ array: [Int]) {
          guard !array.isEmpty else {return nil}
          self.val = array[0]
          var prev : ListNode = self
          for i in 1..<array.count {
              let new = ListNode(array[i])
              prev.next = new
              prev = new
          }
      }
      
  }
 
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var array1 = getListNode(list1)
        var array2 = getListNode(list2)
        var mergedArray = [Int]()
        var mergedListNode = ListNode()
        mergedArray = array1 + array2
        mergedArray.sort {$0 < $1}
        mergedListNode = setListNode(mergedArray)!
        
        return mergedListNode
    }

    func getListNode(_ head: ListNode?) -> [Int]{
        var result = [Int]()
        var node = head
        
        while let currentNode = node{
            result.append(currentNode.val)
            node = currentNode.next
        }
        
        return result
    }
    
    func setListNode(_ array: [Int]?) -> ListNode? {
        guard let array = array, !array.isEmpty else { return nil }

        let head = ListNode(array[0])
        var current = head

        for value in array.dropFirst() {
            let newNode = ListNode(value)
            current.next = newNode
            current = newNode
        }

        return head
    }
}

class Solution2 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

        let head = ListNode(0)
        var current = head
        var l1 = list1
        var l2 = list2
        
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                current.next = l1
                l1 = l1?.next
            } else {
                current.next = l2
                l2 = l2?.next
            }
            current = current.next!
        }
        
        if l1 != nil {
            current.next = l1
        } else if l2 != nil {
            current.next = l2
        }
        
        return head.next
    }
}

class Solution3 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // İki listeyi birleştir
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }

        var l1 = list1, l2 = list2
        let head = ListNode(0)
        var current = head

        // İki listeyi birleştir
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                current.next = l1
                l1 = l1?.next
            } else {
                current.next = l2
                l2 = l2?.next
            }
            current = current.next!
        }
        current.next = l1 ?? l2

        // Birleştirilmiş listeyi sırala
        return mergeSort(head.next)
    }

    func mergeSort(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        // Listeyi ikiye böl
        let middle = getMiddle(head)
        let nextOfMiddle = middle?.next
        middle?.next = nil

        // Her iki yarıyı ayrı ayrı sırala
        let left = mergeSort(head)
        let right = mergeSort(nextOfMiddle)

        // Sıralı yarıları birleştir
        return sortedMerge(left, right)
    }

    func getMiddle(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        var slow = head
        var fast = head

        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }

    func sortedMerge(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var result: ListNode?

        if a == nil {
            return b
        } else if b == nil {
            return a
        }

        if a!.val <= b!.val {
            result = a
            result?.next = sortedMerge(a?.next, b)
        } else {
            result = b
            result?.next = sortedMerge(a, b?.next)
        }

        return result
    }
}

let list1Node1 = ListNode(1)
let list1Node2 = ListNode(2)
let list1Node3 = ListNode(4)
let list1Node4 = ListNode(1)
list1Node1.next = list1Node2
list1Node2.next = list1Node3
list1Node3.next = list1Node4

let list2Node1 = ListNode(1)
let list2Node2 = ListNode(5)
let list2Node3 = ListNode(0)
list2Node1.next = list2Node2
list2Node2.next = list2Node3

private typealias LN = ListNode
let list3Node1 = LN([1,2,2,4,5,2,1])
let list3Node2 = LN([1,2,4,3,3,4,5,6,1,2])

/* let solution2 = Solution2()
if let mergedList = solution2.mergeTwoLists(list1Node1, list2Node1) {
    var currentNode: ListNode? = mergedList
    while currentNode != nil {
        print(currentNode!.val)
        currentNode = currentNode!.next
    }
} else {
    print("Listeler birleştirilemedi.")
}

print("----------------------------------------") */

let solution3 = Solution()
if let mergedList = solution3.mergeTwoLists(list3Node1, list3Node2) {
    var currentNode: ListNode? = mergedList
    while currentNode != nil {
        print(currentNode!.val)
        currentNode = currentNode!.next
    }
} else {
    print("Listeler birleştirilemedi.")
}

