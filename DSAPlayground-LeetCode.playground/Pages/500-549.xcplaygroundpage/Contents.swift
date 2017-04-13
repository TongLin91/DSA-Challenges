import Foundation

//506 Relative Ranks

func findRelativeRanks(_ nums: [Int]) -> [String] {
    var dict: [Int:Int] = [:]
    var finalArr: [String] = nums.map{String($0)}
    for index in 0..<nums.count{
        dict[nums[index]] = index
    }
    var count = 1
    for num in nums.sorted(by: >){
        switch count {
        case 1:
            finalArr[dict[num]!] = "Gold Medal"
        case 2:
            finalArr[dict[num]!] = "Silver Medal"
        case 3:
            finalArr[dict[num]!] = "Bronze Medal"
        default:
            finalArr[dict[num]!] = String(count)
        }
        count += 1
    }
    
    return finalArr
}

