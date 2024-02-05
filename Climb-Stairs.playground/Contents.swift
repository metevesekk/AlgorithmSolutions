class Solution {
    func climbStairs(_ n: Int) -> Int {
        var result = Int()
        if n <= 0 {return 0}
        if n == 1 {return 1}
        if n == 2 {return 2}
        if n > 2 {
            result =  climbStairs(n - 1) + climbStairs(n - 2)
        }
        
        return result
    }
}

class Solution2 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 0 { return 0 }
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        
        var oneStepBefore = 2
        var twoStepsBefore = 1
        var allWays = 0
        
        for _ in 3...n {
            allWays = oneStepBefore + twoStepsBefore
            twoStepsBefore = oneStepBefore
            oneStepBefore = allWays
        }
        
        return allWays
    }
}



var ins = Solution2()
print(ins.climbStairs(90))
