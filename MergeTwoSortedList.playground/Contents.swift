
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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

let list1Node1 = ListNode(1)
let list1Node2 = ListNode(2)
let list1Node3 = ListNode(4)
list1Node1.next = list1Node2
list1Node2.next = list1Node3

let list2Node1 = ListNode(1)
let list2Node2 = ListNode(5)
let list2Node3 = ListNode(0)
list2Node1.next = list2Node2
list2Node2.next = list2Node3

let solution = Solution()
if let mergedList = solution.mergeTwoLists(list1Node1, list2Node1) {
    var currentNode: ListNode? = mergedList
    while currentNode != nil {
        print(currentNode!.val)
        currentNode = currentNode!.next
    }
} else {
    print("Listeler birleştirilemedi.")
}

