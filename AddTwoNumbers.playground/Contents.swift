
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      let dummyHead = ListNode(0)
  var p = l1, q = l2, current = dummyHead
  var carry = 0
  
  while p != nil || q != nil {
      let x = p?.val ?? 0
      let y = q?.val ?? 0
      let sum = carry + x + y
      carry = sum / 10
      current.next = ListNode(sum % 10)
      current = current.next!
      if p != nil { p = p!.next }
      if q != nil { q = q!.next }
  }
  
  if carry > 0 {
      current.next = ListNode(carry)
  }
  
  return dummyHead.next
  }
}

let l1 = ListNode(9)
l1.next = ListNode(0)
l1.next?.next = ListNode(8)

let l2 = ListNode(0)
l2.next = ListNode(7)
l2.next?.next = ListNode(6)

let result = Solution()
 func printList(_ head: ListNode?) {
    var node = head
    while let currentNode = node {
        print(currentNode.val)
        node = currentNode.next
    }
}

if let result = result.addTwoNumbers(l1, l2) {
    printList(result)
}
