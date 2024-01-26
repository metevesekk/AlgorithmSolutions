

import UIKit

func maxPoints(tasks: [(points: Int, time: Int)], maxTime: Int) -> Int {

    var dp = [Int](repeating: 0, count: maxTime + 1)


    for task in tasks {
        for currentT in stride(from: maxTime, through: task.time, by: -1) {
            dp[currentT] = max(dp[currentT], dp[currentT - task.time] + task.points)
        }
    }
    return dp[maxTime]
}

let tasks = [(3, 2), (4, 3), (7, 5), (2, 1), (5, 3)]
let maxTime = 8
print(maxPoints(tasks: tasks, maxTime: maxTime))

