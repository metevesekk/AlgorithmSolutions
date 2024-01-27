class Solution {
    func isValid(_ s: String) -> Bool {
            var stack: [Character] = []
            let validCharacters: Set<Character> = ["(", ")", "{", "}", "[", "]", " "]
            let openBrackets: Set<Character> = ["(", "[", "{"]
            let matchingBrackets: [Character: Character] = [")": "(", "}": "{", "]": "["]

            for char in s {
                if !validCharacters.contains(char) {
                    print("Geçersiz Bir Karakter Girdiniz ")
                    return false
                }

                if openBrackets.contains(char) {
                    if stack.isEmpty || (stack.last != nil && !openBrackets.contains(stack.last!)) {
                        stack.append(char)
                    }
                } else {
                    if stack.isEmpty || stack.removeLast() != matchingBrackets[char]! {
                        return false
                    }
                }
            }
            return stack.isEmpty
        }
}


var ins = Solution()
ins.isValid("([])")
ins.isValid("()[]")
ins.isValid(")(")
ins.isValid("a")
ins.isValid("())")
