import Foundation

//Quicksort
func quickSort(_ arr: [Int]) -> [Int]{
    guard arr.count > 1 else { return arr }
    
    let pivot = arr[0]
    var low: [Int] = []
    var high: [Int] = []
    
    for index in 1..<arr.count{
        if arr[index] <= pivot{
            low.append(arr[index])
        }else{
            high.append(arr[index])
        }
    }
    let mid = [pivot]
    return quickSort(low) + mid + quickSort(high)
}

