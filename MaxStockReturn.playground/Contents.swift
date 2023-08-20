import UIKit

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count >= 1 else { return 0 }
    
    var right = 0
    var left = 0
    var profit = Int.min
    
    for index in 1..<prices.count {
        if prices[index] < prices[right] {
            left = (prices[left] < prices[index] ? left : index)
            right = index
        } else {
            right = index
            profit = max(profit, prices[right]-prices[left])
        }
    }
    
    return max(profit, prices[right]-prices[left])
}

print(maxProfit([7,6,4,3,1]))
print(maxProfit([7,1,5,3,6,4]))
