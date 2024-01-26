class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
    let pChars = Array(p)
    var dp = Array(repeating: Array(repeating: false, count: pChars.count + 1), count: sChars.count + 1)
    dp[0][0] = true

    for i in 0...pChars.count {
        if i > 0 && pChars[i - 1] == "*" && dp[0][i - 2] {
            dp[0][i] = true
        }
    }

    for i in 1...sChars.count {
        for j in 1...pChars.count {
            if pChars[j - 1] == sChars[i - 1] || pChars[j - 1] == "." {
                dp[i][j] = dp[i - 1][j - 1]
            } else if pChars[j - 1] == "*" {
                dp[i][j] = dp[i][j - 2] || (dp[i - 1][j] && (sChars[i - 1] == pChars[j - 2] || pChars[j - 2] == "."))
            }
        }
    }

    return dp[sChars.count][pChars.count]
        
    }
}
