import UIKit

func convertZigzag(_ s: String, _ numRows: Int) -> String {

    if numRows == 1 || numRows >= s.count {
        return s
    }
    
    var rows = [String](repeating: "", count: min(numRows, s.count))
    var currentRow = 0
    var goingDown = false
    
    for char in s {
        rows[currentRow] += String(char)
        if currentRow == 0 || currentRow == numRows - 1 {
            goingDown = !goingDown
        }
        currentRow += goingDown ? 1 : -1
    }
    
    return rows.joined()
}

let result = convertZigzag("POLİCEMANS SWEAR TO GOD", 4)
print(result)

