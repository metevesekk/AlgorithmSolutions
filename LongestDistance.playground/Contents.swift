import UIKit

import UIKit

func longestDistance(points: [(Int, Int)]) -> Double {
    var maxDistance = 0.0

    for i in 0..<points.count {
        for j in (i+1)..<points.count {
            let (x1, y1) = points[i]
            let (x2, y2) = points[j]
            let distance = sqrt(Double((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)))
            maxDistance = max(maxDistance, distance)
        }
    }

    return maxDistance
}

let konumlar = [(1, 2), (3, 1), (5, 4), (46,33), (76,502)]
print(longestDistance(points: konumlar)) 

