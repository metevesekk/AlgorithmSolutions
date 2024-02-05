class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        return getLeafValues(root1) == getLeafValues(root2)
    }

    private func getLeafValues(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var node = root

        while node != nil || !stack.isEmpty {
            while let currentNode = node {
                stack.append(currentNode)
                node = currentNode.left
            }

            node = stack.removeLast()

            if node?.left == nil && node?.right == nil {
                result.append(node!.val)
            }

            node = node?.right
        }

        return result
    }
}

