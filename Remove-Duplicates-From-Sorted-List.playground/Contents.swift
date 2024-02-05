
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    public init?(_ array: [Int]) {
        guard !array.isEmpty else {return nil}
        self.val = array[0]
        var current : ListNode = self
        for i in 1..<array.count {
            let new = ListNode(array[i])
            current.next = new
            current = new
        }
    }
}
 
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var current = head
        while let nextNode = current.next {
            if current.val == nextNode.val {
                current.next = nextNode.next
            } else {
                current = nextNode
            }
        }
        
        return head
    }
}


private typealias LN = ListNode
let list1Node1 = LN([1,2,2,3,3,3,4,5,5,5,5,5,6])
let list2Node2 = LN([1,2,4,3,3,4,5,6,1,2])

let solution = Solution()
if let deleteDup = solution.deleteDuplicates(list1Node1){
    var currentNode: ListNode? = deleteDup
    while currentNode != nil {
        print(currentNode!.val)
        currentNode = currentNode!.next
    }
} else {
    print("Listeler birleştirilemedi.")
}
